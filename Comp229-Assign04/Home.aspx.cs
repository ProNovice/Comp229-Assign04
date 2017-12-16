using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace Comp229_Assign04
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadModelList();
        }

        private void LoadModelList()
        {
            // Server.MapPath(filePath) returns path based on sever file executed
            // source: https://www.w3schools.com/asp/met_mappath.asp
            var jsonPath = Server.MapPath("Assign04.json");
            // check if file exists
            // prevent error when the file doesn't exists
            if (File.Exists(jsonPath))
            {
                string jsonString = File.ReadAllText(jsonPath);

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                List<Character> characters = (List<Character>)serializer.Deserialize(jsonString, typeof(List<Character>));
                modelList.DataSource = characters;
                modelList.DataBind();
            }
        }


        protected void Update_Click(object sender, EventArgs e)
        {
            string modelName;
            // find item's ID by using RepeaterItem, FindControl("original ID in itemTemplate");
            // source: https://www.aspsnippets.com/Articles/ASPNet-Repeater-CRUD-Select-Insert-Edit-Update-and-Delete-in-Repeater-using-C-and-VBNet.aspx
            DataListItem item = (sender as Button).Parent as DataListItem;
            modelName = (item.FindControl("lblName") as Label).Text;
            Session["ModelName"] = modelName;
            Session["Update"] = true;

            // redirect to Model.aspx, then show Editing form
            Response.Redirect("Model.aspx");

        }
        protected void ViewModel_Click(object sender, EventArgs e)
        {
            string modelName;
            DataListItem item = (sender as Button).Parent as DataListItem;
            modelName = (item.FindControl("lblName") as Label).Text;
            // select model and set Session[]
            Session["ModelName"] = modelName;
            // redirect Model page
            Response.Redirect("Model.aspx");
        }

        protected void SwitchAdditionForm_Click(object sender, EventArgs e)
        {
            SwitchAdditionForm();
        }

        private void SwitchAdditionForm()
        {
            // when additionForm is not visible
            if (!additionForm.Visible)
            {
                subTitle.Text = "Add Model";
                modelList.Visible = false;  // hide the modelList to focus on add a new model
                additionForm.Visible = true;
                btnShowAdditionForm.Text = "Go back to Model List";

            }
            // when additionForm is visible
            else
            {
                subTitle.Text = "Model List";
                modelList.Visible = true;   // resurect modelList
                additionForm.Visible = false;
                btnShowAdditionForm.Text = "Add new Model";
            }
        }

        protected void AddModel_Click(object sender, EventArgs e)
        {
            // save new model into the file
            AddNewModelIntoFile();
        }

        // add new action row through add an action in Model's Actions
        // and databind the repeater
        protected void AddNewActionRow_Click(object sender, EventArgs e)
        {
            // prevent value reset in textBoxes
            UpdateNewModelSession();

            if (Session["NewModel"] != null)
            {
                Character model = Session["NewModel"] as Character;
                List<Action> actionList = model.actions.ToList();
                actionList.Add(new Action());
                model.actions = actionList.ToArray();

                DisplayNewModel();
            }
        }

        // add new specialability row
        protected void AddNewSpecialRow_Click(object sender, EventArgs e)
        {
            UpdateNewModelSession();

            if (Session["NewModel"] != null)
            {
                Character model = Session["NewModel"] as Character;
                List<Specialability> specialList = model.specialAbilities.ToList();
                specialList.Add(new Specialability());
                model.specialAbilities = specialList.ToArray();

                DisplayNewModel();
            }
        }

        private void DisplayNewModel()
        {
            if (Session["NewModel"] != null)
            {
                Character model = Session["NewModel"] as Character;
                // image
                txtImageUrl.Text = model.imageUrl;
                modelImage.Src = model.imageUrl;

                // set data
                txtName.Text = model.name;
                txtFaction.Text = model.faction;
                txtRank.Text = model.rank.ToString();
                txtBase.Text = model._base.ToString();
                txtSize.Text = model.size.ToString();
                txtDeploymentZone.Text = model.deploymentZone;

                // traits
                string traits = string.Join(", ", model.traits);
                txtTraits.Text = traits;

                // types
                string types = string.Join(", ", model.types);
                txtTypes.Text = types;

                // defenseChart
                string defenseChart = string.Join(", ", model.defenseChart);
                txtDefenseChart.Text = defenseChart;

                txtMobility.Text = model.mobility.ToString();
                txtWillpower.Text = model.willpower.ToString();
                txtResiliance.Text = model.resiliance.ToString();
                txtWounds.Text = model.wounds.ToString();

                // actions
                newActionRepeater.DataSource = model.actions;
                newActionRepeater.DataBind();

                // Specialability
                newSpecialRepeater.DataSource = model.specialAbilities;
                newSpecialRepeater.DataBind();
            }
        }
        // set model session
        // also save empty actions or specialability temporally
        private void UpdateNewModelSession()
        {
            Character ch = new Character();
            List<string> traits = new List<string>();
            List<string> types = new List<string>();
            List<string> defenseChart = new List<string>();
            List<Action> actions = new List<Action>();
            List<Specialability> specials = new List<Specialability>();

            ch.name = txtName.Text;
            ch.faction = txtFaction.Text;
            if (!string.IsNullOrEmpty(txtRank.Text))
                ch.rank = Convert.ToInt32(txtRank.Text);
            if (!string.IsNullOrEmpty(txtBase.Text))
                ch._base = Convert.ToInt32(txtBase.Text);
            if (!string.IsNullOrEmpty(txtSize.Text))
                ch.size = Convert.ToInt32(txtSize.Text);
            ch.deploymentZone = txtDeploymentZone.Text;

            traits = txtTraits.Text.Replace(", ", ",").Split(',').ToList();
            ch.traits = traits.ToArray();
            types = txtTypes.Text.Replace(", ", ",").Split(',').ToList();
            ch.types = types.ToArray();
            defenseChart = txtDefenseChart.Text.Replace(", ", ",").Split(',').ToList();
            ch.defenseChart = defenseChart.ToArray();

            if (!string.IsNullOrEmpty(txtMobility.Text))
                ch.mobility = Convert.ToInt32(txtMobility.Text);
            if (!string.IsNullOrEmpty(txtWillpower.Text))
                ch.willpower = Convert.ToInt32(txtWillpower.Text);
            if (!string.IsNullOrEmpty(txtResiliance.Text))
                ch.resiliance = Convert.ToInt32(txtResiliance.Text);
            if (!string.IsNullOrEmpty(txtWounds.Text))
                ch.wounds = Convert.ToInt32(txtWounds.Text);

            // set imageUrl
            if (!string.IsNullOrWhiteSpace(txtImageUrl.Text))
                ch.imageUrl = txtImageUrl.Text;

            // actions
            // do not filter empty action
            foreach (RepeaterItem item in newActionRepeater.Items)
            {
                Action action = new Action();
                action.name = (item.FindControl("txtActName") as TextBox).Text;
                action.type = (item.FindControl("txtActType") as TextBox).Text;
                action.rating = Convert.ToInt32((item.FindControl("txtActRating") as TextBox).Text);
                action.range = (item.FindControl("txtActRange") as TextBox).Text;
                action.description = (item.FindControl("txtActDesc") as TextBox).Text;
                actions.Add(action);
            }
            ch.actions = actions.ToArray();

            // specialability
            // do not filter empty specialability
            foreach (RepeaterItem item in newSpecialRepeater.Items)
            {
                Specialability special = new Specialability();
                special.name = (item.FindControl("txtSpecialName") as TextBox).Text;
                special.description = (item.FindControl("txtSpecialDesc") as TextBox).Text;
                specials.Add(special);
            }
            ch.specialAbilities = specials.ToArray();

            Session["NewModel"] = ch;

        }

        // save model into file
        private void AddNewModelIntoFile()
        {
            // update NewModel Session
            UpdateNewModelSession();

            // add model
            var jsonPath = Server.MapPath("Assign04.json");
            if (File.Exists(jsonPath) && Session["NewModel"] != null)
            {
                Character ch = Session["NewModel"] as Character;
                string jsonString = File.ReadAllText(jsonPath);
                List<Character> characters = JsonConvert.DeserializeObject<List<Character>>(jsonString);

                if (!string.IsNullOrWhiteSpace(txtImageUrl.Text))
                    ch.imageUrl = txtImageUrl.Text;
                else
                {
                    switch (txtFaction.Text)
                    {
                        case "Nasier":
                            ch.imageUrl = "http://www.orderofgamers.com/wordpress/wp-content/uploads/2013/08/wok_nasier.jpg";
                            break;
                        case "Hadross":
                            ch.imageUrl = "http://www.beastsofwar.com/wp-content/uploads/2013/08/House-of-Hadross2.jpg";
                            break;
                        case "Goritsi":
                            ch.imageUrl = "http://www.orderofgamers.com/wordpress/wp-content/uploads/2013/08/wok_goritsi.jpg";
                            break;
                        case "Shael Han":
                            ch.imageUrl = "http://www.orderofgamers.com/wordpress/wp-content/uploads/2013/08/wok_shaelhan.jpg";
                            break;
                        case "Teknes":
                            ch.imageUrl = "http://www.orderofgamers.com/wordpress/wp-content/uploads/2013/08/wok_teknes.jpg";
                            break;
                        default:
                            ch.imageUrl = "http://cdn.playbuzz.com/cdn/7121cb79-6e02-4f50-8208-72b3241734eb/80a7496c-e78d-4d43-9f3f-3604314bc369.jpg";
                            break;
                    }
                }

                // remove empty names' actions
                List<Action> actions = new List<Action>();
                foreach (Action a in ch.actions)
                {
                    // filter actions which don't have their names
                    if (!string.IsNullOrWhiteSpace(a.name))
                        actions.Add(a);
                }
                ch.actions = actions.ToArray();

                // remove empty names' specialabilities
                List<Specialability> specials = new List<Specialability>();
                foreach (Specialability s in ch.specialAbilities)
                {
                    // filter specialabilities which don't have their names
                    if (!string.IsNullOrWhiteSpace(s.name))
                        specials.Add(s);
                }
                ch.specialAbilities = specials.ToArray();

                // add new model
                characters.Add(ch);

                // convert type List<Character> to JsonString
                jsonString = JsonConvert.SerializeObject(characters);

                // write JSON to file
                File.WriteAllText(jsonPath, jsonString);

                // remove Session to reset all values in new additionform
                Session.Remove("NewModel");

                //refresh model list
                LoadModelList();
                SwitchAdditionForm();
            }
        }

        protected void PreviewImageButton_Click(object sender, EventArgs e)
        {
            UpdateNewModelSession();
            DisplayNewModel();
        }       

    }
}
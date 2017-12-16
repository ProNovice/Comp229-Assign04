using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign04
{
    public partial class Model : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetModelData();
                DisplayModel();

                // when the page is redirected from Update button in Home page
                if (Session["Update"] != null)
                {
                    SwitchUpdating(Convert.ToBoolean(Session["Update"]));
                    Session.Remove("Update");   // reset Session["Update"] for next redirecting from "View Detail" in Home page
                }
                else
                    SwitchUpdating(false);
            }
        }

        // get model data from JSON file
        private void GetModelData()
        {
            Character model;
            // Server.MapPath(filePath) returns path based on sever file executed
            var jsonPath = Server.MapPath("Assign04.json");
            // check if file exists and Session["ModelName"]
            if (File.Exists(jsonPath))
            {
                // read text from filePath
                string jsonString = File.ReadAllText(jsonPath);
                List<Character> characters = JsonConvert.DeserializeObject<List<Character>>(jsonString);

                if (Session["ModelName"] != null)
                {
                    // take the character which is selected
                    // source: https://docs.microsoft.com/en-us/dotnet/csharp/linq/write-linq-queries
                    string characterName = Session["ModelName"].ToString();
                    model = (from Character in characters where Character.name == characterName select Character).FirstOrDefault();
                }
                // when the character doesn't exist
                else
                    model = characters.FirstOrDefault();    // take the first character from collection 
                Session["Model"] = model;
            }
        }

        // display model
        private void DisplayModel()
        {
            if (Session["Model"] != null)
            {
                Character model = Session["Model"] as Character;
                // image
                imgModel.Src = model.imageUrl;
                txtImageUrl.Text = model.imageUrl;

                // set data
                txtName.Text = model.name;
                lblName.Text = model.name;
                txtFaction.Text = model.faction;
                lblFaction.Text = model.faction;
                txtRank.Text = model.rank.ToString();
                lblRank.Text = model.rank.ToString();
                txtBase.Text = model._base.ToString();
                lblBase.Text = model._base.ToString();
                txtSize.Text = model.size.ToString();
                lblSize.Text = model.size.ToString();
                txtDeploymentZone.Text = model.deploymentZone;
                lblDeploymentZone.Text = model.deploymentZone;

                // traits
                string traits = string.Join(", ", model.traits);
                txtTraits.Text = traits;
                lblTraits.Text = traits;

                // types
                string types = string.Join(", ", model.types);
                txtTypes.Text = types;
                lblTypes.Text = types;

                // defenseChart
                string defenseChart = string.Join(", ", model.defenseChart);
                txtDefenseChart.Text = defenseChart;
                lblDefenseChart.Text = defenseChart;

                txtMobility.Text = model.mobility.ToString();
                lblMobility.Text = model.mobility.ToString();
                txtWillpower.Text = model.willpower.ToString();
                lblWillpower.Text = model.willpower.ToString();
                txtResiliance.Text = model.resiliance.ToString();
                lblResiliance.Text = model.resiliance.ToString();
                txtWounds.Text = model.wounds.ToString();
                lblWounds.Text = model.wounds.ToString();

                // actions
                actionRepeater.DataSource = model.actions;
                actionRepeater.DataBind();
                updateActionRepeater.DataSource = model.actions;
                updateActionRepeater.DataBind();

                // Specialability
                specialRepeater.DataSource = model.specialAbilities;
                specialRepeater.DataBind();
                updateSpecialRepeater.DataSource = model.specialAbilities;
                updateSpecialRepeater.DataBind();

            }
        }


        protected void Edit_Click(object sender, EventArgs e)
        {
            // switch updating true
            GetModelData();
            SwitchUpdating(true);
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            // set model session
            UpdateModelSession();
            // save model session into file
            UpdateModelFile();
            DisplayModel();
            SwitchUpdating(false);
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            // check if the file exists
            var jsonPath = Server.MapPath("Assign04.json");
            if (File.Exists(jsonPath))
            {
                string jsonString = File.ReadAllText(jsonPath);
                List<Character> characters = JsonConvert.DeserializeObject<List<Character>>(jsonString);

                string modelName = lblName.Text;
                // remove Character whose name is matched with selected character
                // source: https://stackoverflow.com/questions/853526/using-linq-to-remove-elements-from-a-listt
                characters.RemoveAll(c => c.name == modelName);

                // convert type List<Character> to JsonString
                jsonString = JsonConvert.SerializeObject(characters);

                // write JSON to file
                // source: https://www.newtonsoft.com/json/help/html/WriteToJsonFile.htm
                File.WriteAllText(jsonPath, jsonString);
            }
            // redirect Home page
            Response.Redirect("Home.aspx");
        }
        // add new action row through add an action in Model's Actions
        // and databind the repeater
        protected void AddNewActionRow_Click(object sender, EventArgs e)
        {
            if (Session["Model"] != null)
            {
                // prevent value reset in textBoxes
                UpdateModelSession();

                Character model = Session["Model"] as Character;
                List<Action> actionList = model.actions.ToList();
                actionList.Add(new Action());
                model.actions = actionList.ToArray();

                DisplayModel();
            }
        }

        // add new specialability row
        protected void AddNewSpecialRow_Click(object sender, EventArgs e)
        {
            if (Session["Model"] != null)
            {
                UpdateModelSession();

                Character model = Session["Model"] as Character;
                List<Specialability> specialList = model.specialAbilities.ToList();
                specialList.Add(new Specialability());
                model.specialAbilities = specialList.ToArray();

                DisplayModel();
            }
        }



        // set model session
        // also save empty actions or specialability temporally
        private void UpdateModelSession()
        {
            if (Session["Model"] != null)
            {
                Character ch = Session["Model"] as Character;
                string originalName = ch.name;
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

                // actions
                // do not filter empty action
                foreach (RepeaterItem item in updateActionRepeater.Items)
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
                foreach (RepeaterItem item in updateSpecialRepeater.Items)
                {
                    Specialability special = new Specialability();
                    special.name = (item.FindControl("txtSpecialName") as TextBox).Text;
                    special.description = (item.FindControl("txtSpecialDesc") as TextBox).Text;
                    specials.Add(special);
                }
                ch.specialAbilities = specials.ToArray();


                Session["Model"] = ch;
            }
        }

        // save model session into file
        private void UpdateModelFile()
        {
            // update model
            var jsonPath = Server.MapPath("Assign04.json");
            if (File.Exists(jsonPath) && Session["Model"] != null && Session["ModelName"] != null)
            {
                Character ch = Session["Model"] as Character;
                string jsonString = File.ReadAllText(jsonPath);
                List<Character> characters = JsonConvert.DeserializeObject<List<Character>>(jsonString);

                // the name which is not updated yet
                string originalName = Session["ModelName"].ToString();

                var model = (from Character in characters where Character.name == originalName select Character).Single();

                // If use " model = ch; ", temporally it is worked, but the file is not saved properly
                // So its values need to be changed one by one
                model.name = ch.name;
                model.faction = ch.faction;
                model.rank = ch.rank;
                model._base = ch._base;
                model.size = ch.size;
                model.deploymentZone = ch.deploymentZone;
                model.traits = ch.traits;
                model.types = ch.types;
                model.defenseChart = ch.defenseChart;
                model.mobility = ch.mobility;
                model.willpower = ch.willpower;
                model.resiliance = ch.resiliance;
                model.wounds = ch.wounds;
                model.imageUrl = ch.imageUrl;

                // remove empty names' actions
                List<Action> actions = new List<Action>();
                foreach (Action a in ch.actions)
                {
                    // filter actions which don't have their names
                    if (!string.IsNullOrWhiteSpace(a.name))
                        actions.Add(a);
                }
                model.actions = actions.ToArray();

                // remove empty names' specialabilities
                List<Specialability> specials = new List<Specialability>();
                foreach (Specialability s in ch.specialAbilities)
                {
                    // filter specialabilities which don't have their names
                    if (!string.IsNullOrWhiteSpace(s.name))
                        specials.Add(s);
                }
                model.specialAbilities = specials.ToArray();


                // convert type List<Character> to JsonString
                jsonString = JsonConvert.SerializeObject(characters);

                // write JSON to file
                File.WriteAllText(jsonPath, jsonString);

                Session["ModelName"] = model.name;
                Session["Model"] = model;
            }
        }

        private void SwitchUpdating(bool updating)
        {
            // switch visible status
            divImageUrl.Visible = updating;
            txtName.Visible = updating;
            lblName.Visible = !updating;
            txtFaction.Visible = updating;
            lblFaction.Visible = !updating;
            txtRank.Visible = updating;
            lblRank.Visible = !updating;
            txtBase.Visible = updating;
            lblBase.Visible = !updating;
            txtSize.Visible = updating;
            lblSize.Visible = !updating;
            txtDeploymentZone.Visible = updating;
            lblDeploymentZone.Visible = !updating;
            divTraits.Visible = updating;
            lblTraits.Visible = !updating;
            divTypes.Visible = updating;
            lblTypes.Visible = !updating;
            divDefenseCharts.Visible = updating;
            lblDefenseChart.Visible = !updating;
            txtMobility.Visible = updating;
            lblMobility.Visible = !updating;
            txtWillpower.Visible = updating;
            lblWillpower.Visible = !updating;
            txtResiliance.Visible = updating;
            lblResiliance.Visible = !updating;
            txtWounds.Visible = updating;
            lblWounds.Visible = !updating;

            // actions
            actionRepeater.Visible = !updating;
            updateActionRepeater.Visible = updating;
            addNewActionRowButton.Visible = updating;

            // specialability
            specialRepeater.Visible = !updating;
            updateSpecialRepeater.Visible = updating;
            addNewSpecialRowButton.Visible = updating;

            // switch visible status of buttons
            btnEdit.Visible = !updating;
            btnUpdate.Visible = updating;
        }


        protected void PreviewImageButton_Click(object sender, EventArgs e)
        {
            UpdateModelSession();
            DisplayModel();
        }
    }
}
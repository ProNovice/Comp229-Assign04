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
        string jsonString;
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
                jsonString = File.ReadAllText(jsonPath);                
            }

            if (jsonString != null)
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                List<Character> characters = (List<Character>)serializer.Deserialize(jsonString, typeof(List<Character>));
                modelList.DataSource = characters;
                modelList.DataBind();
            }
        }


        protected void Update_Click(object sender, EventArgs e)
        {
            string model;
            // find item's ID by using RepeaterItem, FindControl("original ID in itemTemplate");
            // source: https://www.aspsnippets.com/Articles/ASPNet-Repeater-CRUD-Select-Insert-Edit-Update-and-Delete-in-Repeater-using-C-and-VBNet.aspx
            DataListItem item = (sender as Button).Parent as DataListItem;
            model = (item.FindControl("lblName") as Label).Text;
            Session["Model"] = model;
            Session["Update"] = true;

            // redirect to Model.aspx, then show Editing form
            Response.Redirect("Model.aspx");

        }
        protected void ViewModel_Click(object sender, EventArgs e)
        {
            string model;
            DataListItem item = (sender as Button).Parent as DataListItem;
            model = (item.FindControl("lblName") as Label).Text;
            // select model and set Session[]
            Session["Model"] = model;
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
            Character ch = new Character();
            List<string> traits = new List<string>();
            List<string> types = new List<string>();
            List<string> defenseChart = new List<string>();
            List<Action> actions = new List<Action>();
            List<Specialability> specials = new List<Specialability>();

            ch.name = txtName.Text;
            ch.faction = txtFaction.Text;
            ch.rank = Convert.ToInt32(txtRank.Text);
            ch._base = Convert.ToInt32(txtBase.Text);
            ch.size = Convert.ToInt32(txtSize.Text);
            ch.deploymentZone = txtDeploymentZone.Text;

            ch.mobility = Convert.ToInt32(txtMobility.Text);
            ch.willpower = Convert.ToInt32(txtWillpower.Text);
            ch.resiliance = Convert.ToInt32(txtResiliance.Text);
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

            // check if the file exists
            var jsonPath = Server.MapPath("Assign04.json");
            if (File.Exists(jsonPath))
            {
                string jsonString = File.ReadAllText(jsonPath);
                //JavaScriptSerializer serializer = new JavaScriptSerializer();
                //same as  List<Character> characters = (List<Character>)serializer.Deserialize(jsonText, typeof(List<Character>));
                List<Character> characters = JsonConvert.DeserializeObject<List<Character>>(jsonString);

                // add new model
                characters.Add(ch);

                // convert type List<Character> to JsonString
                jsonString = JsonConvert.SerializeObject(characters);

                // write JSON to file
                // source: https://www.newtonsoft.com/json/help/html/WriteToJsonFile.htm
                File.WriteAllText(jsonPath, jsonString);
            }

            //refresh model list
            LoadModelList();
            SwitchAdditionForm();
        }
        
    }
}
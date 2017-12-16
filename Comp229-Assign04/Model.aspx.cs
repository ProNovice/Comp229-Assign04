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
                LoadModelData();

                // when the page is redirected from Update button in Home page
                if (Session["Update"] != null)
                {
                    SwitchUpdating(Convert.ToBoolean(Session["Update"]));
                    Session.Remove("Update");   // reset Session["Update"] for next redirecting from "View Detail" in Home page
                }
            }
        }

        private void LoadModelData()
        {
            // Server.MapPath(filePath) returns path based on sever file executed
            var jsonPath = Server.MapPath("Assign04.json");
            // check if file exists and Session["Model"]
            if (Session["Model"] != null && File.Exists(jsonPath))
            {
                string jsonString;
                // read text from filePath
                jsonString = File.ReadAllText(jsonPath);
                string characterName = Session["Model"].ToString();

                //JavaScriptSerializer serializer = new JavaScriptSerializer();
                //List<Character> characters = (List<Character>)serializer.Deserialize(jsonText, typeof(List<Character>));
                List<Character> characters = JsonConvert.DeserializeObject<List<Character>>(jsonString);

                // take the character which is selected
                // source: https://docs.microsoft.com/en-us/dotnet/csharp/linq/write-linq-queries
                var character = from Character in characters where Character.name == characterName select Character;

                // when the character doesn't exist
                // source: https://stackoverflow.com/questions/4872946/linq-query-to-select-top-five
                if (character == null)
                    character = (from Character in characters select Character).Take(1);    // take 1 element in the Characters

                //Character ch = (Character)character;

                // take Character var from IEnumerable type character
                foreach (var model in character)
                {
                    imgModel.Src = model.imageUrl;

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
                    txtMobility.Text = model.mobility.ToString();
                    lblMobility.Text = model.mobility.ToString();
                    txtWillpower.Text = model.willpower.ToString();
                    lblWillpower.Text = model.willpower.ToString();
                    txtResiliance.Text = model.resiliance.ToString();
                    lblResiliance.Text = model.resiliance.ToString();
                    txtWounds.Text = model.wounds.ToString();

                    foreach (Action a in model.actions)
                    {

                    }

                    actionRepeater.DataSource = model.actions;
                    actionRepeater.DataBind();
                    updateActionRepeater.DataSource = model.actions;
                    updateActionRepeater.DataBind();
                    //lblWounds.Text = model.wounds.ToString();
                    //grdActions.DataSource = model.actions;
                    //grdActions.DataBind();
                }


            }

        }


        protected void Edit_Click(object sender, EventArgs e)
        {
            // switch updating true
            SwitchUpdating(true);
        }

        protected void Update_Click(object sender, EventArgs e)
        {


            //List<Action> actions = new List<Action>();
            //foreach (TableRow r in actionTable.Rows)
            //{


            //}

            // redirect Model.aspx
            Response.Redirect("Model.aspx");


            //// hide textboxes after updating
            //SwitchUpdating(false);
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            // check if the file exists
            var jsonPath = Server.MapPath("Assign04.json");
            if (File.Exists(jsonPath))
            {
                string jsonString = File.ReadAllText(jsonPath);
                //JavaScriptSerializer serializer = new JavaScriptSerializer();
                //same as  List<Character> characters = (List<Character>)serializer.Deserialize(jsonText, typeof(List<Character>));
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


        private void SwitchUpdating(bool updating)
        {
            // switch visible status
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
            txtMobility.Visible = updating;
            lblMobility.Visible = !updating;
            txtWillpower.Visible = updating;
            lblWillpower.Visible = !updating;
            txtResiliance.Visible = updating;
            lblResiliance.Visible = !updating;
            txtWounds.Visible = updating;
            lblWounds.Visible = !updating;

            updateActionRepeater.Visible = updating;
            actionRepeater.Visible = !updating;

            // switch visible status of buttons
            btnEdit.Visible = !updating;
            btnUpdate.Visible = updating;
        }




    }
}
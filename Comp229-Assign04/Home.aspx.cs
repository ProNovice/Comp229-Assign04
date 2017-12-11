using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Serialization;

namespace Comp229_Assign04
{
    public partial class Home : System.Web.UI.Page
    {
        string jsonText;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadModelList();
        }

        private void LoadModelList()
        {
            var jsonPath = Server.MapPath("Assign04.json");
            // check if file exists
            // prevent error when the file doesn't exists
            if (File.Exists(jsonPath))
            {
                jsonText = File.ReadAllText(jsonPath);

                ////another way to reade JSON file
                //StreamReader reader = new StreamReader(Server.MapPath("Assign04.json"));
                //jsonText = reader.ReadToEnd();
                //// close reader
                //reader.Close();
            };

            if (jsonText != null)
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                List<Character> characters = (List<Character>)serializer.Deserialize(jsonText, typeof(List<Character>));

                ModelList.DataSource = characters;
                ModelList.DataBind();
            }
        }


        protected void Edit_Click(object sender, EventArgs e)
        {
            string model;
            // find item's ID by using RepeaterItem, FindControl("original ID in itemTemplate");
            // source: https://www.aspsnippets.com/Articles/ASPNet-Repeater-CRUD-Select-Insert-Edit-Update-and-Delete-in-Repeater-using-C-and-VBNet.aspx
            DataListItem item = (sender as Button).Parent as DataListItem;
            model = (item.FindControl("lblName") as Label).Text;
            // select model and set Session[]
            Session["Model"] = model;

            // switch visible false to true, true to false
            (item.FindControl("txtName") as TextBox).Visible = true;
            (item.FindControl("lblName") as Label).Visible = false;





            (item.FindControl("btnEdit") as Button).Visible = false;
            (item.FindControl("btnUpdate") as Button).Visible = true;

        }
        protected void Update_Click(object sender, EventArgs e)
        {
            string model;
            // find item's ID by using RepeaterItem, FindControl("original ID in itemTemplate");
            // source: https://www.aspsnippets.com/Articles/ASPNet-Repeater-CRUD-Select-Insert-Edit-Update-and-Delete-in-Repeater-using-C-and-VBNet.aspx
            DataListItem item = (sender as Button).Parent as DataListItem;
            model = (item.FindControl("lblName") as Label).Text;
            Session["Model"] = model;
            

        }
        protected void ViewModel_Click(object sender, EventArgs e)
        {

            Response.Redirect("Model.aspx");

        }
        protected void Addition_Click(object sender, EventArgs e)
        {


        }
    }
}
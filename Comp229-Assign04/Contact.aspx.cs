using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign04
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void SendMailButton_Click(object sender, EventArgs e)
        {
            try
            {
                var jsonPath = Server.MapPath("Assign04.json");
                string jsonString = File.ReadAllText(jsonPath);


                // take all information from the form
                string name = txtName.Text;
                string email = txtEmail.Text;
                string content = jsonString;

                //create a MailMessage to send E-mail
                //Reference: https://msdn.microsoft.com/en-us/library/67w4as51.aspx
                MailMessage message = new MailMessage(email, "pronovice2000@gmail.com", "Contact from " + name, content);   // Syntax: MailMessage( from Mail, to Mail, title, body)            

                //SMTP server and port number
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

                //smtpClient.UseDefaultCredentials = false;
                // Do not use the information stored in the System
                smtpClient.EnableSsl = true;
                // Using Ssl
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                // It is necessary to be authenticated from Gmail.
                smtpClient.Credentials = new System.Net.NetworkCredential("sojeontest01@gmail.com", "thwjsxptmxm"); // the email to use
                // Get authenticated by Gmail address and password

                smtpClient.Send(message);

                message.Dispose(); //clean up the message
                lblResult.Text = "Successfully the suggestion sent.";   // feedback success message;
            }
            catch (Exception exception)
            {
                lblResult.Text = "Failed sending the suggestion.";// feedback fail message
            }

        }
    }
}
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
            //JSON path to attach
            var jsonPath = Server.MapPath("Assign04.json");
            //SMTP server and port number

            // the given Email address cannot be authenticated, so another Email was used
            //SmtpClient smtpClient = new SmtpClient("smtp-mail.outlook.com", 587);
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            try
            {


                // take all information from the form
                string name = txtName.Text;
                string email = txtEmail.Text;
                string content = "";

                //create a MailMessage to send E-mail
                //reference: https://msdn.microsoft.com/en-us/library/67w4as51.aspx
                MailMessage message = new MailMessage(email, "cc-comp229f2016@outlook.com", "New suggestion from " + name, content);   // Syntax: MailMessage( from Mail, to Mail, title, body)            

                //attach JSON file
                //reference: https://stackoverflow.com/questions/15017132/how-to-send-email-with-attachment-in-asp-net
                Attachment file = new Attachment(jsonPath);
                message.Attachments.Add(file);

                // Using Ssl
                smtpClient.EnableSsl = true;
                // Do not use the information stored in the System
                smtpClient.UseDefaultCredentials = false;
                // It is necessary to be authenticated
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

                // the given Email address cannot be authenticated, so another Email was used
                //smtpClient.Credentials = new System.Net.NetworkCredential("cc-comp229f2016@outlook.com", "password");

                smtpClient.Credentials = new System.Net.NetworkCredential("sojeontest01@gmail.com", "thwjsxptmxm"); // the email to use
                smtpClient.Send(message);
                message.Dispose(); //clean up the message
                lblResult.Text = "Successfully the suggestion sent.";   // feedback success message;
            }
            catch (Exception exception)
            {
                lblResult.Text = "Failed sending the suggestion." + exception.ToString();// feedback fail message
            }

        }
    }
}
using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Net.Mail;

using System.Configuration;

using System.IO;



    public static class MailerService
    {
        public static void SendEmail(String receiverEmailId,String receiverName, String mailSubject,String mailBody)

        {
            //calling for creating the email body with html template   

            string body =createEmailBody(receiverName, mailBody);

            sendMail(receiverEmailId, mailSubject, body);

        }

        private static string createEmailBody(string userName,string mailBody)

        {

            string body = string.Empty;
            //using streamreader for reading my htmltemplate   

            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Stationery_Acknowledgement.html")))

            {

                body = reader.ReadToEnd();

            }

            body = body.Replace("{UserName}", userName); //replacing the required things  

            body = body.Replace("{Message}", mailBody);

            return body;

        }
        public static void  sendMail(String receiverEmailId,String mailSubject,String mailBody)
        {
            String senderMailID = "autoreplyssis@gmail.com";
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    // GridView1.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    MailMessage mm = new MailMessage(senderMailID, receiverEmailId);
                    mm.Subject = mailSubject;
                    mm.Body = mailBody +""; 
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                    NetworkCred.UserName = senderMailID;
                    NetworkCred.Password = "ssis123$";
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                }
            }
        }
        
    }

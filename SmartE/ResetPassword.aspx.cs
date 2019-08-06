using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SmartE
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spResetPassword", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramUsername = new SqlParameter("@UserName", txtUserName.Text);
                cmd.Parameters.Add(paramUsername);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (Convert.ToBoolean(rdr["ReturnCode"]))
                    {
                        SendPasswordResetEmail(rdr["EmailID"].ToString(), txtUserName.Text, rdr["UniqueId"].ToString());
                        lblMessage.Text = "An email with instructions to reset your password is sent to your registered email";
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Username not found!";
                    }
                }
            }
        }

        private void SendPasswordResetEmail(string ToEmail, string UserName, string UniqueId)
        {

            try
            {
                // MailMessage class is present is System.Net.Mail namespace
                MailMessage mailMessage = new MailMessage("heena.ah9@gmail.com", ToEmail);

                // StringBuilder class is present in System.Text namespace
                StringBuilder sbEmailBody = new StringBuilder();
                sbEmailBody.Append("Dear " + UserName + ",<br/><br/>");
                sbEmailBody.Append("Please click on the following link to reset your password");
                sbEmailBody.Append("<br/>"); sbEmailBody.Append("http://localhost:64736/ChangePassword.aspx?uid=" + UniqueId);
                sbEmailBody.Append("<br/><br/>");
                sbEmailBody.Append("<b>Smart Elector</b>");

                mailMessage.IsBodyHtml = true;

                mailMessage.Body = sbEmailBody.ToString();
                mailMessage.Subject = "Reset Your Password";

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                //smtpClient.Port = 587;
                //smtpClient.EnableSsl = true;
              //  smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
               // smtpClient.UseDefaultCredentials = false;
                smtpClient.Timeout = 100000;
                smtpClient.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "heena.ah9@gmail.com",
                    Password = "hinalyan123"
                };

                smtpClient.EnableSsl = true;
                if (!smtpClient.EnableSsl)
                {
                    lblMessage0.Visible = true;
                    lblMessage0.Text = "Mail not sent";
                }
                else
                {
                    smtpClient.Send(mailMessage);
                    lblMessage0.Text = "Message send ";

                }

            }
            catch (Exception ex)
            {
                lblException.Text = "Record Insert Exception: " + ex.Message + " <br />  " + ex.InnerException;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartE
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblErrorMessage.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataAccessLayer loginDAL = new DataAccessLayer();
            string username = txtUsername.Text;
            string password = Security.GetHash256(txtPassword.Text, txtUsername.Text);


            if (loginDAL.VerifyAdminUser(username, password))
            {
                lblErrorMessage.Visible = false;
                HttpCookie cookie = new HttpCookie("user");
                cookie.Values["username"] = loginDAL.getUsername();
                cookie.Values["userprofile"] = loginDAL.getUserProfile();
                cookie.Expires = DateTime.Now.AddDays(3);

                Response.Cookies.Add(cookie);
                Response.Redirect("DashboardAdmin.aspx");
            }
            else if (loginDAL.VerifyElectorUser(username, password))
            {
                lblErrorMessage.Visible = false;
                HttpCookie cookie = new HttpCookie("user");
                cookie.Values["username"] = loginDAL.getUsername();
                cookie.Values["userprofile"] = loginDAL.getUserProfile();
                cookie.Expires = DateTime.Now.AddDays(3);

                Response.Cookies.Add(cookie);
                Response.Redirect("DashboardElectors.aspx");
            }
            else if (loginDAL.VerifyCandidateUser(username, password))
            {
                lblErrorMessage.Visible = false;
                HttpCookie cookie = new HttpCookie("user");
                cookie.Values["username"] = loginDAL.getUsername();
                cookie.Values["userprofile"] = loginDAL.getUserProfile();
                cookie.Expires = DateTime.Now.AddDays(3);

                Response.Cookies.Add(cookie);
                Response.Redirect("DashboardCandidate.aspx");
            }
            else
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Please enter valid Username or Password!";
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        
    }
}
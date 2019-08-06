using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartE
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.Request.Cookies["user"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    HttpCookie cookie = Request.Cookies["user"];
                    lblWelcome.Text = "Welcome " + cookie["username"] + "!";
                    
                }
            }
        }

        protected void btnManageUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageUsers.aspx");
        }

        protected void btnManageManifesto_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageRoles.aspx");
        }

        protected void btnManageBallot_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageVotes.aspx");
        }

        protected void btnDonations_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageDonations.aspx");
        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardAdmin.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];
            cookie.Expires = DateTime.Now.AddDays(-3);
            Response.Cookies.Remove("user");
            Response.Redirect("Login.aspx");
        }
    }
}
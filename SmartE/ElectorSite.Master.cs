using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartE
{
    public partial class Site3 : System.Web.UI.MasterPage
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
                    //lblWelcome.Text = "Welcome " + cookie["username"] + "!";
                    btnLogout.Text = "Welcome " + cookie["username"] + "!, Logout";

                }
            }
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
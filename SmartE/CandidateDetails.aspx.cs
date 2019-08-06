using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SmartE
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void btnHome_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnVote_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];
           
            Response.Redirect("VoteHere.aspx");
        }

        protected void btnResults_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];
           
            Response.Redirect("DashBoardElectors.aspx");
        }



        protected void btnCandidates_Click(object sender, EventArgs e)
        {

        }

      
    }
}
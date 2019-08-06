using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SmartE
{
    public partial class WebForm30 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            if (dt != null)
            {

                lblItem.Text = dt.Rows.Count.ToString();
            }
            else
            {
                lblItem.Text = "0";
            }
        }

        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "addtocart")
            {
                //Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString());
                //DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
                DropDownList dlist = (DropDownList)FormView1.Row.FindControl("DropDownList1");
                Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + dlist.SelectedItem.ToString());

            }
        }
    }
}
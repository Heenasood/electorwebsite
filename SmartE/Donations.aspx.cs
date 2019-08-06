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
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["buyitems"] = "false";
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

            if(!IsPostBack)
            {
                Int64 originalprice;
                Int64 discount;
                Int64 discountprice;
                Int64 newprice;

                String mycon = "Data Source = 09185706-HEENA; Initial Catalog = smartElector; Integrated Security =True";
                String myquery = "Select * from Donations";
                SqlConnection con = new SqlConnection(mycon);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable ds = new DataTable();
                ds.Columns.Add("NewPrice");
                da.Fill(ds);

                foreach (DataRow dr in ds.Rows)
                {
                    originalprice = int.Parse(dr["DonationAmount"].ToString());
                    discount = int.Parse(dr["Discount"].ToString());
                    discountprice = (originalprice * discount) / 100;
                    newprice = originalprice - discountprice;
                    dr["NewPrice"] = newprice;
                }

                dlCandidateInfo.DataSource = ds;
                dlCandidateInfo.DataBind();
            }
        }

        protected void dlCandidateInfo_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";
            DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + dlist.SelectedItem.ToString());
            //if (e.CommandName == "addtocart")
            //{
            //    //Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString());
            //    DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            //    Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + dlist.SelectedItem.ToString());

            //}
        }

        protected void dlCandidateInfo_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Int64 originalprice;
            Int64 discount;
            Int64 discountprice;
            Int64 newprice;

            Label lblDiscount = e.Item.FindControl("lblDiscount") as Label;

            Label lblDiscountedPrice = e.Item.FindControl("lblDiscountedPrice") as Label;
            Label lb3 = e.Item.FindControl("lblDonateID") as Label;
            String mycon = "Data Source = 09185706-HEENA; Initial Catalog = smartElector; Integrated Security =True";
            String myquery = "Select * from Donations where DonateID=" + lb3.Text;
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable ds = new DataTable();
            ds.Columns.Add("NewPrice");
            da.Fill(ds);

            foreach (DataRow dr in ds.Rows)
            {
                originalprice = int.Parse(dr["DonationAmount"].ToString());
                discount = int.Parse(dr["Discount"].ToString());
                discountprice = (originalprice * discount) / 100;
                newprice = originalprice - discountprice;
                dr["NewPrice"] = newprice;
            }

            

            //if (ds.Rows.Count > 0)
            //{
            //    DataRow dr = ds.Rows[0];
            //    originalprice = int.Parse(dr["DonationAmount"].ToString());
            //    discount = int.Parse(dr["Discount"].ToString());
            //    discountprice = (originalprice * discount) / 100;
            //    newprice = originalprice - discountprice;
            //    lblDiscount.Text = "Discount ( " + discount.ToString() + "% ) NZ&nbsp;$" + discountprice.ToString();
            //    lblDiscountedPrice.Visible = true;

            //    lblDiscountedPrice.Text = "NZ&nbsp;$" + newprice.ToString();

            //}
            con.Close();
        }
    }
}
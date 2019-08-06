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
    public partial class WebForm27 : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
            }
            else
            {
                if (Request.QueryString["donateID"] != null)
                {

                    dt = (DataTable)Session["buyitems"];

                    string statement = "DonateID = '" + Request.QueryString["donateID"] + "'";

                    DataRow [] dr = dt.Select(statement);

                    lblDonationID.Text = dr[0]["DonateID"].ToString();
                    lblDonationtype.Text = dr[0]["DonationType"].ToString();
                    lblDonationName.Text = dr[0]["DonationName"].ToString();
                    lblAmount.Text = dr[0]["DonationAmount"].ToString();
                    DropDownList1.Text = dr[0]["quantity"].ToString();
                    lblTotalPrice.Text = dr[0]["totalprice"].ToString();

                    //for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    //{
                    //    int sr;
                    //    int sr1;
                    //    sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                    //    lblSno.Text = Request.QueryString["sno"];
                    //    lblDonationID.Text = sr.ToString();
                    //    sr1 = Convert.ToInt32(lblSno.Text);
                    //    //sr1 = sr1 + 1;


                    //    if (sr == sr1)
                    //    {
                    //        //lblSno.Text = dt.Rows[i]["sno"].ToString();
                    //        lblDonationID.Text = dt.Rows[i]["DonateID"].ToString();
                    //        lblDonationtype.Text = dt.Rows[i]["DonationType"].ToString();
                    //        lblDonationName.Text = dt.Rows[i]["DonationName"].ToString();
                    //        lblAmount.Text = dt.Rows[i]["DonationAmount"].ToString();
                    //        DropDownList1.Text = dt.Rows[i]["quantity"].ToString();
                    //        lblTotalPrice.Text = dt.Rows[i]["totalprice"].ToString();
                    //        break;

                    //    }
                    //}
                }
                else
                {
                }

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int q;
            q = Convert.ToInt32(DropDownList1.Text);
            int cost;
            cost = Convert.ToInt32(lblAmount.Text);
            int totalcost;
            totalcost = cost * q;
            lblTotalPrice.Text = totalcost.ToString();
        }

        protected void save_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["buyitems"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                string donateID = dt.Rows[i]["DonateID"].ToString();

                if (Request.QueryString["donateID"] == donateID)
                {
                    dt.Rows[i]["DonateID"] = lblDonationID.Text;
                    dt.Rows[i]["DonationType"] = lblDonationtype.Text;
                    dt.Rows[i]["DonationName"] = lblDonationName.Text;
                    dt.Rows[i]["DonationAmount"] = lblAmount.Text;
                    dt.Rows[i]["quantity"] = DropDownList1.Text;
                    dt.Rows[i]["totalprice"] = lblTotalPrice.Text;
                    dt.AcceptChanges();

                    break;
                }
            }
            Response.Redirect("AddtoCart.aspx");
        }
    }
    }

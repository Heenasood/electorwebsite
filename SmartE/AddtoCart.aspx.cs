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
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    // Add new item to DataTable
                    AddItemToCart(Request.QueryString["id"]);
                }

                if (Session["buyitems"] != null)
                {
                    // Update Session for changes in quantity
                    UpdateCartQuantity();
                    dt = (DataTable)Session["buyitems"];
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[5].Text = "Total Amount";
                    GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                }
            }
            //if (!IsPostBack)
            //{

            //    //DataTable dt = new DataTable();
            //    //dt.Columns.Add("sno");
            //    //dt.Columns.Add("DonateID");
            //    //dt.Columns.Add("DonationType");
            //    //dt.Columns.Add("DonationName");
            //    //dt.Columns.Add("DonationImage");
            //    //dt.Columns.Add("DonationAmount");
            //    //dt.Columns.Add("quantity");
            //    //dt.Columns.Add("totalprice");
            //    //dt.Columns.Add("Discount");
            //    //dt.Columns.Add("discountprice");


            //    if (Request.QueryString["id"] != null)
            //    {
            //        // Check in id exists in the Session

            //        if (Session["buyitems"] == null)
            //        {
            //            DataTable dt = new DataTable();
            //            dt.Columns.Add("sno");
            //            dt.Columns.Add("DonateID");
            //            dt.Columns.Add("DonationType");
            //            dt.Columns.Add("DonationName");
            //            dt.Columns.Add("DonationImage");
            //            dt.Columns.Add("DonationAmount");
            //            dt.Columns.Add("quantity");
            //            dt.Columns.Add("totalprice");
            //            dt.Columns.Add("Discount");
            //            dt.Columns.Add("discountprice");
            //            PopulateCart(dt);
            //        } else
            //        {
            //            PopulateCart((DataTable)Session["buyitems"]);
            //        }


            //            GridView1.FooterRow.Cells[5].Text = "Total Amount";
            //            GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
            //            Response.Redirect("AddtoCart.aspx");

            //    }
            //    else
            //    {
            //        if(Session["buyitems"] != null)
            //        {
            //            PopulateCart((DataTable)Session["buyitems"]);
            //        } else
            //        {
            //            GridView1.DataSource = (DataTable)Session["buyitems"];
            //            GridView1.DataBind();
            //        }


            //        if (GridView1.Rows.Count > 0)
            //        {
            //            GridView1.FooterRow.Cells[5].Text = "Total Amount";
            //            GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

            //        }
            //    }
            //    lblItem.Text = GridView1.Rows.Count.ToString();

            //} 

        }

        private void UpdateCartQuantity()
        {
            DataTable dt = (DataTable)Session["buyitems"];

            foreach (DataRow dr in dt.Rows)
            {
                dr["quantity"] = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                int DonationAmount = Convert.ToInt16(dr["DonationAmount"].ToString());
                int totalprice = DonationAmount * quantity;
                int originalprice = int.Parse(dr["DonationAmount"].ToString());
                float discount = float.Parse(dr["Discount"].ToString());
                float discountprice = totalprice - ((totalprice * discount) / 100);
            }

            Session["buyitems"] = dt;
        }


        private void AddItemToCart(string itemID)
        {
            bool isNewItem = true;

            if (Session["buyitems"] != null)
            {
                dt = (DataTable)Session["buyitems"];

            }
            else
            {
                // Create new DataTable
                dt = new DataTable();
                dt.Columns.Add("DonateID");
                dt.Columns.Add("DonationType");
                dt.Columns.Add("DonationName");
                dt.Columns.Add("DonationImage");
                dt.Columns.Add("DonationAmount");
                dt.Columns.Add("quantity");
                dt.Columns.Add("totalprice");
                dt.Columns.Add("Discount");
                dt.Columns.Add("discountprice");
            }


            foreach (DataRow dataRow in dt.Rows)
            {
                if (dataRow["DonateID"].ToString() == itemID)
                {
                    isNewItem = false;
                    dataRow["quantity"] = int.Parse(dataRow["quantity"].ToString()) + 1;
                    int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                    int DonationAmount = Convert.ToInt16(dataRow["DonationAmount"].ToString());
                    int totalprice = DonationAmount * quantity;
                    int originalprice = int.Parse(dataRow["DonationAmount"].ToString());
                    float discount = float.Parse(dataRow["Discount"].ToString());
                    //int discountamount = (totalprice * discount) / 100;
                    float discountprice = totalprice - ((totalprice * discount) / 100);

                    dataRow["discountprice"] = discountprice * quantity;
                    break;
                }
            }

            if (isNewItem)
            {

                DataRow dr = dt.NewRow();
                String mycon = "Data Source=09185706-HEENA;Initial Catalog=smartElector;Integrated Security=True";
                SqlConnection scon = new SqlConnection(mycon);

                String myquery = "select * from Donations where DonateID=" + itemID;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = scon;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);

                dr["DonateID"] = ds.Tables[0].Rows[0]["DonateID"].ToString();
                dr["DonationType"] = ds.Tables[0].Rows[0]["DonationType"].ToString();
                dr["DonationName"] = ds.Tables[0].Rows[0]["DonationName"].ToString();
                dr["DonationImage"] = ds.Tables[0].Rows[0]["DonationImage"].ToString();
                dr["quantity"] = Request.QueryString["quantity"];
                dr["DonationAmount"] = ds.Tables[0].Rows[0]["DonationAmount"].ToString();
                int DonationAmount = Convert.ToInt16(ds.Tables[0].Rows[0]["DonationAmount"].ToString());
                dr["Discount"] = "0." + ds.Tables[0].Rows[0]["Discount"].ToString();
                int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                int totalprice = DonationAmount * quantity;
                dr["totalprice"] = totalprice;

                float originalprice = float.Parse(dr["DonationAmount"].ToString());
                float discount = float.Parse(dr["Discount"].ToString());
                float discountprice = totalprice - (totalprice * discount);

                dr["discountprice"] = discountprice * quantity;

                dt.Rows.Add(dr);
            }

            Session["buyitems"] = dt;
        }


        //private void PopulateCart(DataTable dt) {

        //    string donationID = Request.QueryString["id"];

        //    bool exists = false;

        //    foreach(DataRow dataRow in dt.Rows)
        //    {
        //        if(dataRow["DonateID"].ToString() == donationID)
        //        {
        //            exists = true;
        //            dataRow["quantity"] = int.Parse(dataRow["quantity"].ToString()) + 1;
        //            int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
        //            int DonationAmount = Convert.ToInt16(dataRow["DonationAmount"].ToString());
        //            int totalprice = DonationAmount * quantity;
        //            int originalprice = int.Parse(dataRow["DonationAmount"].ToString());
        //            float discount = float.Parse(dataRow["Discount"].ToString());
        //            //int discountamount = (totalprice * discount) / 100;
        //            float discountprice = totalprice - ((totalprice * discount) / 100);

        //            dataRow["discountprice"] = discountprice * quantity;
        //        }
        //    }

        //    if (exists)
        //    {

        //    }
        //    else {

        //        DataRow dr = AddItemToCart(dt);
        //        dt.Rows.Add(dr);
        //    }

        //    Session["buyitems"] = dt;

        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();
        //}

        //private DataRow AddItemToCart(DataTable dt)
        //{
        //    DataRow dr = dt.NewRow();
        //    String mycon = "Data Source = 09185706-HEENA; Initial Catalog = smartElector; Integrated Security =True";
        //    SqlConnection scon = new SqlConnection(mycon);

        //    String myquery = "select * from Donations where DonateID=" + Request.QueryString["id"];
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = myquery;
        //    cmd.Connection = scon;
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    da.SelectCommand = cmd;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);

        //    dr["DonateID"] = ds.Tables[0].Rows[0]["DonateID"].ToString();
        //    dr["DonationType"] = ds.Tables[0].Rows[0]["DonationType"].ToString();
        //    dr["DonationName"] = ds.Tables[0].Rows[0]["DonationName"].ToString();
        //    dr["DonationImage"] = ds.Tables[0].Rows[0]["DonationImage"].ToString();
        //    dr["quantity"] = Request.QueryString["quantity"];
        //    //dr["quantity"] = ds.Tables[0].Rows[0]["quantity"].ToString();
        //    dr["DonationAmount"] = ds.Tables[0].Rows[0]["DonationAmount"].ToString();
        //    int DonationAmount = Convert.ToInt16(ds.Tables[0].Rows[0]["DonationAmount"].ToString());
        //    dr["Discount"] = "0." + ds.Tables[0].Rows[0]["Discount"].ToString();
        //    int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
        //    int totalprice = DonationAmount * quantity;
        //    dr["totalprice"] = totalprice;

        //    int originalprice = int.Parse(dr["DonationAmount"].ToString());
        //    float discount = float.Parse(dr["Discount"].ToString());
        //    //int discountamount = (totalprice * discount) / 100;
        //    float discountprice = totalprice - (totalprice * discount);
        //    //discount = Convert.ToInt64(ds.Tables[0].Rows[0]["discount"].ToString());
        //    //discountprice = (originalprice * discount) / 100;
        //    //newprice = originalprice - discountprice;

        //    dr["discountprice"] = discountprice * quantity;

        //    return dr;
        //}

        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["discountprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)Session["buyitems"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                string donateID = dt.Rows[i]["DonateID"].ToString();

                if (GridView1.DataKeys[e.RowIndex].Value.ToString() == donateID)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    break;
                }
            }

                    //DataTable dt = new DataTable();
                    //dt = (DataTable)Session["buyitems"];

                    //for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    //{
                    //    int sr;
                    //    int sr1;
                    //    string qdata;
                    //    string dtdata;
                    //    sr = Convert.ToInt32(dt.Rows[i]["DonateID"].ToString());
                    //    TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                    //    qdata = cell.Text;
                    //    dtdata = sr.ToString();
                    //    sr1 = Convert.ToInt32(qdata);

                    //    if (sr == sr1)
                    //    {
                    //        dt.Rows[i].Delete();
                    //        dt.AcceptChanges();
                    //        //Label1.Text = "Item Has Been Deleted From Shopping Cart";
                    //        break;

                    //    }
                    //}

                    //for (int i = 1; i <= dt.Rows.Count; i++)
                    //{
                    //    dt.Rows[i - 1]["sno"] = i;
                    //    dt.AcceptChanges();
                    //}

                    Session["buyitems"] = dt;
            Response.Redirect("AddToCart.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Redirect("EditOrder.aspx?sno=" + GridView1.SelectedRow.Cells[0].Text);
            Response.Redirect("EditOrder.aspx?donateID=" + GridView1.SelectedRow.Cells[0].Text);
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
             
            Response.Redirect("PlaceOrder.aspx");
           
        }
    }
    }

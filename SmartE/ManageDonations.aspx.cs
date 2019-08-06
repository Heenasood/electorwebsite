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
    public partial class WebForm9 : System.Web.UI.Page
    {
        DataAccessLayer DAL;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblErrorMessage.Visible = false;
                GridBind();
            }
        }

        private void GridBind()
        {
            DAL = new DataAccessLayer();
            DataTable dtbl = DAL.GetAllDonations();
            grdViewDonation.DataSource = dtbl;
            grdViewDonation.DataBind();
        }

        


        protected void grdViewDonation_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertRow")
            {

                DataAccessLayer DAL = new DataAccessLayer();
                string DonationType = ((DropDownList)grdViewDonation.FooterRow.FindControl("ddlInsertDonationType")).SelectedValue;
                string DonationName = ((TextBox)grdViewDonation.FooterRow.FindControl("txtInsertDonationName")).Text;
                string DonationDesc = ((TextBox)grdViewDonation.FooterRow.FindControl("txtInsertDonationDesc")).Text;
                TextBox DonationAmt = (TextBox)grdViewDonation.FooterRow.FindControl("txtInsertDonationAmount");
                int DonationAmount = Convert.ToInt32(DonationAmt.Text);
                //int DonationAmount = Convert.ToInt32((TextBox)grdViewDonation.FooterRow.FindControl("txtInsertDonationAmount"));
                string DonationStatus = ((DropDownList)grdViewDonation.FooterRow.FindControl("ddlInsertStatus")).SelectedValue;
                string Promotion = ((DropDownList)grdViewDonation.FooterRow.FindControl("ddlInsertPromotions")).SelectedValue;
                TextBox Discount = (TextBox)grdViewDonation.FooterRow.FindControl("txtInsertDiscount");
                int DiscountAmount = Convert.ToInt32(Discount.Text);

                if (((FileUpload)grdViewDonation.FooterRow.FindControl("fuInsertDonationImage")).HasFile)
                {
                    string DonationImage = ((FileUpload)grdViewDonation.FooterRow.FindControl("fuInsertDonationImage")).FileName;
                    ((FileUpload)grdViewDonation.FooterRow.FindControl("fuInsertDonationImage")).PostedFile.SaveAs(Server.MapPath(".") + "/images/" + DonationImage);
                    String pathDonationImages = "/images/" + DonationImage.ToString();
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "New Donations has been created for <b>" + DonationName + "</b>";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                    DataAccessLayer.InsertDonation(DonationType, DonationName, DonationDesc, pathDonationImages, DonationAmount, DonationStatus, Promotion, DiscountAmount);
                    GridBind();
                }


            }

            else if (e.CommandName == "EditRow")
            {
                lblErrorMessage.Visible = false;
                int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                grdViewDonation.EditIndex = rowIndex;
                GridBind();
            }
            else if (e.CommandName == "DeleteRow")
            {
                lblErrorMessage.Visible = false;
                DataAccessLayer.DeleteDonations(Convert.ToInt32(e.CommandArgument));
                GridBind();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                lblErrorMessage.Visible = false;
                grdViewDonation.EditIndex = -1;
                GridBind();
            }
            else if (e.CommandName == "UpdateRow")
            {
                lblErrorMessage.Visible = false;
                int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                int DonationID = Convert.ToInt32(e.CommandArgument);

                string DonationType = ((DropDownList)grdViewDonation.Rows[rowIndex].FindControl("ddlEditDonationType")).SelectedValue;
                string DonationName = ((TextBox)grdViewDonation.Rows[rowIndex].FindControl("txtEditDonationName")).Text;
                string DonationDesc = ((TextBox)grdViewDonation.Rows[rowIndex].FindControl("txtEditDonationDesc")).Text;
                TextBox DonationAmt = (TextBox)grdViewDonation.Rows[rowIndex].FindControl("txtEditDonationAmount");
                int DonationAmount = Convert.ToInt32(DonationAmt.Text);
                //int DonationAmount = Convert.ToInt32((TextBox)grdViewDonation.Rows[rowIndex].FindControl("txtEditDonationAmount"));
                string DonationStatus = ((DropDownList)grdViewDonation.Rows[rowIndex].FindControl("ddlEditStatus")).SelectedValue;
                string Promotion = ((DropDownList)grdViewDonation.Rows[rowIndex].FindControl("ddlEditPromotions")).SelectedValue;
                TextBox Discount = (TextBox)grdViewDonation.Rows[rowIndex].FindControl("txtEditDiscount");
                int DiscountAmount = Convert.ToInt32(Discount.Text);

                DataAccessLayer.UpdateDonation(DonationID, DonationType, DonationName, DonationDesc, DonationAmount, DonationStatus, Promotion, DiscountAmount);
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Informations has been updated for <b>" + DonationName + "</b>";
                lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                grdViewDonation.EditIndex = -1;
                GridBind();
            }
        }
    }
}
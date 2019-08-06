using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace SmartE
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        DataAccessLayer DAL;
        string searchBy;
        string input;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblSearchError.Visible = false;
                lblUserErrorMessage.Visible = false;
                lblUserException.Visible = false;
                GridBind();
            }
        }

        public void GridBind()
        {
            try
            {
                DAL = new DataAccessLayer();
                DataTable dtbl = DAL.GetAllUsers();
                grdViewUsers.DataSource = dtbl;
                grdViewUsers.DataBind();
            }
            catch(Exception ex)
            {
                lblUserErrorMessage.Visible = true;
                lblUserErrorMessage.Text = "Exception Occur in Binding: "+ex.Message;
                lblUserErrorMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void GridSearch()
        {
            try
            {

                lblUserException.Visible = false;
                string txtSearchValue = txtSearch.Text.ToLower();
                int length = txtSearchValue.Length;
                try
                {

                    if (length >= 3)
                    {
                        DAL = new DataAccessLayer();
                        DataTable dtbl = DAL.GetSearchUsers(ddlSearch.SelectedValue, txtSearch.Text);
                        int countrow = dtbl.Rows.Count;
                        if (countrow == 0)
                        {
                            lblSearchError.Visible = true;
                            lblSearchError.Text = "No Records Found";
                            lblSearchError.ForeColor = System.Drawing.Color.Red;
                            grdViewUsers.Visible = false;
                            lblUserException.Visible = false;

                        }
                        else
                        {
                            lblSearchError.Visible = false;
                            grdViewUsers.Visible = true;
                            grdViewUsers.DataSource = dtbl;
                            grdViewUsers.DataBind();
                        }
                    }
                    else
                    {
                        lblUserErrorMessage.Visible = false;
                        lblSearchError.Visible = true;
                        lblSearchError.Text = "Please enter minimum 3 characters";
                        lblSearchError.ForeColor = System.Drawing.Color.Red;
                        lblUserException.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    lblUserErrorMessage.Visible = false;
                    lblUserException.Visible = true;
                    lblUserException.Text = "Exception Occur in Search: " + ex.Message;
                    lblUserException.ForeColor = System.Drawing.Color.Red;
                }

            }
            catch (Exception ex)
            {
                lblUserException.Visible = true;
                lblUserException.Text = "Exception Occur: " + ex.Message;
                lblUserException.ForeColor = System.Drawing.Color.Red;
            }

        }


        protected void grdViewUsers_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            int ddl = ddlSearch.SelectedValue.Length;
            int txt = txtSearch.Text.Length;

            if (e.CommandName == "InsertRow")
            {
                try
                {
                    DataAccessLayer DAL = new DataAccessLayer();
                    string Username = ((TextBox)grdViewUsers.FooterRow.FindControl("txtInsertUserName")).Text;
                    string Firstname = ((TextBox)grdViewUsers.FooterRow.FindControl("txtInsertFirstName")).Text;
                    string Lastname = ((TextBox)grdViewUsers.FooterRow.FindControl("txtInsertLastName")).Text;
                    string EmailID = ((TextBox)grdViewUsers.FooterRow.FindControl("txtInsertEmailID")).Text;
                    string Passport = ((TextBox)grdViewUsers.FooterRow.FindControl("txtInsertPassport")).Text;
                    string Gender = ((DropDownList)grdViewUsers.FooterRow.FindControl("ddlInsertGender")).SelectedValue;
                    string Mobile = ((TextBox)grdViewUsers.FooterRow.FindControl("txtInsertMobile")).Text;
                    string pwd = ((TextBox)grdViewUsers.FooterRow.FindControl("txtInsertPassword")).Text;
                    string Password = Security.GetHash256(pwd, Username);
                    string UserProfile = ((DropDownList)grdViewUsers.FooterRow.FindControl("ddlInsertUserProfile")).SelectedValue;
                    string Status = ((DropDownList)grdViewUsers.FooterRow.FindControl("ddlInsertStatus")).SelectedValue;
                    if (DAL.UsernameExists(Username))
                    {
                        lblUserErrorMessage.Visible = true;
                        lblUserErrorMessage.Text = "Username Already Exists!";
                        lblUserErrorMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else if (DAL.EmailIDExists(EmailID))
                    {
                        lblUserErrorMessage.Visible = true;
                        lblUserErrorMessage.Text = "Email-ID Already Exists!";
                        lblUserErrorMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else if (DAL.PassportExists(Passport))
                    {
                        lblUserErrorMessage.Visible = true;
                        lblUserErrorMessage.Text = "User Already Registered With Passport!";
                        lblUserErrorMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblUserErrorMessage.Visible = true;
                        lblUserErrorMessage.Text = "User Profile for <b>" + Username + "</b> has been created";
                        lblUserErrorMessage.ForeColor = System.Drawing.Color.Green;
                        DataAccessLayer.InsertUser(Username, Firstname, Lastname, EmailID, Passport, Gender, Mobile, Password, UserProfile, Status);
                        GridBind();
                    }
                }
                catch(Exception ex)
                {
                    lblUserErrorMessage.Visible = true;
                    lblUserErrorMessage.Text = "Exception Occur: " +ex.Message;
                    lblUserErrorMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (e.CommandName == "EditRow")
            {
                try
                {
                    lblUserException.Visible = false;
                    lblUserErrorMessage.Visible = false;
                    if (ddl != 0 && txt != 0)
                    {
                        int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                        grdViewUsers.EditIndex = rowIndex;
                        GridSearch();
                    }
                    else
                    {
                        int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                        grdViewUsers.EditIndex = rowIndex;
                        GridBind();
                    }
                }
                catch(Exception ex)
                {
                    lblUserErrorMessage.Visible = true;
                    lblUserErrorMessage.Text = "Exception Occur: "+ex.Message;
                    lblUserErrorMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (e.CommandName == "DeleteRow")
            {
                try
                {
                    lblUserException.Visible = false;
                    lblUserException.Visible = false;
                    if (ddl != 0 && txt != 0)
                    {

                        DataAccessLayer.DeleteUser(Convert.ToInt32(e.CommandArgument));
                        GridSearch();
                    }
                    else
                    {
                        DataAccessLayer.DeleteUser(Convert.ToInt32(e.CommandArgument));
                        GridBind();
                    }
                }
                catch (Exception ex)
                {
                    lblUserException.Visible = true;
                    lblUserException.Text = "Exception Occur: " + ex.Message;
                    lblUserException.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (e.CommandName == "CancelUpdate")
            {
                try
                {
                    lblUserException.Visible = false;
                    lblUserErrorMessage.Visible = false;
                    if (ddl != 0 && txt != 0)
                    {
                        grdViewUsers.EditIndex = -1;
                        GridSearch();
                        lblSearchError.Visible = false;
                    }
                    else
                    {
                        grdViewUsers.EditIndex = -1;
                        GridBind();
                        lblSearchError.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    lblUserException.Visible = true;
                    lblUserException.Text = "Exception Occur: " + ex.Message;
                    lblUserException.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (e.CommandName == "UpdateRow")
            {
                try
                {
                    lblUserErrorMessage.Visible = false;
                    int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                    int UserID = Convert.ToInt32(e.CommandArgument);
                    string Username = ((TextBox)grdViewUsers.Rows[rowIndex].FindControl("txtEditUserName")).Text;
                    string Firstname = ((TextBox)grdViewUsers.Rows[rowIndex].FindControl("txtEditFirstName")).Text;
                    string Lastname = ((TextBox)grdViewUsers.Rows[rowIndex].FindControl("txteditLastName")).Text;
                    string EmailID = ((TextBox)grdViewUsers.Rows[rowIndex].FindControl("txtEditEmailID")).Text;
                    string Passport = ((TextBox)grdViewUsers.Rows[rowIndex].FindControl("txtEditPassport")).Text;
                    string Gender = ((DropDownList)grdViewUsers.Rows[rowIndex].FindControl("ddlEditGender")).SelectedValue;
                    string Mobile = ((TextBox)grdViewUsers.Rows[rowIndex].FindControl("txtEditMobile")).Text;
                    string pwd = ((TextBox)grdViewUsers.Rows[rowIndex].FindControl("txtEditPassword")).Text;
                    string Password = Security.GetHash256(pwd, Username);
                    string UserProfile = ((DropDownList)grdViewUsers.Rows[rowIndex].FindControl("ddlEditUserProfile")).SelectedValue;
                    string Status = ((DropDownList)grdViewUsers.Rows[rowIndex].FindControl("ddlEditStatus")).SelectedValue;
                    DataAccessLayer.UpdateUser(UserID, Username, Firstname, Lastname, EmailID, Passport, Gender, Mobile, Password, UserProfile, Status);
                    lblUserErrorMessage.Visible = true;
                    lblUserErrorMessage.Text = "User Profile for <b>" + Username + "</b> has been udpated";
                    lblUserErrorMessage.ForeColor = System.Drawing.Color.Green;

                    if (ddl != 0 && txt != 0)
                    {
                        grdViewUsers.EditIndex = -1;
                        GridSearch();
                        lblSearchError.Visible = false;
                    }
                    else
                    {
                        grdViewUsers.EditIndex = -1;
                        GridBind();
                        lblSearchError.Visible = false;
                    }
                }
                catch(Exception ex)
                {
                    lblUserErrorMessage.Visible = true;
                    lblUserErrorMessage.Text = "Exception Occur: "+ex.Message;
                    lblUserErrorMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                HttpCookie cookie = Request.Cookies["user"];
                cookie.Expires = DateTime.Now.AddDays(-3);
                Response.Cookies.Remove("user");
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                lblUserException.Visible = true;
                lblUserException.Text = "Exception Occur: " + ex.Message;
                lblUserException.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            grdViewUsers.EditIndex = -1;
            lblUserErrorMessage.Visible = true;
            lblUserException.Visible = true;
            GridSearch();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            grdViewUsers.EditIndex = -1;
            grdViewUsers.Visible = true;
            GridBind();
            lblUserException.Visible = false;
            lblUserErrorMessage.Visible = false;
            lblSearchError.Visible = false;
            ddlSearch.SelectedValue = "Select Criteria";
            txtSearch.Text = "";
        }

        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblUserException.Visible = false;
            searchBy = ddlSearch.SelectedValue;
            input = txtSearch.Text;
        }
    }
}
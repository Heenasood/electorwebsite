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

    public partial class WebForm5 : System.Web.UI.Page
    {

        DataAccessLayer DAL;
        string searchBy;
        string input;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblSearchError.Visible = false;
                lblErrorMessage.Visible = false;
                lblErrorMessage.Visible = false;
                GridBind();
            }
        }

        private void GridBind()
        {
            try
            {
                DAL = new DataAccessLayer();
                DataTable dtbl = DAL.GetAllPolls();
                gvPolls.DataSource = dtbl;
                gvPolls.DataBind();

                DropDownList ddl = gvPolls.FooterRow.FindControl("ddlPollRoleFooter") as DropDownList;

                List<ListItem> Role_Names = new List<ListItem>();
                Dictionary<string, string> list = DAL.GetRoleName();
                foreach (KeyValuePair<string, string> entry in list)
                {
                    Role_Names.Add(new ListItem(entry.Key, entry.Value.ToString()));
                }
                ddl.Items.AddRange(Role_Names.ToArray());
            }
            catch(Exception ex)
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "DataBinding Exception: " + ex.Message;
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            }
        }



        private void GridSearch()
        {


            lblException.Visible = false;
            string txtSearchValue = txtSearch.Text.ToLower();
            int length = txtSearchValue.Length;
            try
            {

                if (length >= 3)
                {
                    DAL = new DataAccessLayer();
                    DataTable dtbl = DAL.GetSearchPolls(ddlSearch.SelectedValue, txtSearch.Text);
                    int countrow = dtbl.Rows.Count;
                    if (countrow == 0)
                    {

                        lblSearchError.Visible = true;
                        lblSearchError.Text = "No Records Found";
                        lblSearchError.ForeColor = System.Drawing.Color.Red;
                        gvPolls.Visible = false;
                        lblException.Visible = false;

                    }
                    else
                    {

                        lblSearchError.Visible = false;
                        gvPolls.Visible = true;
                        gvPolls.DataSource = dtbl;
                        gvPolls.DataBind();

                        DropDownList ddl = gvPolls.FooterRow.FindControl("ddlPollRoleFooter") as DropDownList;

                        List<ListItem> Role_Names = new List<ListItem>();
                        Dictionary<string, string> list = DAL.GetRoleName();
                        foreach (KeyValuePair<string, string> entry in list)
                        {
                            Role_Names.Add(new ListItem(entry.Key, entry.Value.ToString()));
                        }
                        ddl.Items.AddRange(Role_Names.ToArray());
                    }
                }
                else
                {
                    lblErrorMessage.Visible = false;
                    lblSearchError.Visible = true;
                    lblSearchError.Text = "Please enter minimum 3 characters";
                    lblSearchError.ForeColor = System.Drawing.Color.Red;
                    lblException.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Search Exception: " + ex.Message;
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            }
        }


        protected void gvPolls_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ddl = ddlSearch.SelectedValue.Length;
            int txt = txtSearch.Text.Length;

            if (e.CommandName == "InsertRow")
            {
                try
                {
                    DataAccessLayer DAL = new DataAccessLayer();
                    string PollType = ((TextBox)gvPolls.FooterRow.FindControl("txtPollTypeFooter")).Text;
                    string PollName = ((TextBox)gvPolls.FooterRow.FindControl("txtPollNameFooter")).Text;
                    string PollQuestion = ((TextBox)gvPolls.FooterRow.FindControl("txtPollQuesFooter")).Text;
                    string PollDescription = ((TextBox)gvPolls.FooterRow.FindControl("txtPollDescFooter")).Text;
                    string PollRole = ((DropDownList)gvPolls.FooterRow.FindControl("ddlPollRoleFooter")).SelectedValue;
                    string PollStatus = ((DropDownList)gvPolls.FooterRow.FindControl("ddlInsertStatusFooter")).SelectedValue;
                    DAL.InsertPoll(PollType, PollName, PollQuestion, PollDescription, PollRole, PollStatus);
                    GridBind();
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "New Poll title <b>" + PollName + "</b> has been created with Type as <b>" + PollType + ")</b>";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Insert Exception: " + ex.Message;
                    lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                }

            }

            else if (e.CommandName == "EditRow")
            {
                try
                {
                    lblErrorMessage.Visible = false;
                    lblException.Visible = false;
                    if (ddl != 0 && txt != 0)
                    {
                        int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                        gvPolls.EditIndex = rowIndex;
                        GridSearch();
                    }
                    else
                    {
                        int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                        gvPolls.EditIndex = rowIndex;
                        GridBind();
                    }
                }
                catch(Exception ex)
                {
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = " Edit Exception: "+ ex.Message;
                    lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                }

            }
            else if (e.CommandName == "DeleteRow")
            {
                try
                {
                    lblException.Visible = false;
                    lblErrorMessage.Visible = false;
                    if (ddl != 0 && txt != 0)
                    {
                        DataAccessLayer.DeletePoll(Convert.ToInt32(e.CommandArgument));
                        GridSearch();
                    }
                    else
                    {
                        DataAccessLayer.DeletePoll(Convert.ToInt32(e.CommandArgument));
                        GridBind();
                    }
                }
                catch(Exception ex)
                {
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Delete Exception: "+ ex.Message;
                    lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (e.CommandName == "CancelUpdate")
            {
                try
                {
                    lblException.Visible = false;
                    lblErrorMessage.Visible = false;
                    if (ddl != 0 && txt != 0)
                    {
                        gvPolls.EditIndex = -1;
                        GridSearch();
                    }
                    else
                    {
                        gvPolls.EditIndex = -1;
                        GridBind();
                    }
                }
                catch(Exception ex)
                {
                    lblException.Visible = true;
                    lblException.Text = "Cancel Exception: " + ex.Message;
                    lblException.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (e.CommandName == "UpdateRow")
            {
                try
                {
                    lblException.Visible = false;
                    lblErrorMessage.Visible = false;
                    DataAccessLayer DAL = new DataAccessLayer();
                    int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                    int PollID = Convert.ToInt32(e.CommandArgument);
                    string PollType = ((TextBox)gvPolls.Rows[rowIndex].FindControl("txtPollType")).Text;
                    string PollName = ((TextBox)gvPolls.Rows[rowIndex].FindControl("txtPollName")).Text;
                    string PollQuestion = ((TextBox)gvPolls.Rows[rowIndex].FindControl("txtPollQues")).Text;
                    string PollDescription = ((TextBox)gvPolls.Rows[rowIndex].FindControl("txtPollDesc")).Text;
                    string PollStatus = ((DropDownList)gvPolls.Rows[rowIndex].FindControl("ddlEditStatus")).SelectedValue;
                    string PollRole = ((DropDownList)gvPolls.Rows[rowIndex].FindControl("ddlEditPollRole")).SelectedValue;
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Poll-Name <b>" + PollName + "</b> and Poll-Type <b>" + PollType + "</b> has been updated";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                    DAL.UpdatePoll(PollID, PollType, PollName, PollQuestion, PollDescription, PollRole, PollStatus);
                    lblSearchError.Visible = false;
                    if (ddl != 0 && txt != 0)
                    {
                        gvPolls.EditIndex = -1;
                        GridSearch();
                    }
                    else
                    {
                        gvPolls.EditIndex = -1;
                        GridBind();
                    }
                }
                catch(Exception ex)
                {
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Update Exception: "+ex.Message;
                    lblErrorMessage.ForeColor = System.Drawing.Color.Red;
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
        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

            lblException.Visible = false;
            searchBy = ddlSearch.SelectedValue;
            input = txtSearch.Text;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvPolls.EditIndex = -1;
            lblErrorMessage.Visible = false;
            lblException.Visible = false;
            GridSearch();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

            gvPolls.EditIndex = -1;
            gvPolls.Visible = true;
            GridBind();
            lblException.Visible = false;
            lblErrorMessage.Visible = false;
            lblSearchError.Visible = false;
            ddlSearch.SelectedValue = "Select Criteria";
            txtSearch.Text = "";
        }

        protected void gvPolls_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DAL = new DataAccessLayer();

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlEditPollRole");

                if (ddl != null)
                {
                    List<ListItem> PollRole = new List<ListItem>();
                    ddl.SelectedIndex = 1;
                    Dictionary<string, string> list = DAL.GetRoleName();
                    foreach (KeyValuePair<string, string> entry in list)
                    {
                        PollRole.Add(new ListItem(entry.Key, entry.Value.ToString()));
                    }
                    ddl.Items.AddRange(PollRole.ToArray());
                    DataRowView dr = e.Row.DataItem as DataRowView;
                    ddl.SelectedValue = dr["PollRole"].ToString();
                }

            }
        }
    }
}
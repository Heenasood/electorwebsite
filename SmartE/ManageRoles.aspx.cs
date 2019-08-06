using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

namespace SmartE
{
    public partial class WebForm4 : System.Web.UI.Page
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
                lblException.Visible = false;
                GridBind();
            }
        }

        private void GridBind()
        {
            try
            {
                DAL = new DataAccessLayer();
                DataTable dtbl = DAL.GetAllRoles();
                grdViewRoles.DataSource = dtbl;
                grdViewRoles.DataBind();

                DropDownList ddl = grdViewRoles.FooterRow.FindControl("ddlInsertCandidateName") as DropDownList;

                List<ListItem> Candidate_Name = new List<ListItem>();

                Dictionary<string, string> list = DAL.GetCandidatename();
                foreach (KeyValuePair<string, string> entry in list)
                {
                    Candidate_Name.Add(new ListItem(entry.Key, entry.Value.ToString()));
                }
                ddl.Items.AddRange(Candidate_Name.ToArray());
            }
            catch (Exception ex)
            {
                lblException.Visible = true;
                lblException.Text = "Grid Bind Exception: " + ex.Message;
                lblException.ForeColor = System.Drawing.Color.Red;
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
                    DataTable dtbl = DAL.GetSearchRoles(ddlSearch.SelectedValue, txtSearch.Text);
                    int countrow = dtbl.Rows.Count;
                    if (countrow == 0)
                    {
                        lblSearchError.Visible = true;
                        lblSearchError.Text = "No Records Found";
                        lblSearchError.ForeColor = System.Drawing.Color.Red;
                        grdViewRoles.Visible = false;
                        lblException.Visible = false;

                    }
                    else
                    {

                        lblSearchError.Visible = false;
                        grdViewRoles.Visible = true;
                        grdViewRoles.DataSource = dtbl;
                        grdViewRoles.DataBind();

                        DropDownList ddl = grdViewRoles.FooterRow.FindControl("ddlInsertCandidateName") as DropDownList;
                        List<ListItem> Candidate_Name = new List<ListItem>();
                        Dictionary<string, string> list = DAL.GetCandidatename();
                        foreach (KeyValuePair<string, string> entry in list)
                        {
                            Candidate_Name.Add(new ListItem(entry.Key, entry.Value.ToString()));
                        }
                        ddl.Items.AddRange(Candidate_Name.ToArray());
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
                lblErrorMessage.Visible = false;
                lblException.Visible = true;
                lblException.Text = "Grid Search Exception: " + ex.Message;
                lblException.ForeColor = System.Drawing.Color.Red;
            }

        }


        protected void grdViewRoles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ddl = ddlSearch.SelectedValue.Length;
            int txt = txtSearch.Text.Length;

            if (e.CommandName == "InsertRow")
            {
                DataAccessLayer DAL = new DataAccessLayer();
                string RoleName = ((TextBox)grdViewRoles.FooterRow.FindControl("txtInsertRoleName")).Text;
                string Party = ((TextBox)grdViewRoles.FooterRow.FindControl("txtInsertParty")).Text;
                string RoleYear = ((TextBox)grdViewRoles.FooterRow.FindControl("txtInsertYear")).Text;
                string ManifestoName = ((TextBox)grdViewRoles.FooterRow.FindControl("txtInsertManifestorName")).Text;
                string ManifestoShortDesc = ((TextBox)grdViewRoles.FooterRow.FindControl("txtInsertManifestoShortDesc")).Text;
                string ManifestoLongDesc = ((TextBox)grdViewRoles.FooterRow.FindControl("txtInsertManifestoLongDesc")).Text;
                string Candidate_Name = ((DropDownList)grdViewRoles.FooterRow.FindControl("ddlInsertCandidateName")).SelectedValue;
                string RoleStatus = ((DropDownList)grdViewRoles.FooterRow.FindControl("ddlInsertStatus")).SelectedValue;
                try
                {
                    if (((FileUpload)grdViewRoles.FooterRow.FindControl("fuInsertRoleImage")).HasFile)
                    {

                        string RoleImages = ((FileUpload)grdViewRoles.FooterRow.FindControl("fuInsertRoleImage")).FileName;
                        ((FileUpload)grdViewRoles.FooterRow.FindControl("fuInsertRoleImage")).PostedFile.SaveAs(Server.MapPath(".") + "/images/" + RoleImages);
                        String pathRoleImages = "/images/" + RoleImages.ToString();
                        lblException.Visible = false;
                        lblErrorMessage.Visible = true;
                        lblErrorMessage.Text = "Role has been created for <b>" + Party + "</b> & role name <b>" + RoleName + "</b>";
                        lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                        DataAccessLayer.InsertRole(RoleName, Party, RoleYear, pathRoleImages, ManifestoName, ManifestoShortDesc, ManifestoLongDesc, Candidate_Name, RoleStatus);
                        GridBind();
                    }
                }
                catch (Exception ex)
                {
                    lblException.Visible = true;
                    lblException.Text = "Record Insert Exception: " + ex.Message;
                    lblException.ForeColor = System.Drawing.Color.Red;
                }


            }

            else if (e.CommandName == "EditRow")
            {
                try
                {
                    lblException.Visible = false;
                    lblErrorMessage.Visible = false;
                    if (ddl != 0 && txt != 0)
                    {
                        int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                        grdViewRoles.EditIndex = rowIndex;
                        GridSearch();
                    }
                    else
                    {
                        int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                        grdViewRoles.EditIndex = rowIndex;

                        ////Get the value from the row.
                        ////string Candidate_Name = ((Label)grdViewRoles.Rows[rowIndex].FindControl("lblCandidateName")).Text;
                        //string Candidate_Name = ((DropDownList)grdViewRoles.Rows[rowIndex].FindControl("ddlDisplayCandidateName")).SelectedValue;
                        //DropDownList candidateDDL = grdViewRoles.Rows[rowIndex].FindControl("ddlEditCandidateName") as DropDownList;
                        //candidateDDL.SelectedValue = Candidate_Name;

                        GridBind();
                    }

                }
                catch (Exception ex)
                {
                    lblException.Visible = true;
                    lblException.Text = "Edit record Exception: " + ex.Message;
                    lblException.ForeColor = System.Drawing.Color.Red;
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

                        DataAccessLayer.DeleteRole(Convert.ToInt32(e.CommandArgument));
                        GridSearch();
                    }
                    else
                    {
                        DataAccessLayer.DeleteRole(Convert.ToInt32(e.CommandArgument));
                        GridBind();
                    }
                }
                catch (Exception ex)
                {
                    lblException.Visible = true;
                    lblException.Text = "Delete Record Exception: " + ex.Message;
                    lblException.ForeColor = System.Drawing.Color.Red;
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
                        grdViewRoles.EditIndex = -1;
                        GridSearch();
                        lblSearchError.Visible = false;
                    }
                    else
                    {
                        grdViewRoles.EditIndex = -1;
                        GridBind();
                        lblSearchError.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    lblException.Visible = true;
                    lblException.Text = "Cancel Row Exception: " + ex.Message;
                    lblException.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (e.CommandName == "UpdateRow")
            {
                try
                {
                    lblException.Visible = false;
                    lblErrorMessage.Visible = false;
                    int rowIndex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                    int RoleID = Convert.ToInt32(e.CommandArgument);
                    string RoleName = ((TextBox)grdViewRoles.Rows[rowIndex].FindControl("txtEditRoleName")).Text;
                    string Party = ((TextBox)grdViewRoles.Rows[rowIndex].FindControl("txtEditParty")).Text;
                    string RoleYear = ((TextBox)grdViewRoles.Rows[rowIndex].FindControl("txtEditYear")).Text;
                    string ManifestoName = ((TextBox)grdViewRoles.Rows[rowIndex].FindControl("txtEditManifestorName")).Text;
                    string ManifestoShortDesc = ((TextBox)grdViewRoles.Rows[rowIndex].FindControl("txtEditManifestorShortDesc")).Text;
                    string ManifestoLongDesc = ((TextBox)grdViewRoles.Rows[rowIndex].FindControl("txtEditManifestorLongDesc")).Text;

                    string RoleStatus = ((DropDownList)grdViewRoles.Rows[rowIndex].FindControl("ddlEditStatus")).SelectedValue;
                    string Candidate_Name = ((DropDownList)grdViewRoles.Rows[rowIndex].FindControl("ddlEditCandidateName")).SelectedValue;
                    // DataAccessLayer.UpdateRole(RoleID, RoleName, Party, RoleYear, ManifestoName, ManifestoShortDesc, Candidate_Name, ManifestoLongDesc, RoleStatus);

                    //lblErrorMessage.Visible = true;
                    //lblErrorMessage.Text = "Role has been updated for <b>" + Party + "</b> & role name <b>" + RoleName + "</b>";
                    //lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                    //if (ddl != 0 && txt != 0)
                    //{
                    //    grdViewRoles.EditIndex = -1;
                    //    GridSearch();
                    //    lblSearchError.Visible = false;
                    //}
                    //else
                    //{
                    //    grdViewRoles.EditIndex = -1;
                    //    GridBind();
                    //    lblSearchError.Visible = false;
                    //}


                    GridViewRow row = (GridViewRow)grdViewRoles.Rows[rowIndex];
                    Label id = (Label)row.FindControl("lbleditRoleID");
                    FileUpload fu = (FileUpload)row.FindControl("fuEditRoleImage");
                    int res = 1;

                    try
                    {
                        if (fu.HasFile)
                        {
                            string file = System.IO.Path.Combine(Server.MapPath("/images/"), fu.FileName);
                            fu.SaveAs(file);
                            string imageValue = "/images/" + fu.FileName;
                            res = DataAccessLayer.UpdateImage(RoleID, imageValue.ToString());
                        }
                    }
                    catch (Exception ex)
                    {
                        lblException.Visible = true;
                        lblException.Text = "Image Upload Exception: " + ex.Message;
                        lblException.ForeColor = System.Drawing.Color.Red;
                    }
                    lblException.Visible = false;
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Record has been updated for <b>" + Party + "</b> & role name <b>" + RoleName + "</b>";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                    DataAccessLayer.UpdateRole(RoleID, RoleName, Party, RoleYear, ManifestoName, ManifestoShortDesc, ManifestoLongDesc, Candidate_Name, RoleStatus);
                    grdViewRoles.EditIndex = -1;
                    GridBind();
                    lblSearchError.Visible = false;

                }
                catch (Exception ex)
                {
                    lblException.Visible = true;
                    lblException.Text = "Update Record Exception: " + ex.Message;
                    lblException.ForeColor = System.Drawing.Color.Red;
                }

            }

        }


        protected void grdViewRoles_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DAL = new DataAccessLayer();
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlEditCandidateName");
                
                if (ddl != null)
                {
                    List<ListItem> Candidate_Name = new List<ListItem>();
                    ddl.SelectedIndex = 1;
                    Dictionary<string, string> list = DAL.GetCandidatename();
                    foreach (KeyValuePair<string, string> entry in list)
                    {
                        Candidate_Name.Add(new ListItem(entry.Key, entry.Value.ToString()));
                    }
                    ddl.Items.AddRange(Candidate_Name.ToArray());
                    DataRowView dr = e.Row.DataItem as DataRowView;
                    ddl.SelectedValue= dr["Candidate_Name"].ToString();
                }
                
            }
        }

        protected void btnLogout_Click1(object sender, EventArgs e)
        {
            try
            {
                lblException.Visible = false;
                HttpCookie cookie = Request.Cookies["user"];
                cookie.Expires = DateTime.Now.AddDays(-3);
                Response.Cookies.Remove("user");
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                lblException.Visible = true;
                lblException.Text = "Exception Occur: " + ex.Message;
                lblException.ForeColor = System.Drawing.Color.Red;
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            grdViewRoles.EditIndex = -1;
            lblErrorMessage.Visible = false;
            lblException.Visible = false;
            GridSearch();
        }

        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

            lblException.Visible = false;
            searchBy = ddlSearch.SelectedValue;
            input = txtSearch.Text;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            grdViewRoles.EditIndex = -1;
            grdViewRoles.Visible = true;
            GridBind();
            lblException.Visible = false;
            lblErrorMessage.Visible = false;
            lblSearchError.Visible = false;
            ddlSearch.SelectedValue = "Select Criteria";
            txtSearch.Text = "";
        }

        protected void vsSearch_Load(object sender, EventArgs e)
        {
            lblSearchError.Visible = false;
        }
    }

}
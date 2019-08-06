using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace SmartE
{
    public partial class WebForm11 : System.Web.UI.Page
    {

        public class Results
        {
            public int RoleID { get; set; }
            public string PollID { get; set; }
            public string Candidate_Name { get; set; }
            public string PollName { get; set; }
            public string PollRole { get; set; }
            public string PollQuestion { get; set; }

        }
        DataAccessLayer DAL;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (chkDeclaration.Checked)
            {
                DataAccessLayer DAL = new DataAccessLayer();
                for (int index = 0; index < DataList1.Items.Count; index++)
                {

                    //string lblRoleID = ((Label)DataList1.FindControl("RoleIDLabel")).Text;
                    int RoleID = Convert.ToInt32(((Label)DataList1.Items[index].FindControl("lblRoleIDLabel")).Text);
                    string lblPollID = ((Label)DataList1.Items[index].FindControl("lblPollIDLabel")).Text;
                    int PollID = Convert.ToInt32(lblPollID);
                    string RoleYear = ((Label)DataList1.Items[index].FindControl("lblRoleYear")).Text;
                    string Candidate_Name = Convert.ToString(((RadioButtonList)DataList1.Items[index].FindControl("rbInsertVote")).SelectedValue);
                    string PollName = Convert.ToString(((Label)DataList1.Items[index].FindControl("lblPollNameLabel")).Text);
                    string PollRole = Convert.ToString(((Label)DataList1.Items[index].FindControl("lblPollRoleLabel")).Text);
                    string PollQuestion = Convert.ToString(((Label)DataList1.Items[index].FindControl("lblPollQuestionLabel")).Text);
                    DataAccessLayer.InsertResult(RoleID, PollID, RoleYear, Candidate_Name, PollName, PollRole, PollQuestion);
                    lblMessage.Visible = true;
                    lblMessage.Text = "Your VOTE has been captured. Thank you!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("Candidate_Info.aspx");

                }
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Please sign the declaration to Vote";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            HiddenField c = (HiddenField)e.Item.FindControl("hfRoleName");
            HtmlGenericControl div = (HtmlGenericControl)e.Item.FindControl("cddSection");
            //string txt = Value;
            //string query = $"Select Candidate_Name, RoleName from Candidate where RoleName= '{c.Value}' AND (RoleStatus = 'Active') ";
            string query = $"SELECT DISTINCT c.Candidate_Name, c.RoleID, c.RoleImages, c.ManifestoName, p.PollID, p.PollRole, p.PollQuestion, p.PollName FROM tblPoll AS p INNER JOIN Candidate AS c ON p.RoleID = c.RoleID ";

            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["smartElectorConnectionString"].ConnectionString))


            {
                SqlCommand com = new SqlCommand(query, con);
                try
                {
                    con.Open();

                    DataTable dtblCandidates = new DataTable();
                    SqlDataAdapter sqlDA = new SqlDataAdapter(query, con);
                    sqlDA.Fill(dtblCandidates);

                    DataList dt = DataList1;

                    //Repeater rp = dt.FindControl("ProductsByCategoryList") as Repeater
                    FormView FV = dt.FindControl("FVCandidateList") as FormView;

                    if (dtblCandidates.Rows.Count > 0)
                    {
                        dt.DataSource = dtblCandidates;
                        dt.DataBind();
                    }


                    //var reader = com.ExecuteReader();
                    //if (reader.HasRows)
                    //{
                    //    List<User> listusers = new List<User>();
                    //    string html = "<div>";
                    //    while (reader.Read())
                    //    {

                    //        RadioButton u = new RadioButton();
                    //        Dictionary<string, string> listCandidatename = new Dictionary<string, string>();
                    //        for (int i = 0; reader.Read(); i++)
                    //        {
                    //            listCandidatename[reader.GetString(1)] = reader.GetValue(1).ToString();
                    //        }
                    //        html += "<Label> " + reader.GetString(0) + @" </Label>";
                    //        //html += @"<asp:RadioButtonList ID='rbInsertVote' runat='server' DataSourceID='SqlDataSource1' DataTextField='Candidate_Name' DataValueField='Candidate_Name'>
                    //        //    <asp:ListItem></asp:ListItem>
                    //        //</asp:RadioButtonList>";
                    //        u.Text = reader["Candidate_Name"].ToString();
                    //        Controls.Add(u);
                    //    }
                    //    html += "<div>";
                    //    div.InnerHtml = html;
                    //}
                    con.Close();
                }
                catch (Exception ex)
                {

                }

            }
        }

        //protected void Page_Load(object sender, EventArgs e)
        //{

        //}

        //SELECT DISTINCT p.PollRole, c.Candidate_Name, c.RoleImages, c.RoleYear, c.RoleID, c.RoleImages, c.ManifestoName, p.PollID,  p.PollQuestion, p.PollName FROM tblPoll AS p INNER JOIN Candidate AS c ON p.PollRole = c.RoleName WHERE (p.PollStatus = 'Active') AND(c.RoleStatus = 'Active')
        //{
        //    DAL = new DataAccessLayer();
        //    DataTable dtbl = DAL.GetAllBallotCandidates();
        //    dlBallot.DataSource = dtbl;
        //    dlBallot
        //private void GridBind().DataBind();

        //    RadioButtonList ddl = dlBallot.("ddlPollRoleFooter") as DropDownList;

        //    List<ListItem> Role_Names = new List<ListItem>();
        //    Dictionary<string, string> list = DAL.GetRoleName();
        //    foreach (KeyValuePair<string, string> entry in list)
        //    {
        //        Role_Names.Add(new ListItem(entry.Key, entry.Value.ToString()));
        //    }
        //    ddl.Items.AddRange(Role_Names.ToArray());
        //}
    }
    class Candidate
    {
        public string RoleName { get; set; }
        public string Candidate_Name { get; set; }
    }
}
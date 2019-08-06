using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;

namespace SmartE
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                    if (!IsPostBack)
                    {
                        
                        GetPieDataForIndividualCandidate();
                        GetBarDataForIndividualCandidate();
                        GetPieDataForRoles();
                        GetBarDataForRoles();
                        GetBarDataForVotingName();
                        GetPieDataForVotingName();

                    }
                
        }

        private void GetPieDataForIndividualCandidate()
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select Candidate_name, Count(Candidate_name) as Results from tblResults group by Candidate_name  Order by Results asc", connection);
                Series series = chrCandidate.Series["Series1"];
                connection.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while(sdr.Read())
                {
                    series.Points.AddXY(sdr["Candidate_name"].ToString(), sdr["Results"]);
                }
            }
        }

        private void GetBarDataForIndividualCandidate()
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select Candidate_name, Count(Candidate_name) as Results from tblResults group by Candidate_name  Order by Results asc", connection);
                Series series = barCandidate.Series["Series1"];
                connection.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    series.Points.AddXY(sdr["Candidate_name"].ToString(), sdr["Results"]);
                }
            }
        }

        private void GetPieDataForRoles()
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select Distinct PollRole, Count(Candidate_name) as Count from tblResults group by PollRole, Candidate_name order by PollRole", connection);
                Series series = chrPieRole.Series["Series1"];
                connection.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    series.Points.AddXY(sdr["PollRole"].ToString(), sdr["Count"]);
                }
            }
        }

        private void GetBarDataForRoles()
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select Distinct PollRole, Count(Candidate_name) as Count from tblResults group by PollRole, Candidate_name order by PollRole", connection);
                Series series = chrbarRole.Series["Series1"];
                connection.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    series.Points.AddXY(sdr["PollRole"].ToString(), sdr["Count"]);
                }
            }
        }

        private void GetBarDataForVotingName()
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select Distinct PollName, Count(Candidate_name) as Results from tblResults group by PollName, Candidate_Name Order by Results asc", connection);
                Series series = chrBarPollName.Series["Series1"];
                connection.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    series.Points.AddXY(sdr["PollName"].ToString(), sdr["Results"]);
                }
            }
        }

        private void GetPieDataForVotingName()
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select Distinct PollName, Count(Candidate_name) as Results from tblResults group by PollName, Candidate_Name Order by Results asc", connection);
                Series series = chrPiePollName.Series["Series1"];
                connection.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    series.Points.AddXY(sdr["PollName"].ToString(), sdr["Results"]);
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

        protected void btnHome_Click(object sender, EventArgs e)
        {

        }

        protected void btnCandidates_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];
            Response.Redirect("Candidate_Info.aspx");
        }

        protected void btnVote_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];
            Response.Redirect("VoteHere.aspx");
        }

    }
}
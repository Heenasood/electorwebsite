using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartE
{
    public partial class WebForm26 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblErrorMessage.Visible = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            DataAccessLayer DAL = new DataAccessLayer();
            string Username = txtUserName.Text;
            string Firstname = txtFirstName.Text;
            string Lastname = txtLastName.Text;
            string EmailID = txtEmail.Text;
            string Passport = txtPassport.Text;
            string Gender = ddlGender.SelectedValue;
            string Mobile = txtMobile.Text;
            string Password = Security.GetHash256(txtPassword.Text, txtUserName.Text);
            string ConfirmPassword = Security.GetHash256(txtConfirmPassword.Text, txtUserName.Text);
            string Profile = ddlUserProfile.SelectedValue;
            string Status = ddlStatus.SelectedValue;

            if (DAL.UsernameExists(Username))
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Username Already Exists!";
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            }
            else if (DAL.EmailIDExists(EmailID))
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Email-ID Already Exists!";
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            }
            else if (DAL.PassportExists(Passport))
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "User Already Exists With Passport!";
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Username available!";
                lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                DataAccessLayer.InsertUser(Username, Firstname, Lastname, EmailID, Passport, Gender, Mobile, Password, Profile, Status);
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnReset_Click1(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPassport.Text = "";
            ddlGender.SelectedValue = "Select Gender";
            txtMobile.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            ddlUserProfile.SelectedValue = "Select Profile";
        }
    }
}
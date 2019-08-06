using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SmartE
{
    public class User
    {
        public int UserID { get; set; }
        public string Username { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string EmailID { get; set; }
        public string Passport { get; set; }
        public string Gender { get; set; }
        public string Mobile { get; set; }
        public string Password { get; set; }
        public string UserProfile { get; set; }
        public string ProfileStatus { get; set; }

    }
    public class Role
    {
        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public string Party { get; set; }
        public string RoleYear { get; set; }
        public string RoleImage { get; set; }
        public string ManifestoName { get; set; }
        public string ManifestoDesc { get; set; }
        public string Candidate_Name { get; set; }
        public string RoleStatus { get; set; }

    }

    public class Results
    {
        public int RoleID { get; set; }
        public string PollID { get; set; }
        public string Candidate_Name { get; set; }
        public string PollName { get; set; }
        public string PollRole { get; set; }
        public string PollQuestion { get; set; }

    }

    public class DataAccessLayer
    {
        string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection connection;
        protected Dictionary<string, string> activeUserInfo;

        public DataAccessLayer()
        {
            connection = new SqlConnection(cs);
            activeUserInfo = new Dictionary<string, string>();
        }

        public string getUsername()
        {
            return activeUserInfo["Username"];
        }
        public string getEmailID()
        {
            return activeUserInfo["EmailID"];
        }

        public string getUserProfile()
        {
            return activeUserInfo["UserProfile"];
        }

        public string getProfileStatus()
        {
            return activeUserInfo["ProfileStatus"];
        }

        //public string getCandidateUsername()
        //{
        //    return activeUserInfo["CandidateUsername"];
        //}

        public DataTable GetAllUsers()
        {

            DataTable allUsers = new DataTable();
            connection.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("Select UserId, UserName, FirstName, LastName, EmailID, Passport, Gender, Mobile, Password, UserProfile, ProfileStatus from globalUsers", connection);
            sqlDA.Fill(allUsers);
            connection.Close();
            return allUsers;
        }

        //public static List<User> GetAllUsers()
        //{
        //    List<User> listusers = new List<User>();
        //    string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        //    using (SqlConnection connection = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand("Select * from globalUsers", connection);
        //        connection.Open();
        //        SqlDataReader sdr = cmd.ExecuteReader();
        //        while (sdr.Read())
        //        {
        //            User u = new User();
        //            u.UserID = Convert.ToInt32(sdr["UserID"]);
        //            u.Username = sdr["Username"].ToString();
        //            u.Firstname = sdr["Firstname"].ToString();
        //            u.Lastname = sdr["Lastname"].ToString();
        //            u.EmailID = sdr["EmailID"].ToString();
        //            u.Passport = sdr["Passport"].ToString();
        //            u.Gender = sdr["Gender"].ToString();
        //            u.Mobile = sdr["Mobile"].ToString();
        //            u.Password = sdr["Password"].ToString();
        //            u.UserProfile = sdr["UserProfile"].ToString();
        //            u.ProfileStatus = sdr["ProfileStatus"].ToString();

        //            listusers.Add(u);
        //        }
        //    }
        //    return listusers;
        //}


        public DataTable GetSearchUsers(string searchBy, string input)
        {

            DataTable allUsers = new DataTable();
            connection.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("Select UserID, UserName, FirstName, LastName, EmailID, Passport, Gender, Mobile, Password, UserProfile, ProfileStatus from globalUsers where " + searchBy + " Like '%" + input + "%'", connection);
            sqlDA.Fill(allUsers);
            connection.Close();
            return allUsers;
        }


        public static void DeleteUser(int UserID)
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("Delete from globalUsers where UserID = @UserID", connection);
                SqlParameter param = new SqlParameter("@UserID", UserID);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }

        public static int UpdateUser(int UserID, string Username, string Firstname, string Lastname, string EmailID, string Passport, string Gender, string Mobile, string Password, string UserProfile, string ProfileStatus)
        {

            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string UpdateQuery = "Update globalUsers SET   Username = @Username, FirstName = @Firstname, LastName = @Lastname, EmailID = @EmailID, Passport = @Passport, Gender = @Gender, Mobile = @Mobile,    Password = @Password, UserProfile = @UserProfile, ProfileStatus = @ProfileStatus WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(UpdateQuery, connection);
                SqlParameter paraOriginalUserID = new SqlParameter("@UserID", UserID);
                cmd.Parameters.Add(paraOriginalUserID);
                SqlParameter paraUsername = new SqlParameter("@Username", Username);
                cmd.Parameters.Add(paraUsername);
                SqlParameter paraFirstName = new SqlParameter("@Firstname", Firstname);
                cmd.Parameters.Add(paraFirstName);
                SqlParameter paraLastName = new SqlParameter("@Lastname", Lastname);
                cmd.Parameters.Add(paraLastName);
                SqlParameter paraEmailID = new SqlParameter("@EmailID", EmailID);
                cmd.Parameters.Add(paraEmailID);
                SqlParameter parapassport = new SqlParameter("@Passport", Passport);
                cmd.Parameters.Add(parapassport);
                SqlParameter paragender = new SqlParameter("@Gender", Gender);
                cmd.Parameters.Add(paragender);
                SqlParameter paraMobile = new SqlParameter("@Mobile", Mobile);
                cmd.Parameters.Add(paraMobile);
                SqlParameter paraPassword = new SqlParameter("@Password", Password);
                cmd.Parameters.Add(paraPassword);
                SqlParameter paraUserProfile = new SqlParameter("@UserProfile", UserProfile);
                cmd.Parameters.Add(paraUserProfile);
                SqlParameter paraUserstatus = new SqlParameter("@ProfileStatus", ProfileStatus);
                cmd.Parameters.Add(paraUserstatus);
                return cmd.ExecuteNonQuery();

            }
        }

        public static int InsertUser(string Username, string Firstname, string Lastname, string EmailID, string Passport, string Gender, string Mobile, string Password, string UserProfile, string ProfileStatus)
        {

            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string updateQuery = "Insert into globalUsers (Username, FirstName, LastName, EmailID, Passport, Gender, Mobile, Password, UserProfile, ProfileStatus)"
                    + "values (@Username, @Firstname, @Lastname, @EmailID, @Passport, @Gender, @Mobile, @Password, @UserProfile, @ProfileStatus)";
                SqlCommand cmd = new SqlCommand(updateQuery, connection);
                SqlParameter paraUsername = new SqlParameter("@Username", Username);
                cmd.Parameters.Add(paraUsername);
                SqlParameter paraFirstName = new SqlParameter("@Firstname", Firstname);
                cmd.Parameters.Add(paraFirstName);
                SqlParameter paraLastName = new SqlParameter("@Lastname", Lastname);
                cmd.Parameters.Add(paraLastName);
                SqlParameter paraEmailID = new SqlParameter("@EmailID", EmailID);
                cmd.Parameters.Add(paraEmailID);
                SqlParameter parapassport = new SqlParameter("@Passport", Passport);
                cmd.Parameters.Add(parapassport);
                SqlParameter paragender = new SqlParameter("@Gender", Gender);
                cmd.Parameters.Add(paragender);
                SqlParameter paraMobile = new SqlParameter("@Mobile", Mobile);
                cmd.Parameters.Add(paraMobile);
                SqlParameter paraPassword = new SqlParameter("@Password", Password);
                cmd.Parameters.Add(paraPassword);
                SqlParameter paraUserProfile = new SqlParameter("@UserProfile", UserProfile);
                cmd.Parameters.Add(paraUserProfile);
                SqlParameter paraUserstatus = new SqlParameter("@ProfileStatus", ProfileStatus);
                cmd.Parameters.Add(paraUserstatus);
                return cmd.ExecuteNonQuery();

            }
        }
        public bool UsernameExists(string username)
        {
            bool UsernameExists = false;
            SqlConnection connection = new SqlConnection(cs);
            connection.Open();

            SqlCommand useridquery = new SqlCommand("Select username from globalUsers where username=@username", connection);
            useridquery.Parameters.AddWithValue("@username", username);

            SqlDataReader SqlUserID = useridquery.ExecuteReader();
            if (SqlUserID.Read())
            {
                return UsernameExists = true;

            }
            connection.Close();
            return UsernameExists;
        }
        public bool EmailIDExists(string EmailID)
        {
            bool EmailIDExists = false;
            SqlConnection connection = new SqlConnection(cs);
            connection.Open();

            SqlCommand emailquery = new SqlCommand("Select EmailID from globalUsers where EmailID=@EmailID", connection);
            emailquery.Parameters.AddWithValue("@EmailID", EmailID);

            SqlDataReader SqlUserID = emailquery.ExecuteReader();
            if (SqlUserID.Read())
            {
                return EmailIDExists = true;
            }
            connection.Close();
            return EmailIDExists;
        }

        public bool PassportExists(string Passport)
        {
            bool PassportExists = false;
            SqlConnection connection = new SqlConnection(cs);
            connection.Open();

            SqlCommand emailquery = new SqlCommand("Select Passport from globalUsers where Passport=@Passport", connection);
            emailquery.Parameters.AddWithValue("@Passport", Passport);

            SqlDataReader SqlUserID = emailquery.ExecuteReader();
            if (SqlUserID.Read())
            {
                return PassportExists = true;
            }
            connection.Close();
            return PassportExists;
        }

        //To verify Admin ProfileType &  active account status. If user is active only then he can login.

        public bool VerifyAdminUser(string Username, string Password)
        {
            bool VerifyAdminUser = false;
            SqlConnection connection = new SqlConnection(cs);
            connection.Open();

            SqlCommand query = new SqlCommand("SELECT UserName, EmailID, UserProfile, ProfileStatus FROM globalUsers where UserName=@UserName AND Password=@Password AND  UserProfile='admin' AND ProfileStatus = 'active'", connection);
            query.Parameters.AddWithValue("@Username", Username);
            query.Parameters.AddWithValue("@Password", Password);

            SqlDataReader reader = query.ExecuteReader();
            if (reader.Read())
            {
                activeUserInfo["Username"] = reader.GetValue(0).ToString();
                activeUserInfo["EmailID"] = reader.GetValue(1).ToString();
                activeUserInfo["UserProfile"] = reader.GetValue(2).ToString();
                activeUserInfo["ProfileStatus"] = reader.GetValue(3).ToString();
                VerifyAdminUser = true;
            }
            connection.Close();
            return VerifyAdminUser;

        }


        //To verify Elector ProfileType &  active account status. If user is active only then he can login.

        public bool VerifyElectorUser(string Username, string Password)
        {
            bool VerifyElectorUser = false;
            SqlConnection connection = new SqlConnection(cs);
            connection.Open();

            SqlCommand query = new SqlCommand("SELECT UserName, EmailID, UserProfile, ProfileStatus FROM globalUsers where UserName=@UserName AND Password=@Password AND  UserProfile='Elector' AND ProfileStatus = 'active'", connection);
            query.Parameters.AddWithValue("@Username", Username);
            query.Parameters.AddWithValue("@Password", Password);

            SqlDataReader reader = query.ExecuteReader();
            if (reader.Read())
            {
                activeUserInfo["Username"] = reader.GetValue(0).ToString();
                activeUserInfo["EmailID"] = reader.GetValue(1).ToString();
                activeUserInfo["UserProfile"] = reader.GetValue(2).ToString();
                activeUserInfo["ProfileStatus"] = reader.GetValue(3).ToString();
                VerifyElectorUser = true;
            }
            connection.Close();
            return VerifyElectorUser;

        }

        //To verify Candidate ProfileType &  active account status. If user is active only then he can login.

        public bool VerifyCandidateUser(string Username, string Password)
        {
            bool VerifyCandidateUser = false;
            SqlConnection connection = new SqlConnection(cs);
            connection.Open();

            SqlCommand query = new SqlCommand("SELECT UserName, EmailID, UserProfile, ProfileStatus FROM globalUsers where UserName=@UserName AND Password=@Password AND  UserProfile='Candidate' AND ProfileStatus = 'active'", connection);
            query.Parameters.AddWithValue("@Username", Username);
            query.Parameters.AddWithValue("@Password", Password);

            SqlDataReader reader = query.ExecuteReader();
            if (reader.Read())
            {
                activeUserInfo["Username"] = reader.GetValue(0).ToString();
                activeUserInfo["EmailID"] = reader.GetValue(1).ToString();
                activeUserInfo["UserProfile"] = reader.GetValue(2).ToString();
                activeUserInfo["ProfileStatus"] = reader.GetValue(3).ToString();
                VerifyCandidateUser = true;
            }
            connection.Close();
            return VerifyCandidateUser;

        }

        //DataAccessLayer for Roles

        public DataTable GetAllRoles()
        {

            DataTable allRoles = new DataTable();
            connection.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("Select RoleId, RoleName, Party, RoleYear, RoleImages, ManifestoName, ManifestoSummary, ManifestoDesc, Candidate_Name, RoleStatus from Candidate", connection);
            sqlDA.Fill(allRoles);
            connection.Close();
            return allRoles;
        }

        public DataTable GetSearchRoles(string searchBy, string input)
        {

            DataTable allRoles = new DataTable();
            connection.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("Select RoleId, RoleName, Party, RoleYear, RoleImages, ManifestoName, ManifestoSummary, ManifestoDesc, Candidate_Name, RoleStatus from Candidate where " + searchBy + " Like '%" + input + "%'", connection);
            sqlDA.Fill(allRoles);
            connection.Close();
            return allRoles;
        }


        public static int UpdateRole(int RoleID, string RoleName, string Party, string RoleYear, string ManifestoName, string ManifestoSummary, string ManifestoDesc, String Candidate_Name, string RoleStatus)
        {

            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string UpdateRole = "Update Candidate SET RoleName = @RoleName, Party = @Party, RoleYear = @RoleYear, ManifestoName=@ManifestoName,ManifestoSummary=@ManifestoSummary, ManifestoDesc=@ManifestoDesc,Candidate_Name=@Candidate_Name, RoleStatus = @RoleStatus WHERE RoleID = @RoleID";
                SqlCommand cmd = new SqlCommand(UpdateRole, connection);
                SqlParameter paraRoleID = new SqlParameter("@RoleID", RoleID);
                cmd.Parameters.Add(paraRoleID);
                SqlParameter paraRoleName = new SqlParameter("@RoleName", RoleName);
                cmd.Parameters.Add(paraRoleName);
                SqlParameter paraParty = new SqlParameter("@Party", Party);
                cmd.Parameters.Add(paraParty);
                //SqlParameter paraRoleImages = new SqlParameter("@RoleImages", RoleImages);
                //cmd.Parameters.Add(paraRoleImages);
                SqlParameter paraRoleYear = new SqlParameter("@RoleYear", RoleYear);
                cmd.Parameters.Add(paraRoleYear);
                SqlParameter paraRoleStatus = new SqlParameter("@RoleStatus", RoleStatus);
                cmd.Parameters.Add(paraRoleStatus);
                SqlParameter paraManifestoName = new SqlParameter("@ManifestoName", ManifestoName);
                cmd.Parameters.Add(paraManifestoName);
                SqlParameter paraManifestoSummary = new SqlParameter("@ManifestoSummary", ManifestoSummary);
                cmd.Parameters.Add(paraManifestoSummary);
                SqlParameter paraManifestoDesc = new SqlParameter("@ManifestoDesc", ManifestoDesc);
                cmd.Parameters.Add(paraManifestoDesc);
                SqlParameter paraCandidate_Name = new SqlParameter("@Candidate_Name", Candidate_Name);
                cmd.Parameters.Add(paraCandidate_Name);
                return cmd.ExecuteNonQuery();
            }
        }

        public static void DeleteRole(int RoleID)
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("Delete from Candidate where RoleID = @RoleID", connection);
                SqlParameter param = new SqlParameter("@RoleID", RoleID);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }

        public SqlDataReader GetRoleID(int RoleID)
        {
            connection.Open();
            string query = "SELECT c.RoleID, c.RoleName , c.Party, c.RoleYear, c.RoleImages, c.ManifestoName,c.ManifestoSummary, C.ManifestoDesc, c.Candidate_Name, gu.UserName, gu.LastName, gu.FirstName, gu.EmailID, gu.Gender, gu.Passport FROM globalUsers gu Join Candidate c on gu.UserName = c.Candidate_Name WHERE gu.UserProfile = 'Candidate' AND gu.ProfileStatus = 'Active' AND c.RoleStatus = 'active'=" + RoleID;
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            //connection.Close();
            return reader;
        }

        public DataTable GetfromRolesAndUsers()
        {

            DataTable allCombinedRoles = new DataTable();
            connection.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("SELECT c.RoleID, c.RoleName , c.Party, c.RoleYear, c.RoleImages, c.ManifestoName,c.ManifestoSummary, C.ManifestoDesc, c.Candidate_Name, gu.UserName, gu.LastName, gu.FirstName, gu.EmailID, gu.Gender, gu.Passport FROM globalUsers gu Join Candidate c on gu.UserName = c.Candidate_Name WHERE gu.UserProfile = 'Candidate' AND gu.ProfileStatus = 'Active' AND c.RoleStatus = 'active'", connection);
            sqlDA.Fill(allCombinedRoles);
            connection.Close();
            return allCombinedRoles;

        }



        public static int InsertRole(string RoleName, string Party, string RoleYear, string RoleImages, string ManifestoName, string ManifestoSummary, string ManifestoDesc, string Candidate_Name, string RoleStatus)
        {

            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string updateQuery = "Insert into Candidate (RoleName, Party, RoleYear, RoleImages, ManifestoName, ManifestoSummary, ManifestoDesc, Candidate_Name, RoleStatus)"
                    + "values (@RoleName, @Party, @RoleYear, @RoleImages, @ManifestoName,@ManifestoSummary, @ManifestoDesc, @Candidate_Name, @RoleStatus)";
                SqlCommand cmd = new SqlCommand(updateQuery, connection);
                SqlParameter paraRoleName = new SqlParameter("@RoleName", RoleName);
                cmd.Parameters.Add(paraRoleName);
                SqlParameter paraParty = new SqlParameter("@Party", Party);
                cmd.Parameters.Add(paraParty);
                SqlParameter paraRoleYear = new SqlParameter("@RoleYear", RoleYear);
                cmd.Parameters.Add(paraRoleYear);
                SqlParameter paraRoleImages = new SqlParameter("@RoleImages", RoleImages);
                cmd.Parameters.Add(paraRoleImages);
                SqlParameter paraManifestoName = new SqlParameter("@ManifestoName", ManifestoName);
                cmd.Parameters.Add(paraManifestoName);
                SqlParameter paraManifestoSummary = new SqlParameter("@ManifestoSummary", ManifestoSummary);
                cmd.Parameters.Add(paraManifestoSummary);
                SqlParameter paraManifestoDesc = new SqlParameter("@ManifestoDesc", ManifestoDesc);
                cmd.Parameters.Add(paraManifestoDesc);
                SqlParameter paraCandidate_Name = new SqlParameter("@Candidate_Name", Candidate_Name);
                cmd.Parameters.Add(paraCandidate_Name);
                SqlParameter paraRoleStatus = new SqlParameter("@RoleStatus", RoleStatus);
                cmd.Parameters.Add(paraRoleStatus);
                return cmd.ExecuteNonQuery();
            }
        }

        public Dictionary<string, string> GetCandidatename() /* Find Candidate name and Value is the ID */
        {
            Dictionary<string, string> listCandidatename = new Dictionary<string, string>();

            connection.Open();

            string statement = "SELECT UserID, UserName FROM globalUsers where UserProfile='Candidate' And ProfileStatus='Active'";

            SqlCommand query = new SqlCommand(statement, connection);
            SqlDataReader reader = query.ExecuteReader();

            for (int i = 0; reader.Read(); i++)
            {
                listCandidatename[reader.GetString(1)] = reader.GetValue(1).ToString();
            }

            connection.Close();

            return listCandidatename;

        }

        public string GetRoleImage(int RoleID)
        {
            string img_url = "images/";

            connection.Open();

            string statement = "SELECT RoleImages FROM Candidate WHERE RoleID = " + RoleID;

            SqlCommand query = new SqlCommand(statement, connection);

            SqlDataReader reader = query.ExecuteReader();

            if (reader.Read())
            {
                img_url += reader.GetValue(0).ToString();
            }
            else
            {
                img_url += "no_image.png";
            }
            connection.Close();

            return img_url;
        }
        public DataTable GetAllPolls()
        {
            DataTable tblPolls = new DataTable();

            connection.Open();

            SqlDataAdapter sqlDA = new SqlDataAdapter("SELECT PollID, PollType, PollName, PollQuestion, PollDescription, PollRole, PollStatus FROM tblPoll", connection);

            sqlDA.Fill(tblPolls);

            connection.Close();

            return tblPolls;
        }

        public Dictionary<string, int> GetListOfPollRoles()/* This is from Candidate Table*/
        {
            Dictionary<string, int> listPollTypes = new Dictionary<string, int>();

            connection.Open();

            string statement = "SELECT RoleID, RoleName FROM Candidate";

            SqlCommand query = new SqlCommand(statement, connection);
            SqlDataReader reader = query.ExecuteReader();

            for (int i = 0; reader.Read(); i++)
            {
                listPollTypes[reader.GetString(1)] = reader.GetInt32(0);
            }

            connection.Close();

            return listPollTypes;

        }

        public DataTable GetSearchPolls(string searchBy, string input)
        {

            DataTable allPolls = new DataTable();
            connection.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("Select PollID, PollType, PollName, PollQuestion, PollDescription, PollRole, PollStatus from tblPoll where " + searchBy + " Like '%" + input + "%'", connection);
            sqlDA.Fill(allPolls);
            connection.Close();
            return allPolls;
        }

        public void InsertPoll(string PollType, string PollName, string PollQuestion, string PollDescription, string PollRole, string PollStatus)
        {
            connection.Open();

            SqlCommand cmd = new SqlCommand("INSERT into tblPoll VALUES(@PollType, @PollName,@PollQuestion, @PollDescription, @PollRole, @PollStatus)", connection);
            SqlParameter paraPollType = new SqlParameter("@PollType", PollType);
            cmd.Parameters.Add(paraPollType);
            SqlParameter paraPollName = new SqlParameter("@PollName", PollName);
            cmd.Parameters.Add(paraPollName);
            SqlParameter paraPollQuestion = new SqlParameter("@PollQuestion", PollQuestion);
            cmd.Parameters.Add(paraPollQuestion);
            SqlParameter paraPollDescription = new SqlParameter("@PollDescription", PollDescription);
            cmd.Parameters.Add(paraPollDescription);
            SqlParameter paraPollRole = new SqlParameter("@PollRole", PollRole);
            cmd.Parameters.Add(paraPollRole);
            SqlParameter paraPollStatus = new SqlParameter("@PollStatus", PollStatus);
            cmd.Parameters.Add(paraPollStatus);
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public void UpdatePoll(int PollID, string PollType, string PollName, string PollQuestion, string PollDescription, string PollRole, string PollStatus)
        {
            connection.Open();

            SqlCommand cmd = new SqlCommand("UPDATE tblPoll SET PollType = @PollType, PollName = @PollName, PollQuestion = @PollQuestion, PollDescription = @PollDescription, PollRole=@PollRole, PollStatus = @PollStatus WHERE PollID=@PollID", connection);
            SqlParameter paraPollID = new SqlParameter("@PollID", PollID);
            cmd.Parameters.Add(paraPollID);
            SqlParameter paraPollType = new SqlParameter("@PollType", PollType);
            cmd.Parameters.Add(paraPollType);
            SqlParameter paraPollName = new SqlParameter("@PollName", PollName);
            cmd.Parameters.Add(paraPollName);
            SqlParameter paraPollQuestion = new SqlParameter("@PollQuestion", PollQuestion);
            cmd.Parameters.Add(paraPollQuestion);
            SqlParameter paraPollDescription = new SqlParameter("@PollDescription", PollDescription);
            cmd.Parameters.Add(paraPollDescription);
            SqlParameter paraPollRole = new SqlParameter("@PollRole", PollRole);
            cmd.Parameters.Add(paraPollRole);
            SqlParameter paraPollStatus = new SqlParameter("@PollStatus", PollStatus);
            cmd.Parameters.Add(paraPollStatus);
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public static void DeletePoll(int PollID)
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("Delete from tblPoll where PollID = @PollID", connection);
                SqlParameter param = new SqlParameter("@PollID", PollID);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }



        public Dictionary<string, string> GetRoleName()
        {
            Dictionary<string, string> ListRoleName = new Dictionary<string, string>();

            connection.Open();

            string statement = "SELECT RoleID, RoleName FROM Candidate Where RoleStatus='active'";

            SqlCommand query = new SqlCommand(statement, connection);
            SqlDataReader reader = query.ExecuteReader();

            for (int i = 0; reader.Read(); i++)
            {
                ListRoleName[reader.GetString(1)] = reader.GetValue(1).ToString();
            }
            connection.Close();

            return ListRoleName;

        }

        public DataTable GetAllDonations()
        {

            DataTable allRoles = new DataTable();
            connection.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("Select DonateID, DonationType, DonationName, DonationDesc, DonationImage, DonationAmount, DonationStatus, Promotions, Discount from Donations", connection);
            sqlDA.Fill(allRoles);
            connection.Close();
            return allRoles;
        }
        public static int InsertDonation(string DonationType, string DonationName, string DonationDesc, string DonationImage, int DonationAmount, string DonationStatus, string Promotions, int Discount)
        {

            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string InsertDonation = "Insert into Donations (DonationType, DonationName, DonationDesc, DonationImage,  DonationAmount, DonationStatus, Promotions, Discount)" + " Values( @DonationType, @DonationName, @DonationDesc, @DonationImage," + @DonationAmount + ", @DonationStatus, @Promotions, " + @Discount + ")";
                SqlCommand cmd = new SqlCommand(InsertDonation, connection);
                SqlParameter paraDonationType = new SqlParameter("@DonationType", DonationType);
                cmd.Parameters.Add(paraDonationType);
                SqlParameter paraDonationName = new SqlParameter("@DonationName", DonationName);
                cmd.Parameters.Add(paraDonationName);
                SqlParameter paraDonationDesc = new SqlParameter("@DonationDesc", DonationDesc);
                cmd.Parameters.Add(paraDonationDesc);
                SqlParameter paraDonationImage = new SqlParameter("@DonationImage", DonationImage);
                cmd.Parameters.Add(paraDonationImage);
                SqlParameter paraDonationAmount = new SqlParameter("@DonationAmount", DonationAmount);
                cmd.Parameters.Add(paraDonationAmount);
                SqlParameter paraDonationStatus = new SqlParameter("@DonationStatus", DonationStatus);
                cmd.Parameters.Add(paraDonationStatus);
                SqlParameter paraPromotions = new SqlParameter("@Promotions", Promotions);
                cmd.Parameters.Add(paraPromotions);
                SqlParameter paraDiscount = new SqlParameter("@Discount", Discount);
                cmd.Parameters.Add(paraDiscount);
                return cmd.ExecuteNonQuery();
            }
        }

        public static int UpdateDonation(int DonateID, string DonationType, string DonationName, string DonationDesc, int DonationAmount, string DonationStatus, string Promotions, int Discount)
        {

            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string UpdateDonation = "Update Donations SET DonationType = @DonationType, DonationName = @DonationName, DonationDesc = @DonationDesc,  DonationAmount=" + @DonationAmount + ", DonationStatus=@DonationStatus, Promotions=@Promotions, Discount= " + @Discount + " WHERE DonateID = @DonateID";
                SqlCommand cmd = new SqlCommand(UpdateDonation, connection);
                SqlParameter paraDonateID = new SqlParameter("@DonateID", DonateID);
                cmd.Parameters.Add(paraDonateID);
                SqlParameter paraDonationType = new SqlParameter("@DonationType", DonationType);
                cmd.Parameters.Add(paraDonationType);
                SqlParameter paraDonationName = new SqlParameter("@DonationName", DonationName);
                cmd.Parameters.Add(paraDonationName);
                SqlParameter paraDonationDesc = new SqlParameter("@DonationDesc", DonationDesc);
                cmd.Parameters.Add(paraDonationDesc);
                SqlParameter paraDonationAmount = new SqlParameter("@DonationAmount", DonationAmount);
                cmd.Parameters.Add(paraDonationAmount);
                SqlParameter paraDonationStatus = new SqlParameter("@DonationStatus", DonationStatus);
                cmd.Parameters.Add(paraDonationStatus);
                SqlParameter paraPromotions = new SqlParameter("@Promotions", Promotions);
                cmd.Parameters.Add(paraPromotions);
                SqlParameter paraDiscount = new SqlParameter("@Discount", Discount);
                cmd.Parameters.Add(paraDiscount);
                return cmd.ExecuteNonQuery();
            }
        }

        public DataTable GetAllBallotCandidates()
        {
            DataTable tblPolls = new DataTable();

            connection.Open();

            SqlDataAdapter sqlDA = new SqlDataAdapter("Select Distinct c.Candidate_Name,c.RoleID, c.RoleImages, c.ManifestoName,p.PollID, p.PollRole, p.PollQuestion, p.PollName from tblPoll p join Candidate c on p.PollRole=c.RoleName where p.PollStatus='Active' and c.RoleStatus='Active'", connection);

            sqlDA.Fill(tblPolls);

            connection.Close();

            return tblPolls;
        }

        public static int InsertResult(int RoleID, int PollID, string Year, string Candidate_Name, string PollName, string PollRole, string PollQuestion)
        {

            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string InsertResult = "Insert into tblResults (RoleID, PollID, Year, Candidate_Name,  PollName, PollRole, PollQuestion)" + " Values(" + @RoleID + "," + @PollID + ", @Year, @Candidate_Name, @PollName, @PollRole, @PollQuestion)";
                SqlCommand cmd = new SqlCommand(InsertResult, connection);
                SqlParameter paraRoleID = new SqlParameter("@RoleID", RoleID);
                cmd.Parameters.Add(paraRoleID);
                SqlParameter paraPollID = new SqlParameter("@PollID", PollID);
                cmd.Parameters.Add(paraPollID);
                SqlParameter paraYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paraYear);
                SqlParameter paraCandidate_Name = new SqlParameter("@Candidate_Name", Candidate_Name);
                cmd.Parameters.Add(paraCandidate_Name);
                SqlParameter paraPollName = new SqlParameter("@PollName", PollName);
                cmd.Parameters.Add(paraPollName);
                SqlParameter paraPollRole = new SqlParameter("@PollRole", PollRole);
                cmd.Parameters.Add(paraPollRole);
                SqlParameter paraPollQuestion = new SqlParameter("@PollQuestion", PollQuestion);
                cmd.Parameters.Add(paraPollQuestion);
                return cmd.ExecuteNonQuery();
            }
        }

        public static void DeleteDonations(int DonateID)
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("Delete from Donations where DonateID = @DonateID", connection);
                SqlParameter param = new SqlParameter("@DonateID", DonateID);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }
        public static int UpdateImage(int RoleID, string RoleImages)
        {
            string cs = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string query = "update Candidate set RoleImages = '" + RoleImages + "' where RoleID=" + RoleID;
                SqlCommand cmd = new SqlCommand(query, connection);
                SqlParameter paramRoleID = new SqlParameter("@RoleID", RoleID);
                cmd.Parameters.Add(paramRoleID);
                SqlParameter paramRoleImages = new SqlParameter("@RoleImages", RoleImages);
                cmd.Parameters.Add(paramRoleImages);
                return cmd.ExecuteNonQuery();
            }
        }

    }
}
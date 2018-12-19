using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.DirectoryServices;


namespace Rcc5yrProgRev
{
    public partial class Default2 : System.Web.UI.Page
    {
        private SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null)
            {
                CheckLoggedIn(Session["LoggedIn"].ToString());
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {

            //SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConn.Open();

            try
            {
                DirectoryEntry de = new DirectoryEntry();
                de.Path = "LDAP://10.1.0.100:389";
                de.Username = Username.Text + "@ad.richmondcc.edu";
                de.Password = Password.Text;
                de.AuthenticationType = AuthenticationTypes.Secure;
                DirectorySearcher ds = new DirectorySearcher(de);
                ds.FindOne();
                // reveal loggedin panel or set/reveal loginError label
                SqlCommand checkName = new SqlCommand("SELECT COUNT(*) FROM [Users] WHERE [userName]='"
                    + Username.Text + "'", sqlConn);
                String nameResult = checkName.ExecuteScalar().ToString();
                if(nameResult != "0")
                {
                    SqlCommand getUserType = new SqlCommand("SELECT DISTINCT [userType] FROM [Users] WHERE [userName]='"
                        + Username.Text + "'", sqlConn);
                    String userType = getUserType.ExecuteScalar().ToString();
                    // set session "LoggedIn = true"
                    Session["LoggedIn"] = userType;
                    CheckLoggedIn(Session["LoggedIn"].ToString());
                    /*// reveal progIDall or progIDother panel
                    PanelLoggedIn.Visible = true;
                    if(userType != "user")
                    {
                        PanelProgIDAll.Visible = true;
                    }
                    else
                    {
                        PanelProgOther.Visible = true;
                    }
                    // hide login panel
                    PanelLogin.Visible = false;*/
                    // set session "SessName"
                    SqlCommand getName = new SqlCommand("SELECT DISTINCT [name] FROM [Users] WHERE [userName]='"
                        + Username.Text + "'", sqlConn);
                    Session["SessName"] = getName.ExecuteScalar().ToString();
                }
                else
                {
                    string loginError = "<div class='alert alert-dismissible alert-danger'>" +
                        "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                        "<h4><strong>Login Error!</strong> You do not have permission to access this application.</h4>" +
                        "</div>";

                    LabelLoginError.Text = loginError;
                    LabelLoginError.Visible = true;
                }
            }
            catch
            {
                //set/reveal loginError label
                string loginError = "<div class='alert alert-dismissible alert-danger'>" +
                    "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                    "<h4><strong>Login Error!</strong> There was a problem with your login, please try again.</h4>" +
                    "</div>";

                LabelLoginError.Text = loginError;
                LabelLoginError.Visible = true;
            }

            sqlConn.Close();
        }


        protected void BtnProgID_Click(object sender, EventArgs e)
        {
            lblSelectedProgram.Text = DropDownListProgramName.SelectedValue;

            //SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand getCourses = new SqlCommand("SELECT CourseName FROM CourseMatrix WHERE ProgramID ='" + lblSelectedProgram.Text + "'",
                sqlConn);
            sqlConn.Open();
            SqlDataReader rCourses = getCourses.ExecuteReader();
            StringBuilder CourseArray = new StringBuilder("");
            while (rCourses.Read())
            {
                CourseArray.Append(rCourses.GetSqlValue(0).ToString() + ",");
            }
            rCourses.Close();
            //string CourseString = CourseArray.ToString();
            //CourseString = CourseString.TrimEnd(' ', ',', '\'');
            //CourseString = CourseString + '\'';
            //CoursesTextBox.Text = CourseArray.ToString();
            Session["ProgCourses"] = CourseArray.ToString();

            DropDownListReviewYear.Enabled = true;
            DropDownListReviewYear.Visible = true;
            BtnRevYr.Visible = true;

            sqlConn.Close();
        }

        protected void DropDownListProgramName_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSelectedProgram.Text = DropDownListProgramName.SelectedValue;

            //SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand getCourses = new SqlCommand("SELECT CourseName FROM CourseMatrix WHERE ProgramID ='" + lblSelectedProgram.Text + "'",
                sqlConn);
            sqlConn.Open();
            SqlDataReader rCourses = getCourses.ExecuteReader();
            StringBuilder CourseArray = new StringBuilder("");
            while (rCourses.Read())
            {
                CourseArray.Append(rCourses.GetSqlValue(0).ToString() + ",");
            }
            rCourses.Close();
            //string CourseString = CourseArray.ToString();
            //CourseString = CourseString.TrimEnd(' ', ',', '\'');
            //CourseString = CourseString + '\'';
            //CoursesTextBox.Text = CourseArray.ToString();
            Session["ProgCourses"] = CourseArray.ToString();

            DropDownListReviewYear.Enabled = true;
            DropDownListReviewYear.Visible = true;
            BtnRevYr.Visible = true;

            sqlConn.Close();
        }

        protected void BtnProgIDOther_Click(object sender, EventArgs e)
        {
            lblSelectedProgram.Text = DropDownListProgramNameOther.SelectedValue;

            //SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            //SqlConnection localConnect = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\RCC5yrProgRev.mdf;Integrated Security=True");
            SqlCommand getCourses = new SqlCommand("SELECT CourseName FROM CourseMatrix WHERE ProgramID ='" + lblSelectedProgram.Text + "'",
                sqlConn);
            sqlConn.Open();
            SqlDataReader rCourses = getCourses.ExecuteReader();
            StringBuilder CourseArray = new StringBuilder("");
            while (rCourses.Read())
            {
                CourseArray.Append(rCourses.GetSqlValue(0).ToString() + ",");
            }
            rCourses.Close();
            //string CourseString = CourseArray.ToString();
            //CourseString = CourseString.TrimEnd(' ', ',', '\'');
            //CourseString = CourseString + '\'';
            //CoursesTextBox.Text = CourseArray.ToString();
            Session["ProgCourses"] = CourseArray.ToString();

            DropDownListReviewYear.Enabled = true;
            DropDownListReviewYear.Visible = true;
            BtnRevYr.Visible = true;

            sqlConn.Close();
        }

        protected void DropDownListProgramNameOther_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSelectedProgram.Text = DropDownListProgramNameOther.SelectedValue;

            //SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand getCourses = new SqlCommand("SELECT CourseName FROM CourseMatrix WHERE ProgramID ='" + lblSelectedProgram.Text + "'",
                sqlConn);
            sqlConn.Open();
            SqlDataReader rCourses = getCourses.ExecuteReader();
            StringBuilder CourseArray = new StringBuilder("");
            while (rCourses.Read())
            {
                CourseArray.Append(rCourses.GetSqlValue(0).ToString() + ",");
            }
            rCourses.Close();
            //string CourseString = CourseArray.ToString();
            //CourseString = CourseString.TrimEnd(' ', ',', '\'');
            //CourseString = CourseString + '\'';
            //CoursesTextBox.Text = CourseArray.ToString();
            Session["ProgCourses"] = CourseArray.ToString();

            DropDownListReviewYear.Enabled = true;
            DropDownListReviewYear.Visible = true;
            BtnRevYr.Visible = true;

            sqlConn.Close();
        }

        protected void BtnRevYr_Click(object sender, EventArgs e)
        {
            lblSelectedYear.Text = DropDownListReviewYear.SelectedValue;
            ButtonGo.Enabled = true;
            ButtonGo.CssClass = "btn btn-lg btn-block btn-success";
        }

        protected void ButtonGo_Click(object sender, EventArgs e)
        {
            Session["SessProgID"] = lblSelectedProgram.Text;
            Session["SessRevYr"] = lblSelectedYear.Text;
            int calcYear = Int32.Parse(Session["SessRevYr"].ToString().Substring(0, 4));
            Session["SessYr1"] = (calcYear - 5).ToString() + "-" + (calcYear - 4).ToString();
            Session["SessYr2"] = (calcYear - 4).ToString() + "-" + (calcYear - 3).ToString();
            Session["SessYr3"] = (calcYear - 3).ToString() + "-" + (calcYear - 2).ToString();
            Session["SessYr4"] = (calcYear - 2).ToString() + "-" + (calcYear - 1).ToString();
            Session["SessYr5"] = (calcYear - 1).ToString() + "-" + (calcYear).ToString();
            Session["SessYr6"] = (calcYear).ToString() + "-" + (calcYear + 1).ToString();
            Session["SessYr7"] = (calcYear + 1).ToString() + "-" + (calcYear + 2).ToString();
            Session["SessYr8"] = (calcYear + 2).ToString() + "-" + (calcYear + 3).ToString();
            Session["SessYrEmploy"] = (calcYear - 8).ToString() + "-" + (calcYear - 7).ToString() +
                " through " + (calcYear - 4).ToString() + "-" + (calcYear - 3).ToString();

            //SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConn.Open();
            SqlCommand getArticulation = new SqlCommand("SELECT COUNT(*) FROM [Articulation] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string emptyArt = getArticulation.ExecuteScalar().ToString();
            if (emptyArt == "0")
            {
                SqlCommand addArticulation = new SqlCommand("INSERT INTO [Articulation] (ProgramID, ReviewYear) VALUES ('" + Session["SessProgID"] + "', '" + Session["SessRevYr"] + "')", sqlConn);
                addArticulation.ExecuteNonQuery();
            }
            SqlCommand getERRE = new SqlCommand("SELECT COUNT(*) FROM [EnrolRecruitRetainEmploy] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string emptyERRE = getERRE.ExecuteScalar().ToString();
            if (emptyERRE == "0")
            {
                SqlCommand addERRE = new SqlCommand("INSERT INTO [EnrolRecruitRetainEmploy] (ProgramID, ReviewYear) VALUES ('" + Session["SessProgID"] + "', '" + Session["SessRevYr"] + "')", sqlConn);
                addERRE.ExecuteNonQuery();
            }
            SqlCommand getReflect = new SqlCommand("SELECT COUNT(*) FROM [Reflection] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string emptyReflect = getReflect.ExecuteScalar().ToString();
            if (emptyReflect == "0")
            {
                SqlCommand addReflect = new SqlCommand("INSERT INTO [Reflection] (ProgramID, ReviewYear) VALUES ('" + Session["SessProgID"] + "', '" + Session["SessRevYr"] + "')", sqlConn);
                addReflect.ExecuteNonQuery();
            }
            SqlCommand getAdvisory = new SqlCommand("SELECT COUNT(*) FROM [CommitteeData] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string emptyAdvisory = getAdvisory.ExecuteScalar().ToString();
            if (emptyAdvisory == "0")
            {
                SqlCommand addAdvisory = new SqlCommand("INSERT INTO [CommitteeData] (ProgramID, ReviewYear) VALUES ('" + Session["SessProgID"] + "', '" + Session["SessRevYr"] + "')", sqlConn);
                addAdvisory.ExecuteNonQuery();
            }
            SqlCommand getBudget = new SqlCommand("SELECT COUNT(*) FROM [Budget] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string emptyBudget = getBudget.ExecuteScalar().ToString();
            if (emptyBudget == "0")
            {
                SqlCommand addBudget = new SqlCommand("INSERT INTO [Budget] (ProgramID, ReviewYear) VALUES ('" + Session["SessProgID"] + "', '" + Session["SessRevYr"] + "')", sqlConn);
                addBudget.ExecuteNonQuery();
            }
            sqlConn.Close();
            Response.Redirect("One.aspx");

        }

        protected void CheckLoggedIn(string userType)
        {
            // reveal progIDall or progIDother panel
            PanelLoggedIn.Visible = true;
            if (userType != "user")
            {
                PanelProgIDAll.Visible = true;
            }
            else
            {
                PanelProgOther.Visible = true;
            }
            // hide login panel
            PanelLogin.Visible = false;

        }

    }
}

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Rcc5yrProgRev
{
    public partial class import : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {
                Response.Redirect("Default.aspx");
            }


            if (Session["LoggedIn"].ToString() != "user")
            {
                HyperLinkImport.Visible = true;
            }

            if (Session["LoggedIn"].ToString() == "user")
            {
                Response.Redirect("One.aspx");
            }

            if (!IsPostBack)
            {
                DropDownListProgramID.SelectedValue = Session["SessProgID"].ToString();

            }

            HyperLinkImportFac.Attributes.Add("data-toggle", "modal");

            SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConn.Open();

            enumFac(sqlConn);

            //SqlCommand getFacNum = new SqlCommand("SELECT COUNT(*) FROM [Faculty] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            //string facNum = getFacNum.ExecuteScalar().ToString();
            //LabelNumFac.Text = facNum;

            SqlCommand getProgName = new SqlCommand("SELECT DISTINCT [ProgramName] FROM [Programs] WHERE ProgramID='" + Session["SessProgID"] + "'", sqlConn);
            string progName = getProgName.ExecuteScalar().ToString();

            LabelLoginProgram.Text = progName;
            LabelLoginReviewYear.Text = Session["SessRevYr"].ToString();

            /*****
             * 
             * Graduate/Retain Import
             * 
             *****

            String getGraduateRetain = "SELECT [Cohort]" +
                ",[Graduated]" +
                ",[Retained]" +
                ",[Neither]" +
                "FROM [GraduateRetain]" + whereCond;

            SqlCommand sqlGraduateRetain = new SqlCommand(getGraduateRetain, sqlConn);
            SqlDataReader graduateRetainReader = sqlGraduateRetain.ExecuteReader();

            while (graduateRetainReader.Read())
            {
                String graduateRetainImportSql = "INSERT INTO [GraduateRetain] (" +
                "[ProgramID]" +
                ",[ReviewYear]" +
                ",[Cohort]" +
                ",[Graduated]" +
                ",[Retained]" +
                ",[Neither]" +
                ") VALUES ('" +
                Session["SessProgID"] + "', '" +
                Session["SessRevYr"] + "', '" +
                graduateRetainReader.GetValue(0) + "', '" +
                graduateRetainReader.GetValue(1) + "', '" +
                graduateRetainReader.GetValue(2) + "', '" +
                graduateRetainReader.GetValue(3) + "')";

                tmpSqlConn.Open();
                SqlCommand graduateRetainImport = new SqlCommand(graduateRetainImportSql, tmpSqlConn);
                graduateRetainImport.ExecuteNonQuery();
                tmpSqlConn.Close();

            }

            graduateRetainReader.Close();*/

            /*****
             * 
             * Accreditation Import
             * 
             *****

            String getAccreditation = "SELECT [Mandate]" +
                ",[Visits]" +
                ",[Frequency]" +
                ",[VisitsNew]" +
                ",[FrequencyNew]" +
                ",[NoFunds]" +
                "FROM [Accreditation]" + whereCond;

            SqlCommand sqlAccreditation = new SqlCommand(getAccreditation, sqlConn);
            SqlDataReader accreditationReader = sqlAccreditation.ExecuteReader();

            while (accreditationReader.Read())
            {
                String accreditationImportSql = "UPDATE [Accreditation] SET" +
                ",[Mandate]='" + accreditationReader.GetValue(0) + "', " +
                ",[Visits]='" + accreditationReader.GetValue(1) + "', " +
                ",[Frequency]='" + accreditationReader.GetValue(2) + "', " +
                ",[VisitsNew]='" + accreditationReader.GetValue(3) + "', " +
                ",[FrequencyNew]='" + accreditationReader.GetValue(4) + "', " +
                ",[NoFunds]='" + accreditationReader.GetValue(5) + "', " +
                "WHERE [ProgramID]='" + Session["SessProgID"] + "'" +
                "' AND [ReviewYear]='" + Session["SessRevYr"] + "'";

                //tmpSqlConn.Open();
                //SqlCommand accreditationImport = new SqlCommand(accreditationImportSql, tmpSqlConn);
                //accreditationImport.ExecuteNonQuery();
                //tmpSqlConn.Close();

                LabelTest.Text = accreditationImportSql;

            }

            accreditationReader.Close();*/

            /*String enrollmentQuery = "INSERT INTO [Rcc5yrProgRev].[dbo].[Enrollment] (" +
                "[ProgramID]" +
                ",[ReviewYear]" +
                ",[Term]" +
                ",[DL]" +
                ",[NonDL]" +
                ") VALUES (" +
                Session["SessProgID"] + ", " +
                Session["SessRevYr"] +
                ", SELECT([Term]" +
                ",[DL]" +
                ",[NonDL]" +
                "FROM [Rcc5yrProgRev].[dbo].[Enrollment]" + whereCond + ")";*/

            /*String employmentQuery = "INSERT INTO [Rcc5yrProgRev].[dbo].[Employment] (" +
                ",[ProgramID] " +
                ",[ReviewYear] " +
                ",[Year] " +
                ",[Employed] " +
                ",[EmployedDegree] " +
                ",[EmployedDiploma] " +
                ",[EmployedCertificate] " +
                ",[MeanAnnualWages] " +
                ",[YrDegree] " +
                ",[YrDiploma] " +
                ",[YrCertificate] " +
                ",[MedianAnnualWages] " +
                ",[PrcntDegree] " +
                ",[PrcntDiploma] " +
                ",[PrcntCertificate] " +
                ") VALUES (" +
                Session["SessProgID"] + ", " +
                Session["SessRevYr"] +
                ", SELECT([Year] " +
                ",[Employed] " +
                ",[EmployedDegree] " +
                ",[EmployedDiploma] " +
                ",[EmployedCertificate] " +
                ",[MeanAnnualWages] " +
                ",[YrDegree] " +
                ",[YrDiploma] " +
                ",[YrCertificate] " +
                ",[MedianAnnualWages] " +
                ",[PrcntDegree] " +
                ",[PrcntDiploma] " +
                ",[PrcntCertificate] " +
                "FROM [Rcc5yrProgRev].[dbo].[Employment]" + whereCond + ")";*/

            /*String degDipCertQuery = "INSERT INTO [Rcc5yrProgRev].[dbo].[DegDipCert] (" +
                "[ProgramID]" +
                ",[ReviewYear]" +
                ",[Degree]" +
                ",[Diploma]" +
                ",[Certificate]" +
                ") VALUES (" +
                Session["SessProgID"] + ", " +
                Session["SessRevYr"] +
                ", SELECT([Degree]" +
                ",[Diploma]" +
                ",[Certificate]" +
                "FROM [Rcc5yrProgRev].[dbo].[DegDipCert]" + whereCond + ")";*/

            /*String coursePerformanceQuery = "INSERT INTO [Rcc5yrProgRev].[dbo].[CoursePerformance] (" +
                "[ProgramID]" +
                ",[ReviewYear]" +
                ",[Years]" +
                ",[Semester]" +
                ",[StudentID]" +
                ",[Term]" +
                ",[TermNumber]" +
                ",[CourseName]" +
                ",[StcSectionNo]" +
                ",[Pass]" +
                ",[Fail]" +
                ",[Grd]" +
                ",[GrdValue]" +
                ") VALUES (" +
                Session["SessProgID"] + ", " +
                Session["SessRevYr"] +
                ", SELECT([Years]" +
                ",[Semester]" +
                ",[StudentID]" +
                ",[Term]" +
                ",[TermNumber]" +
                ",[CourseName]" +
                ",[StcSectionNo]" +
                ",[Pass]" +
                ",[Fail]" +
                ",[Grd]" +
                ",[GrdValue]" +
                "FROM [Rcc5yrProgRev].[dbo].[CoursePerformance]" + whereCond + ")";

            /*String courseMatrixQuery = "INSERT INTO [Rcc5yrProgRev].[dbo].[CourseMatrix] (" +
                ",[ProgramID]" +
                ",[ProgramName]" +
                ",[CourseName]" +
                "FROM[Rcc5yrProgRev].[dbo].[CourseMatrix]" + whereCond + ")"; */

        }

        protected void ButtonProgramID_Click(object sender, EventArgs e)
        {
            LabelProgramID.Text = DropDownListProgramID.SelectedValue;

            DropDownListReviewYear.Visible = true;
            DropDownListReviewYear.Enabled = true;
            ButtonReviewYear.Visible = true;
            ButtonReviewYear.Enabled = true;
        }

        protected void ButtonReviewYear_Click(object sender, EventArgs e)
        {
            LabelReviewYear.Text = DropDownListReviewYear.SelectedValue;
            HyperLinkImportFac.Enabled = true;
            HyperLinkImportFac.CssClass = "btn btn-lg btn-block btn-success";
            ButtonImportData.Enabled = true;
            ButtonImportData.CssClass = "btn btn-lg btn-block btn-success";
        }

        protected void ButtonOverwriteFac_Click(object sender, EventArgs e)
        {

            String whereCond = "WHERE [ProgramID] = '" +
                DropDownListProgramID.SelectedValue +
                "' AND [ReviewYear] = '" +
                DropDownListReviewYear.SelectedValue + "'";

            SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConn.Open();
            SqlConnection tmpSqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            SqlCommand deleteFac = new SqlCommand("DELETE from [Faculty] WHERE [ProgramID]='"
                + Session["SessProgID"] + "' AND [ReviewYear]='" + Session["SessRevYr"] + "'", sqlConn);
            deleteFac.ExecuteNonQuery();

            /*****
             * 
             * Faculty Import
             * 
             *****/

            String getFaculty = "Select[Name]" +
                ",[FullTime]" +
                ",[Credentials]" +
                ",[CredentialDate]" +
                ",[CredentialInstitution]" +
                ",[Courses]" +
                ",[Affiliations]" +
                ",[StartDate]" +
                ",[EndDate]" +
                ",[LeadFaculty]" +
                ",[SectionsYr1]" +
                ",[StudentsYr1]" +
                ",[SectionsYr2]" +
                ",[StudentsYr2]" +
                ",[SectionsYr3]" +
                ",[StudentsYr3]" +
                ",[SectionsYr4]" +
                ",[StudentsYr4]" +
                ",[SectionsYr5]" +
                ",[StudentsYr5]" +
                ",[Advisees]" +
                ",[Committees]" +
                ",[SpecialProjects]" +
                ",[Other]" +
                "FROM [Faculty]" + whereCond;

            SqlCommand sqlFaculty = new SqlCommand(getFaculty, sqlConn);
            SqlDataReader facultyReader = sqlFaculty.ExecuteReader();

            String strtEndDate = "";
            String strtEndDateVal = "";

            while (facultyReader.Read())
            {
                if (facultyReader.GetValue(8).ToString().Equals(""))
                {
                    strtEndDate = ",[StartDate]";
                    strtEndDateVal = facultyReader.GetValue(7).ToString().ToString().Replace("'", "''");
                }
                else
                {
                    strtEndDate = ",[StartDate],[EndDate]";
                    strtEndDateVal = facultyReader.GetValue(7).ToString().ToString().Replace("'", "''") + "', '"
                        + facultyReader.GetValue(8).ToString().ToString().Replace("'", "''");
                }
                String facultyImportSql = "INSERT INTO [Faculty] (" +
                "[ProgramID]" +
                ",[ReviewYear]" +
                ",[Name]" +
                ",[FullTime]" +
                ",[Credentials]" +
                ",[CredentialDate]" +
                ",[CredentialInstitution]" +
                ",[Courses]" +
                ",[Affiliations]" +
                strtEndDate +
                ",[LeadFaculty]" +
                ",[SectionsYr1]" +
                ",[StudentsYr1]" +
                ",[SectionsYr2]" +
                ",[StudentsYr2]" +
                ",[SectionsYr3]" +
                ",[StudentsYr3]" +
                ",[SectionsYr4]" +
                ",[StudentsYr4]" +
                ",[SectionsYr5]" +
                ",[StudentsYr5]" +
                ",[Advisees]" +
                ",[Committees]" +
                ",[SpecialProjects]" +
                ",[Other]" +
                ") VALUES ('" +
                Session["SessProgID"] + "', '" +
                Session["SessRevYr"] + "', '" +
                facultyReader.GetValue(0).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(1).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(2).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(3).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(4).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(5).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(6).ToString().Replace("'", "''") + "', '"
                + strtEndDateVal + "', '"
                + facultyReader.GetValue(9).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(10).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(11).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(12).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(13).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(14).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(15).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(16).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(17).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(18).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(19).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(20).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(21).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(22).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(23).ToString().Replace("'", "''") + "')";

                tmpSqlConn.Open();
                SqlCommand facultyImport = new SqlCommand(facultyImportSql, tmpSqlConn);
                facultyImport.ExecuteNonQuery();
                tmpSqlConn.Close();

            }
            facultyReader.Close();
            enumFac(sqlConn);

            sqlConn.Close();
            //Response.Redirect("One.aspx");

        }

        protected void ButtonImportFac_Click(object sender, EventArgs e)
        {

            String whereCond = "WHERE [ProgramID] = '" +
                DropDownListProgramID.SelectedValue +
                "' AND [ReviewYear] = '" +
                DropDownListReviewYear.SelectedValue + "'";

            SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConn.Open();
            SqlConnection tmpSqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            /*****
             * 
             * Faculty Import
             * 
             *****/

            String getFaculty = "Select[Name]" +
                ",[FullTime]" +
                ",[Credentials]" +
                ",[CredentialDate]" +
                ",[CredentialInstitution]" +
                ",[Courses]" +
                ",[Affiliations]" +
                ",[StartDate]" +
                ",[EndDate]" +
                ",[LeadFaculty]" +
                ",[SectionsYr1]" +
                ",[StudentsYr1]" +
                ",[SectionsYr2]" +
                ",[StudentsYr2]" +
                ",[SectionsYr3]" +
                ",[StudentsYr3]" +
                ",[SectionsYr4]" +
                ",[StudentsYr4]" +
                ",[SectionsYr5]" +
                ",[StudentsYr5]" +
                ",[Advisees]" +
                ",[Committees]" +
                ",[SpecialProjects]" +
                ",[Other]" +
                "FROM [Faculty]" + whereCond;

            SqlCommand sqlFaculty = new SqlCommand(getFaculty, sqlConn);
            SqlDataReader facultyReader = sqlFaculty.ExecuteReader();

            String strtEndDate = "";
            String strtEndDateVal = "";

            while (facultyReader.Read())
            {
                if (facultyReader.GetValue(8).ToString().Equals(""))
                {
                    strtEndDate = ",[StartDate]";
                    strtEndDateVal = facultyReader.GetValue(7).ToString().ToString().Replace("'", "''");
                }
                else
                {
                    strtEndDate = ",[StartDate],[EndDate]";
                    strtEndDateVal = facultyReader.GetValue(7).ToString().ToString().Replace("'", "''") + "', '"
                        + facultyReader.GetValue(8).ToString().ToString().Replace("'", "''");
                }
                String facultyImportSql = "INSERT INTO [Faculty] (" +
                "[ProgramID]" +
                ",[ReviewYear]" +
                ",[Name]" +
                ",[FullTime]" +
                ",[Credentials]" +
                ",[CredentialDate]" +
                ",[CredentialInstitution]" +
                ",[Courses]" +
                ",[Affiliations]" +
                strtEndDate +
                ",[LeadFaculty]" +
                ",[SectionsYr1]" +
                ",[StudentsYr1]" +
                ",[SectionsYr2]" +
                ",[StudentsYr2]" +
                ",[SectionsYr3]" +
                ",[StudentsYr3]" +
                ",[SectionsYr4]" +
                ",[StudentsYr4]" +
                ",[SectionsYr5]" +
                ",[StudentsYr5]" +
                ",[Advisees]" +
                ",[Committees]" +
                ",[SpecialProjects]" +
                ",[Other]" +
                ") VALUES ('" +
                Session["SessProgID"] + "', '" +
                Session["SessRevYr"] + "', '" +
                facultyReader.GetValue(0).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(1).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(2).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(3).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(4).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(5).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(6).ToString().Replace("'", "''") + "', '"
                + strtEndDateVal + "', '"
                + facultyReader.GetValue(9).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(10).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(11).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(12).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(13).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(14).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(15).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(16).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(17).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(18).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(19).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(20).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(21).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(22).ToString().Replace("'", "''") + "', '"
                + facultyReader.GetValue(23).ToString().Replace("'", "''") + "')";

                tmpSqlConn.Open();
                SqlCommand facultyImport = new SqlCommand(facultyImportSql, tmpSqlConn);
                facultyImport.ExecuteNonQuery();
                tmpSqlConn.Close();

            }
            facultyReader.Close();
            enumFac(sqlConn);

            sqlConn.Close();
            //Response.Redirect("One.aspx");

        }

        protected void enumFac(SqlConnection sqlConn)
        {
            SqlCommand getFacNum = new SqlCommand("SELECT COUNT(*) FROM [Faculty] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string facNum = getFacNum.ExecuteScalar().ToString();
            LabelNumFac.Text = facNum;
        }

        protected void ButtonImportData_Click(object sender, EventArgs e)
        {

            String whereCond = "WHERE [ProgramID] = '" +
                DropDownListProgramID.SelectedValue +
                "' AND [ReviewYear] = '" +
                DropDownListReviewYear.SelectedValue + "'";

            SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConn.Open();
            SqlConnection tmpSqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            /*@@@@@@@@
             @
             @ Single Queries
             @ 
             @@@@@@@@*/

            /*****
             * 
             * Articulation Import/Update
             * 
             *****/

            String getArticulation = "SELECT [AppalachianStateUniversity]" +
                ",[EastCarolinaUniversity]" +
                ",[ElizabethCityStateUniversity]" +
                ",[FayettevilleStateUniversity]" +
                ",[NCAgriculturalandTechnicalStateUniversity]" +
                ",[NCStateUniversity]" +
                ",[NorthCarolinaCentralUniversity]" +
                ",[UNCAsheville]" +
                ",[UNCChapelHill]" +
                ",[UNCCharlotte]" +
                ",[UNCGreensboro]" +
                ",[UNCPembroke]" +
                ",[UNCWilmington]" +
                ",[UNCSchooloftheArts]" +
                ",[WesternCarolinaUniversity]" +
                ",[WinstonSalemStateUniversity]" +
                ",[OtherPrivUni]" +
                ",[OtherStateUni]" +
                ",[Explain]" +
                ",[NewAgreement]" +
                "FROM [Articulation]" + whereCond;

            SqlCommand sqlArticulation = new SqlCommand(getArticulation, sqlConn);
            SqlDataReader articulationReader = sqlArticulation.ExecuteReader();

            while (articulationReader.Read())
            {
                String articulationImportSql = "UPDATE [Articulation] SET" +
                "[AppalachianStateUniversity]='" + articulationReader.GetValue(0).ToString().Replace("'", "''") + "', " +
                "[EastCarolinaUniversity]='" + articulationReader.GetValue(1).ToString().Replace("'", "''") + "', " +
                "[ElizabethCityStateUniversity]='" + articulationReader.GetValue(2).ToString().Replace("'", "''") + "', " +
                "[FayettevilleStateUniversity]='" + articulationReader.GetValue(3).ToString().Replace("'", "''") + "', " +
                "[NCAgriculturalandTechnicalStateUniversity]='" + articulationReader.GetValue(4).ToString().Replace("'", "''") + "', " +
                "[NCStateUniversity]='" + articulationReader.GetValue(5).ToString().Replace("'", "''") + "', " +
                "[NorthCarolinaCentralUniversity]='" + articulationReader.GetValue(6).ToString().Replace("'", "''") + "', " +
                "[UNCAsheville]='" + articulationReader.GetValue(7).ToString().Replace("'", "''") + "', " +
                "[UNCChapelHill]='" + articulationReader.GetValue(8).ToString().Replace("'", "''") + "', " +
                "[UNCCharlotte]='" + articulationReader.GetValue(9).ToString().Replace("'", "''") + "', " +
                "[UNCGreensboro]='" + articulationReader.GetValue(10).ToString().Replace("'", "''") + "', " +
                "[UNCPembroke]='" + articulationReader.GetValue(11).ToString().Replace("'", "''") + "', " +
                "[UNCWilmington]='" + articulationReader.GetValue(12).ToString().Replace("'", "''") + "', " +
                "[UNCSchooloftheArts]='" + articulationReader.GetValue(13).ToString().Replace("'", "''") + "', " +
                "[WesternCarolinaUniversity]='" + articulationReader.GetValue(14).ToString().Replace("'", "''") + "', " +
                "[WinstonSalemStateUniversity]='" + articulationReader.GetValue(15).ToString().Replace("'", "''") + "', " +
                "[OtherPrivUni]='" + articulationReader.GetValue(16).ToString().Replace("'", "''") + "', " +
                "[OtherStateUni]='" + articulationReader.GetValue(17).ToString().Replace("'", "''") + "', " +
                "[Explain]='" + articulationReader.GetValue(18).ToString().Replace("'", "''") + "', " +
                "[NewAgreement]='" + articulationReader.GetValue(19).ToString().Replace("'", "''") + "' " +
                "WHERE [ProgramID]='" + Session["SessProgID"] + "'" +
                " AND [ReviewYear]='" + Session["SessRevYr"] + "'";

                tmpSqlConn.Open();
                SqlCommand articulationImport = new SqlCommand(articulationImportSql, tmpSqlConn);
                articulationImport.ExecuteNonQuery();
                tmpSqlConn.Close();

            }

            articulationReader.Close();

            /*****
             * 
             * Budget Import/Update
             * 
             *****/

            String getBudget = "SELECT [OldVisits]" +
            ",[NewVisits]" +
            ",[ExpendYr1]" +
            ",[ExpendYr2]" +
            ",[ExpendYr3]" +
            ",[ExpendYr4]" +
            ",[ExpendYr5]" +
            ",[Alternative]" +
            "FROM [Budget]" + whereCond;

            SqlCommand sqlBudget = new SqlCommand(getBudget, sqlConn);
            SqlDataReader budgetReader = sqlBudget.ExecuteReader();

            while (budgetReader.Read())
            {
                String budgetImportSql = "UPDATE [Budget] SET" +
                "[OldVisits]='" + budgetReader.GetValue(0).ToString().Replace("'", "''") + "'" +
                ",[NewVisits]='" + budgetReader.GetValue(1).ToString().Replace("'", "''") + "'" +
                ",[ExpendYr1]='" + budgetReader.GetValue(2).ToString().Replace("'", "''") + "'" +
                ",[ExpendYr2]='" + budgetReader.GetValue(3).ToString().Replace("'", "''") + "'" +
                ",[ExpendYr3]='" + budgetReader.GetValue(4).ToString().Replace("'", "''") + "'" +
                ",[ExpendYr4]='" + budgetReader.GetValue(5).ToString().Replace("'", "''") + "'" +
                ",[ExpendYr5]='" + budgetReader.GetValue(6).ToString().Replace("'", "''") + "'" +
                ",[Alternative]='" + budgetReader.GetValue(7).ToString().Replace("'", "''") + "'" +
                " WHERE [ProgramID]='" + Session["SessProgID"] + "'" +
                " AND [ReviewYear]='" + Session["SessRevYr"] + "'";

                tmpSqlConn.Open();
                SqlCommand budgetImport = new SqlCommand(budgetImportSql, tmpSqlConn);
                budgetImport.ExecuteNonQuery();
                tmpSqlConn.Close();

            }

            budgetReader.Close();

            /*****
             * 
             * CommitteeData Import/Update
             * 
             *****/

            String getCommitteeData = "SELECT [NumMeetingsYr1]" +
            ",[AttendanceYr1]" +
            ",[DiscussYr1]" +
            ",[ReccomendYr1]" +
            ",[NumMeetingsYr2]" +
            ",[AttendanceYr2]" +
            ",[DiscussYr2]" +
            ",[ReccomendYr2]" +
            ",[NumMeetingsYr3]" +
            ",[AttendanceYr3]" +
            ",[DiscussYr3]" +
            ",[ReccomendYr3]" +
            ",[NumMeetingsYr4]" +
            ",[AttendanceYr4]" +
            ",[DiscussYr4]" +
            ",[ReccomendYr4]" +
            ",[NumMeetingsYr5]" +
            ",[AttendanceYr5]" +
            ",[DiscussYr5]" +
            ",[ReccomendYr5]" +
            ",[Comment]" +
            "FROM [CommitteeData]" + whereCond;

            SqlCommand sqlCommitteeData = new SqlCommand(getCommitteeData, sqlConn);
            SqlDataReader committeeDataReader = sqlCommitteeData.ExecuteReader();

            while (committeeDataReader.Read())
            {
                String committeeDataImportSql = "UPDATE [CommitteeData] SET" +
                "[NumMeetingsYr1]='" + committeeDataReader.GetValue(0).ToString().Replace("'", "''") + "'" +
                ",[AttendanceYr1]='" + committeeDataReader.GetValue(1).ToString().Replace("'", "''") + "'" +
                ",[DiscussYr1]='" + committeeDataReader.GetValue(2).ToString().Replace("'", "''") + "'" +
                ",[ReccomendYr1]='" + committeeDataReader.GetValue(3).ToString().Replace("'", "''") + "'" +
                ",[NumMeetingsYr2]='" + committeeDataReader.GetValue(4).ToString().Replace("'", "''") + "'" +
                ",[AttendanceYr2]='" + committeeDataReader.GetValue(5).ToString().Replace("'", "''") + "'" +
                ",[DiscussYr2]='" + committeeDataReader.GetValue(6).ToString().Replace("'", "''") + "'" +
                ",[ReccomendYr2]='" + committeeDataReader.GetValue(7).ToString().Replace("'", "''") + "'" +
                ",[NumMeetingsYr3]='" + committeeDataReader.GetValue(8).ToString().Replace("'", "''") + "'" +
                ",[AttendanceYr3]='" + committeeDataReader.GetValue(9).ToString().Replace("'", "''") + "'" +
                ",[DiscussYr3]='" + committeeDataReader.GetValue(10).ToString().Replace("'", "''") + "'" +
                ",[ReccomendYr3]='" + committeeDataReader.GetValue(11).ToString().Replace("'", "''") + "'" +
                ",[NumMeetingsYr4]='" + committeeDataReader.GetValue(12).ToString().Replace("'", "''") + "'" +
                ",[AttendanceYr4]='" + committeeDataReader.GetValue(13).ToString().Replace("'", "''") + "'" +
                ",[DiscussYr4]='" + committeeDataReader.GetValue(14).ToString().Replace("'", "''") + "'" +
                ",[ReccomendYr4]='" + committeeDataReader.GetValue(15).ToString().Replace("'", "''") + "'" +
                ",[NumMeetingsYr5]='" + committeeDataReader.GetValue(16).ToString().Replace("'", "''") + "'" +
                ",[AttendanceYr5]='" + committeeDataReader.GetValue(17).ToString().Replace("'", "''") + "'" +
                ",[DiscussYr5]='" + committeeDataReader.GetValue(18).ToString().Replace("'", "''") + "'" +
                ",[ReccomendYr5]='" + committeeDataReader.GetValue(19).ToString().Replace("'", "''") + "'" +
                ",[Comment]='" + committeeDataReader.GetValue(20).ToString().Replace("'", "''") + "'" +
                " WHERE [ProgramID]='" + Session["SessProgID"] + "'" +
                " AND [ReviewYear]='" + Session["SessRevYr"] + "'";

                tmpSqlConn.Open();
                SqlCommand committeeDataImport = new SqlCommand(committeeDataImportSql, tmpSqlConn);
                committeeDataImport.ExecuteNonQuery();
                tmpSqlConn.Close();

            }

            committeeDataReader.Close();

            /*****
             * 
             * EnrolRecruitRetainEmploy Import/Update
             * 
             *****/

            String getEnrolRecruitRetainEmploy = "SELECT [Enrollment]" +
            ",[Recruitment]" +
            ",[Retention]" +
            ",[Comment]" +
            ",[Assess]" +
            "FROM [EnrolRecruitRetainEmploy]" + whereCond;

            SqlCommand sqlEnrolRecruitRetainEmploy = new SqlCommand(getEnrolRecruitRetainEmploy, sqlConn);
            SqlDataReader enrolRecruitRetainEmployReader = sqlEnrolRecruitRetainEmploy.ExecuteReader();

            while (enrolRecruitRetainEmployReader.Read())
            {
                String enrolRecruitRetainEmployImportSql = "UPDATE [EnrolRecruitRetainEmploy] SET" +
                "[Enrollment]='" + enrolRecruitRetainEmployReader.GetValue(0).ToString().Replace("'", "''") + "'" +
                ",[Recruitment]='" + enrolRecruitRetainEmployReader.GetValue(1).ToString().Replace("'", "''") + "'" +
                ",[Retention]='" + enrolRecruitRetainEmployReader.GetValue(2).ToString().Replace("'", "''") + "'" +
                ",[Comment]='" + enrolRecruitRetainEmployReader.GetValue(3).ToString().Replace("'", "''") + "'" +
                ",[Assess]='" + enrolRecruitRetainEmployReader.GetValue(4).ToString().Replace("'", "''") + "'" +
                " WHERE [ProgramID]='" + Session["SessProgID"] + "'" +
                " AND [ReviewYear]='" + Session["SessRevYr"] + "'";

                tmpSqlConn.Open();
                SqlCommand enrolRecruitRetainEmployImport = new SqlCommand(enrolRecruitRetainEmployImportSql, tmpSqlConn);
                enrolRecruitRetainEmployImport.ExecuteNonQuery();
                tmpSqlConn.Close();

            }

            enrolRecruitRetainEmployReader.Close();

            /*****
             * 
             * Reflect Import/Update
             * 
             *****/

            String getReflection = "SELECT [Strengths]" +
                ",[Opportunities]" +
                ",[Courses]" +
                ",[Programs]" +
                ",[Conference]" +
                ",[Dialog]" +
                ",[DocImprovements]" +
                ",[NewDegreeCert]" +
                ",[Workshop]" +
                ",[SuccessCon]" +
                ",[Development]" +
                ",[Minutes]" +
                ",[Reorganize]" +
                ",[Other]" +
                ",[Comment]" +
                ",[Summary]" +
                "FROM [Reflection]" + whereCond;

            SqlCommand sqlReflection = new SqlCommand(getReflection, sqlConn);
            SqlDataReader reflectionReader = sqlReflection.ExecuteReader();

            while (reflectionReader.Read())
            {
                String reflectionImportSql = "UPDATE [Reflection] SET" +
                "[Strengths]='" + reflectionReader.GetValue(0).ToString().Replace("'", "''") + "'" +
                ",[Opportunities]='" + reflectionReader.GetValue(1).ToString().Replace("'", "''") + "'" +
                ",[Courses]='" + reflectionReader.GetValue(2).ToString().Replace("'", "''") + "'" +
                ",[Programs]='" + reflectionReader.GetValue(3).ToString().Replace("'", "''") + "'" +
                ",[Conference]='" + reflectionReader.GetValue(4).ToString().Replace("'", "''") + "'" +
                ",[Dialog]='" + reflectionReader.GetValue(5).ToString().Replace("'", "''") + "'" +
                ",[DocImprovements]='" + reflectionReader.GetValue(6).ToString().Replace("'", "''") + "'" +
                ",[NewDegreeCert]='" + reflectionReader.GetValue(7).ToString().Replace("'", "''") + "'" +
                ",[Workshop]='" + reflectionReader.GetValue(8).ToString().Replace("'", "''") + "'" +
                ",[SuccessCon]='" + reflectionReader.GetValue(9).ToString().Replace("'", "''") + "'" +
                ",[Development]='" + reflectionReader.GetValue(10).ToString().Replace("'", "''") + "'" +
                ",[Minutes]='" + reflectionReader.GetValue(11).ToString().Replace("'", "''") + "'" +
                ",[Reorganize]='" + reflectionReader.GetValue(12).ToString().Replace("'", "''") + "'" +
                ",[Other]='" + reflectionReader.GetValue(13).ToString().Replace("'", "''") + "'" +
                ",[Comment]='" + reflectionReader.GetValue(14).ToString().Replace("'", "''") + "'" +
                ",[Summary]='" + reflectionReader.GetValue(15).ToString().Replace("'", "''") + "'" +
                " WHERE [ProgramID]='" + Session["SessProgID"] + "'" +
                " AND [ReviewYear]='" + Session["SessRevYr"] + "'";

                tmpSqlConn.Open();
                SqlCommand reflectionImport = new SqlCommand(reflectionImportSql, tmpSqlConn);
                reflectionImport.ExecuteNonQuery();
                tmpSqlConn.Close();

            }

            reflectionReader.Close();

            /*@@@@@@@@
             @
             @ ForEach Queries
             @ 
             @@@@@@@@*/

            /*****
             * 
             * Accrediting Entities Import
             * 
             *****/

            SqlCommand getAccredEntitiesNum = new SqlCommand("SELECT COUNT(*) FROM [AccredEntities] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string accredEntitiesNum = getAccredEntitiesNum.ExecuteScalar().ToString();

            if (accredEntitiesNum =="0")
            {

                String getAccredEntities = "SELECT[Origin]" +
                ",[New]" +
                ",[Entity]" +
                ",[Renewal]" +
                ",[Expenses]" +
                ",[Faculty]" +
                ",[Visits]" +
                "FROM [AccredEntities]" + whereCond;

                SqlCommand sqlAccredEntities = new SqlCommand(getAccredEntities, sqlConn);
                SqlDataReader accredEntitiesReader = sqlAccredEntities.ExecuteReader();

                while (accredEntitiesReader.Read())
                {
                    String accredEntitiesImportSql = "INSERT INTO [AccredEntities] (" +
                    "[ProgramID]" +
                    ",[ReviewYear]" +
                    ",[Origin]" +
                    ",[New]" +
                    ",[Entity]" +
                    ",[Renewal]" +
                    ",[Expenses]" +
                    ",[Faculty]" +
                    ",[Visits]" +
                    ") VALUES ('" +
                    Session["SessProgID"] + "', '" +
                    Session["SessRevYr"] + "', '" +
                    accredEntitiesReader.GetValue(0).ToString().Replace("'", "''") + "', '" +
                    accredEntitiesReader.GetValue(1).ToString().Replace("'", "''") + "', '" +
                    accredEntitiesReader.GetValue(2).ToString().Replace("'", "''") + "', '" +
                    accredEntitiesReader.GetValue(3).ToString().Replace("'", "''") + "', '" +
                    accredEntitiesReader.GetValue(4).ToString().Replace("'", "''") + "', '" +
                    accredEntitiesReader.GetValue(5).ToString().Replace("'", "''") + "', '" +
                    accredEntitiesReader.GetValue(6).ToString().Replace("'", "''") + "')";

                    tmpSqlConn.Open();
                    SqlCommand accredEntitiesImport = new SqlCommand(accredEntitiesImportSql, tmpSqlConn);
                    accredEntitiesImport.ExecuteNonQuery();
                    tmpSqlConn.Close();

                }

                accredEntitiesReader.Close();

            }

            /*****
             * 
             * Committee Import
             * 
             *****/

            SqlCommand getCommitteeNum = new SqlCommand("SELECT COUNT(*) FROM [Committee] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string committeeNum = getCommitteeNum.ExecuteScalar().ToString();

            if (committeeNum == "0")
            {

                String getCommittee = "SELECT [Name]" +
                ",[Title]" +
                ",[Affiliation]" +
                ",[Contact]" +
                ",[Joined]" +
                "FROM [Committee]" + whereCond;

                SqlCommand sqlCommittee = new SqlCommand(getCommittee, sqlConn);
                SqlDataReader committeeReader = sqlCommittee.ExecuteReader();

                while (committeeReader.Read())
                {
                    String committeeImportSql = "INSERT INTO [Committee] (" +
                    "[ProgramID]" +
                    ",[ReviewYear]" +
                    ",[Name]" +
                    ",[Title]" +
                    ",[Affiliation]" +
                    ",[Contact]" +
                    ",[Joined]" +
                    ") VALUES ('" +
                    Session["SessProgID"] + "', '" +
                    Session["SessRevYr"] + "', '" +
                    committeeReader.GetValue(0).ToString().Replace("'", "''") + "', '" +
                    committeeReader.GetValue(1).ToString().Replace("'", "''") + "', '" +
                    committeeReader.GetValue(2).ToString().Replace("'", "''") + "', '" +
                    committeeReader.GetValue(3).ToString().Replace("'", "''") + "', '" +
                    committeeReader.GetValue(4).ToString().Replace("'", "''") + "')";

                    tmpSqlConn.Open();
                    SqlCommand committeeImport = new SqlCommand(committeeImportSql, tmpSqlConn);
                    committeeImport.ExecuteNonQuery();
                    tmpSqlConn.Close();

                }

                committeeReader.Close();

            }

            /*****
             * 
             * Objectives Import
             * 
             *****/

            SqlCommand getObjectivesOutcomesNum = new SqlCommand("SELECT COUNT(*) FROM [ObjectivesOutcomes] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string objectivesOutcomesNum = getObjectivesOutcomesNum.ExecuteScalar().ToString();

            if (objectivesOutcomesNum == "0")
            {

                String getObjectives = "SELECT [ObjectiveOutcome]" +
                ",[RelationshipToMission]" +
                ",[Introduced]" +
                ",[Reinforced]" +
                ",[Emphasized]" +
                ",[Assessed]" +
                ",[Year1]" +
                ",[Year2]" +
                ",[Year3]" +
                ",[Year4]" +
                ",[Year5]" +
                "FROM [ObjectivesOutcomes]" + whereCond;

                SqlCommand sqlObjectives = new SqlCommand(getObjectives, sqlConn);
                SqlDataReader objectivesReader = sqlObjectives.ExecuteReader();

                while (objectivesReader.Read())
                {
                    String objectivesImportSql = "INSERT INTO [ObjectivesOutcomes] (" +
                    "[ProgramID]" +
                    ",[ReviewYear]" +
                    ",[ObjectiveOutcome]" +
                    ",[RelationshipToMission]" +
                    ",[Introduced]" +
                    ",[Reinforced]" +
                    ",[Emphasized]" +
                    ",[Assessed]" +
                    ",[Year1]" +
                    ",[Year2]" +
                    ",[Year3]" +
                    ",[Year4]" +
                    ",[Year5]" +
                    ") VALUES ('" +
                    Session["SessProgID"] + "', '" +
                    Session["SessRevYr"] + "', '" +
                    objectivesReader.GetValue(0).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(1).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(2).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(3).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(4).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(5).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(6).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(7).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(8).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(9).ToString().Replace("'", "''") + "', '" +
                    objectivesReader.GetValue(10).ToString().Replace("'", "''") + "')";

                    tmpSqlConn.Open();
                    SqlCommand objectivesImport = new SqlCommand(objectivesImportSql, tmpSqlConn);
                    objectivesImport.ExecuteNonQuery();
                    tmpSqlConn.Close();

                }

                objectivesReader.Close();

            }

            /*****
             * 
             * Planning Import
             * 
             *****/

            SqlCommand getPlanningNum = new SqlCommand("SELECT COUNT(*) FROM [Planning] WHERE ProgramID='" + Session["SessProgID"] + "' AND ReviewYear='" + Session["SessRevYr"] + "'", sqlConn);
            string planningNum = getPlanningNum.ExecuteScalar().ToString();

            if (planningNum == "0")
            {

                String getPlanning = "SELECT [Plan]" +
                ",[Change]" +
                ",[Links]" +
                ",[IsCost]" +
                ",[NeedYr1]" +
                ",[CostY1]" +
                ",[PriorityY1]" +
                ",[NeedYr2]" +
                ",[CostY2]" +
                ",[PriorityY2]" +
                ",[NeedYr3]" +
                ",[CostY3]" +
                ",[PriorityY3]" +
                ",[Explain]" +
                "FROM [Planning]" + whereCond;

                SqlCommand sqlPlanning = new SqlCommand(getPlanning, sqlConn);
                SqlDataReader planningReader = sqlPlanning.ExecuteReader();

                while (planningReader.Read())
                {
                    String planningImportSql = "INSERT INTO [Planning] (" +
                    "[ProgramID]" +
                    ",[ReviewYear]" +
                    ",[Plan]" +
                    ",[Change]" +
                    ",[Links]" +
                    ",[IsCost]" +
                    ",[NeedYr1]" +
                    ",[CostY1]" +
                    ",[PriorityY1]" +
                    ",[NeedYr2]" +
                    ",[CostY2]" +
                    ",[PriorityY2]" +
                    ",[NeedYr3]" +
                    ",[CostY3]" +
                    ",[PriorityY3]" +
                    ",[Explain]" +
                    ") VALUES ('" +
                    Session["SessProgID"] + "', '" +
                    Session["SessRevYr"] + "', '" +
                    planningReader.GetValue(0).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(1).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(2).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(3).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(4).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(5).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(6).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(7).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(8).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(9).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(10).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(11).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(12).ToString().Replace("'", "''") + "', '" +
                    planningReader.GetValue(13).ToString().Replace("'", "''") + "')";

                    tmpSqlConn.Open();
                    SqlCommand planningImport = new SqlCommand(planningImportSql, tmpSqlConn);
                    planningImport.ExecuteNonQuery();
                    tmpSqlConn.Close();

                }

                planningReader.Close();

            }

            sqlConn.Close();
            //Response.Redirect("One.aspx");

            /*********
             * 
             * Files Import
             * 
             *********/
            string idSrc = DropDownListProgramID.SelectedValue;
            string yrSrc = DropDownListReviewYear.SelectedValue;
            string fldrSrc = idSrc + "_" + yrSrc;

            string idTrgt = Session["SessProgID"].ToString();
            string yrTrgt = Session["SessRevYr"].ToString();
            string fldrTrgt = idTrgt + "_" + yrTrgt;

            string source = "~/Attachments/" + fldrSrc;
            string target = "~/Attachments/" + fldrTrgt;

            string[] directories = System.IO.Directory.GetDirectories(Server.MapPath(source));

            if (!System.IO.Directory.Exists(Server.MapPath(target)))
            {
                System.IO.Directory.CreateDirectory(Server.MapPath(target));
            }

            foreach (string srcDir in directories)
            {
                string trgtDir = srcDir.Replace(fldrSrc, fldrTrgt);

                if (!System.IO.Directory.Exists(trgtDir))
                {
                    System.IO.Directory.CreateDirectory(trgtDir);
                }

                string[] files = System.IO.Directory.GetFiles(srcDir);

                foreach (string srcFile in files)
                {
                    string fileName = System.IO.Path.GetFileName(srcFile);
                    string trgtFile = System.IO.Path.Combine(trgtDir, fileName);
                    System.IO.File.Copy(srcFile, trgtFile, true);
                }

            }
            string Importmessage = "<div class='alert alert-dismissible alert-success'>" +
                "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                "<h4><strong>Import complete.</strong></h4>" +
                "</div>";

            LabelImportMessage.Text = Importmessage;

        }
    }
}
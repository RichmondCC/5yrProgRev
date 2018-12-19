using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.DirectoryServices;
using System.Data.SqlClient;

namespace Rcc5yrProgRev
{
    public partial class Login_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {

            SqlConnection sqlConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
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
                Label1.Text = "True";

            }
            catch
            {
                Label1.Text = "False";

            }

            SqlCommand getPrograms = new SqlCommand("SELECT [programName] FROM [Users] WHERE [userName]='" 
                + Username.Text + "'", sqlConn);
            Label2.Text = getPrograms.ExecuteScalar().ToString();

            sqlConn.Close();
        }
    }
}
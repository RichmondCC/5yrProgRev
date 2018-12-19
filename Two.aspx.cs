using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

namespace Rcc5yrProgRev
{
    public partial class Two : System.Web.UI.Page
    {
        private string ProgID;
        private string RevYr;
        private string formPart = "/PartTwo";
        private string subDir;

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

            ProgID = Session["SessProgID"].ToString();
            RevYr = Session["SessRevYr"].ToString();
            subDir = ProgID + "_" + RevYr + formPart;

            if (!IsPostBack)
            {
                if (!System.IO.Directory.Exists(Server.MapPath("~/Attachments/" + subDir)))
                {
                    System.IO.Directory.CreateDirectory(Server.MapPath("~/Attachments/" + subDir));
                }

                PopulateUploads();

            }
        }

        protected void rccUploadButton_Click(object sender, EventArgs e)
        {
            string FileName = rccUploadForm.FileName;
            string UploadPath = Server.MapPath("~/Attachments/" + subDir);
            if (File.Exists(UploadPath + "/" + FileName))
            {
                File.Delete(UploadPath + "/" + FileName);
            }
            rccUploadForm.SaveAs(UploadPath + "/" + FileName);
            DropDownListDocs.Items.Clear();
            PopulateUploads();
        }

        protected void ButtonViewDoc_Click(object sender, EventArgs e)
        {
            if (DropDownListDocs.SelectedValue != "<< Select File >>")
            {
                LabelAttachError.Text = "";
                string script = "window.open('Attachments/" + subDir + "/"
                    + DropDownListDocs.SelectedValue + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "script", script, true);
                DropDownListDocs.Items.Clear();
                PopulateUploads();
            }
            else
            {
                AttachmentError();
            }
        }

        protected void ButtonDelConfirm_Click(object sender, EventArgs e)
        {
            if (DropDownListDocs.SelectedValue != "<< Select File >>")
            {
                LabelAttachError.Text = "";
                string deleteFile = Server.MapPath("~/Attachments/" + subDir + "/"
                      + DropDownListDocs.SelectedValue);
                File.Delete(deleteFile);
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                AttachmentError();
            }

        }

        protected void PopulateUploads()
        {
            string[] Files = Directory.GetFiles(Server.MapPath("~/Attachments/" + subDir + "/"));
            DropDownListDocs.Items.Add(new ListItem("<< Select File >>", "<< Select File >>"));

            foreach (string Path in Files)
            {
                string[] _file = Path.Split('\\');
                string FileName = _file[_file.Length - 1];
                DropDownListDocs.Items.Add(new ListItem(FileName, FileName));
            }
        }

        protected void AttachmentError()
        {
            string attachError = "<div class='alert alert-dismissible alert-danger'>" +
                "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                "<h4><strong>Error!</strong> You must select a file.</h4>" +
                "</div>";

            LabelAttachError.Text = attachError;
        }
    }
}
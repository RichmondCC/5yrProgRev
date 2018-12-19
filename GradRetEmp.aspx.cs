using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rcc5yrProgRev
{
    public partial class GradRetEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set Year Labels
            LabelGradRetYr1.Text = Session["SessYr1"].ToString();
            LabelPassRateYr1.Text = Session["SessYr1"].ToString();
            LabelDegDipCertYr1.Text = Session["SessYr1"].ToString();
            LabelGradRetYr2.Text = Session["SessYr2"].ToString();
            LabelPassRateYr2.Text = Session["SessYr2"].ToString();
            LabelDegDipCertYr2.Text = Session["SessYr2"].ToString();
            LabelGradRetYr3.Text = Session["SessYr3"].ToString();
            LabelPassRateYr3.Text = Session["SessYr3"].ToString();
            LabelDegDipCertYr3.Text = Session["SessYr3"].ToString();
            LabelGradRetYr4.Text = Session["SessYr4"].ToString();
            LabelPassRateYr4.Text = Session["SessYr4"].ToString();
            LabelDegDipCertYr4.Text = Session["SessYr4"].ToString();
            LabelGradRetYr5.Text = Session["SessYr5"].ToString();
            LabelPassRateYr5.Text = Session["SessYr5"].ToString();
            LabelDegDipCertYr5.Text = Session["SessYr5"].ToString();
            //LabelEmployYears.Text = Session["SessYrEmploy"].ToString();

        }
    }
}
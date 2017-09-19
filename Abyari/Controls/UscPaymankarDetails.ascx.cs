using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Model;
namespace Abyari.Controls
{
    public partial class UscPaymankarDetails : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDetail();
            }
        }
        private void FillDetail()
        {
            Paymankar _p = new Paymankar();
            var detail = _p.GetPaymankarStatistics(new tkv.Utility.DateConversion().Firstofyear_jessus().ToShortDateString());
            if (detail != null)
            {
                lblAllowed.Text =(detail.Allowed ?? 0).ToString();
                lblContracted.Text = (detail.Contracted ?? 0).ToString();
                lblInvoice.Text = (detail.TotalInvoice  ).ToString();
                lblPayment.Text = (detail.TotalPayment ?? 0).ToString();
                lblReserved.Text = (detail.Reserved ?? 0).ToString();
                lblDue.Text = (detail.TotalInvoice - (detail.TotalPayment ?? 0)).ToString();
             }
        }
    }
}
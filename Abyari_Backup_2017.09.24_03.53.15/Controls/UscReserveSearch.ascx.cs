using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari.Controls
{
    public partial class UscReserveSearch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteTo.Date = dteFrom.Date = new tkv.Utility.DateConversion().converttomiladi("1394/01/01");
            }
        }
        public string GetSearchParameter
        {
            get
            {
                string param = string.Empty;
                if (chkexpired.Checked)
                {
                    DateTime stamp = DateTime.Now.Subtract(new TimeSpan(14, 0, 0, 0));
                    param += string.Format("  {0} < '{1}' and ContractedPaymankarID is null ", "CreateDate", stamp.ToShortDateString());

                    return param;
                }
                param += uscMahaleEjra.SearchCondition;
                param += UscSelectPaymankar.ReservedPaymankarCondition;
                if (dteFrom.Date.HasValue)
                {
                    param += string.Format(" and {0} >= '{1}'  ", "CreateDate", dteFrom.Date.Value.Date.ToShortDateString());
                }
                if (dteTo.Date.HasValue)
                {
                    param += string.Format(" and {0} <= '{1}'  ", "CreateDate", dteTo.Date.Value.Date.ToShortDateString());
                }
                switch (cmbStatus.SelectedValue)
                {
                  
                    case "wreserve":
                        param += string.Format(" and ReservedPaymankarID is not null and ContractedPaymankarID is null" );
                        break;

                    case "contract":
                        param += string.Format(" and ContractedPaymankarID is not null" );
                        break;
                }

                if (param.Contains("and"))
                    param = param.Remove(param.IndexOf("and"), 3);
                return param;
            }
        }

        protected void chkexpired_CheckedChanged(object sender, EventArgs e)
        {
            if (chkexpired.Checked)
                pnlEnable.Enabled = false;
            else
                pnlEnable.Enabled = true;
        }
    }
}
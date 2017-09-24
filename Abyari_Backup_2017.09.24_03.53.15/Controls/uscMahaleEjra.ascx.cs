using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tkv.Utility;
namespace Abyari.Controls
{
    public partial class uscMahaleEjra : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string SearchCondition
        {
            get
            {
                if (!string.IsNullOrEmpty(cmbShahrestan.SelectedValue))
                {
                    return string.Format(" and IDShahrestan= {0} ", cmbShahrestan.SelectedValue);
                }
                return string.Empty;
            }
        }
        public string IDShahrestan
        {
            get
            {
                return cmbShahrestan.SelectedValue;
            }
            set
            {
                    cmbShahrestan.SelectedValue = value;
            }
        }
        public List<Model.Shahrestan> GetData()
        {
            return new Model.Shahrestan().GetData();
        }
    }
}
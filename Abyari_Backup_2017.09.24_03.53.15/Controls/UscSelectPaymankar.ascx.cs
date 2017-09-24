using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Model;
namespace Abyari.Controls
{
    public partial class UscSelectPaymankar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string SearchCondition
        {
            get
            {
                if (!string.IsNullOrEmpty(cmbPyamankar.SelectedValue))
                {
                    return  string.Format(" and IDPaymankar={0}", cmbPyamankar.SelectedValue);
                }
                return string.Empty;
            }
        }
        public string ContractedPaymankarCondition
        {
            get
            {
                if (!string.IsNullOrEmpty(cmbPyamankar.SelectedValue))
                {
                    return string.Format(" and ContractedPaymankarID={0}", cmbPyamankar.SelectedValue);
                }
                return string.Empty;
            }
        }
        public string ReservedPaymankarCondition
        {
            get
            {
                if (!string.IsNullOrEmpty(cmbPyamankar.SelectedValue))
                {
                    return string.Format(" and ReservedPaymankarID={0}", cmbPyamankar.SelectedValue);
                }
                return string.Empty;
            }
        }
        public string IDPaymankar
        {
            get
            {
                return cmbPyamankar.SelectedValue;
            }
            set
            {
                cmbPyamankar.SelectedValue = value;
            }
        }
        public List<Paymankar> GetPaymankar()
        {
            return new Paymankar().SearchByConditions(string.Empty);
        }
    }
}
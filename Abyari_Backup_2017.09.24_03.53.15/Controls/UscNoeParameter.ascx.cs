using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Model;
namespace Abyari.Controls
{
    public partial class UscNoeParameter : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<NoeProje> GetData()
        {
            return new NoeProje().GetNoe();
        }
        public string NoeIDParameter
        {
            get;
            set;
        }
        public string Conditions
        {
            get
            {
                return GetConditions();
            }
        }
        public string GetConditions()
        {
            string con = string.Empty;
            if (!string.IsNullOrEmpty(comNoe.SelectedValue))
            {
                string id = string.IsNullOrEmpty(NoeIDParameter) == true ? "IDNoe" : NoeIDParameter;
                con = string.Format("{0}={1}", id, comNoe.SelectedValue);
            }
            return con;

        }
    }
}

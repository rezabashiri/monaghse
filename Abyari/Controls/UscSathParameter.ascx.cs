using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari.Controls
{
    public partial class UscSathParameter : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string SathNameParameter
        {
            set;
            get;
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

            string sathparam = string.IsNullOrEmpty(SathNameParameter) != true ? SathNameParameter : "Sath";
            string condition = string.Format ("{0} ",sathparam);
            switch (comComparar.SelectedValue)
            {
                case "":
                    return string.Empty;
                case "more":
                    condition += " >= ";
                    break;
                case "less":
                    condition += " <= ";
                    break;
                case "equal":
                    condition += " = ";
                    break;
            }
            condition = string.Format("{0} {1}", condition,string.IsNullOrEmpty( txtSath.Text) == true ? "0" : txtSath.Text);
            return condition;
        }
    }
}
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.DynamicData;
using tkv.Utility;
namespace Abyari.DynamicData.FieldTemplates
{
    public partial class UserSelect : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                return HyperLink1;
            }
        }
        protected string GetDisplayString()
        {
            object value = FieldValue;

            if (value == null)
            {
                return string.Empty;
            }
            else
            {
                var user =new AccessManagementService.Model.User();
                user = user.GetUserById(FieldValue.ToInt32(), null);
                return user != null ? user.FullName : string.Empty;
            }
        }

        protected string GetNavigateUrl()
        {

            return string.Format("/Users/ListDetails.aspx?ID={0}", FieldValueString);
        }
    }
}

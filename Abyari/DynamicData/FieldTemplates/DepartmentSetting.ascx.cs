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
namespace Modiriat_Gharardadha.DynamicData.FieldTemplates
{
    public partial class DepartmentSetting : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected override void OnDataBinding(EventArgs e)
        {
            
            base.OnDataBinding(e);
            var xml = FieldValueEditString;
            if (string.IsNullOrEmpty(xml))
                return;
            global::AccessManagementService.Access.Settings _set = new global::AccessManagementService.Access.Settings();
            _set = _set.DeSerialize(xml);
            if (_set != null)
            {
                chkLower.Checked = _set.Password.LowerLtter;
                chkNumer.Checked = _set.Password.Number;
                chkSign.Checked = _set.Password.Signs;
                chkUpper.Checked = _set.Password.UpperLetter;
                lblMin.Text = _set.Password.MinimumChar  ;
            }
        }
        public override Control DataControl
        {
            get
            {
                return chkLower;
            }
        }
    }
}

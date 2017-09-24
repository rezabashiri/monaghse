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

namespace Modiriat_Gharardadha.DynamicData.FieldTemplates
{
    public partial class DepartmentSetting_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.MaxLength = Column.MaxLength;
            if (Column.MaxLength < 20)
                TextBox1.Columns = Column.MaxLength;
            TextBox1.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(DynamicValidator1);
        }
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
                TextBox1.Text = _set.Password.MinimumChar.ToString();
            }
        }
        private string Serialize()
        {
            global::AccessManagementService.Access.Settings _set = new global::AccessManagementService.Access.Settings();

            _set.Password = new global::AccessManagementService.Access.Password();
            _set.Password.MinimumChar = TextBox1.Text;
            _set.Password.LowerLtter = chkLower.Checked;
            _set.Password.Number = chkNumer.Checked;
            _set.Password.Signs = chkSign.Checked;
            _set.Password.UpperLetter = chkUpper.Checked;
            return _set.Serialize();
        }
        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = Serialize();
        }

        public override Control DataControl
        {
            get
            {
                return TextBox1;
            }
        }
    }
}

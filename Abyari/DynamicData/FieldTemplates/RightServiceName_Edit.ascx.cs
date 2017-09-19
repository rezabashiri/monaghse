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
using System.ComponentModel;
using tkv.Utility;
namespace Modiriat_Gharardadha.DynamicData.FieldTemplates
{
    public partial class RightServiceName_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
      
            drpServiceName.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
         
        }
        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            drpServiceName.Items.Add(new Telerik.Web.UI.RadComboBoxItem { Text = "انتخاب کنید", Value = "" });

            foreach (var t in Enum.GetValues(typeof(global::AccessManagementService.Access.RightRelatedService)))
            {
                global::AccessManagementService.Access.RightRelatedService service = (global::AccessManagementService.Access.RightRelatedService)t;
                string des=service.GetAttributeOfType<DescriptionAttribute>().Description;
                drpServiceName.Items.Add(new Telerik.Web.UI.RadComboBoxItem  { Text=des,Value=des});
            }

        }
        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(drpServiceName.SelectedValue);
        }

        public override Control DataControl
        {
            get
            {
                return drpServiceName;
            }
        }
    }
}

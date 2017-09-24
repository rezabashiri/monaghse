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
using System.Xml.Linq;
namespace Modiriat_Gharardadha.DynamicData.FieldTemplates
{
    public partial class DepartmentChart : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                return trvChart;
            }
        }
        public override void DataBind()
        {
            if (this.FieldValue != null)
            {
                if (this.FieldValue.GetType() != typeof(System.DBNull))
                    trvChart.LoadXml((string)this.FieldValue);
            }
            base.DataBind();
        }
    }
}

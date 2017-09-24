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
    public partial class ExtraData : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                return Literal1;
            }
        }
        public string GetName(string value)
        {
            return Helpers.InvoiceHelpers.GetProjeName( Helpers.InvoiceHelpers.GetIdProje(value).ToInt32());
        }
    }
}

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
using System.Collections.Generic;
using tkv.Utility;
namespace Abyari.DynamicData.FieldTemplates
{
    public partial class InvoiceType : System.Web.DynamicData.FieldTemplateUserControl
    {
        
        protected override void OnLoad(EventArgs e)
        {
            //&& Session["_types"] == null
           
            base.OnLoad(e);
        }
        public override Control DataControl
        {
            get
            {
                return Markup;
            }
        }
        protected string GetDisplayString()
        {
            object value = FieldValue;
            
            if (value == null)
            {
                return FormatFieldValue(ForeignKeyColumn.GetForeignKeyString(Row));
            }
            else
            {
                return FormatFieldValue(ForeignKeyColumn.ParentTable.GetDisplayString(value));
            }
        }
    
        public string GetMarkup()
        {
            if (Session["_types"] == null)
            {
                Session["_types"] = new WebUtility.Model.InvoiceType().GetInvoiceTypes();
            }
            System.Collections.Generic.List<WebUtility.Model.InvoiceType> _types = Session["_types"] as List<WebUtility.Model.InvoiceType>;
            MetaColumn mc = Table.Columns.Where(x => x.Name == "ID").FirstOrDefault();
            var invoiceid = GetColumnValue(mc);
            if (!string.IsNullOrEmpty(GetDisplayString()))
            {
                int invoicetypeid = ForeignKeyColumn.GetForeignKeyString(Row).ToInt32();
                if (_types != null)
                {
                    var markup = _types.Where(x => x.ID == invoicetypeid).FirstOrDefault();
                    if (markup != null && !string.IsNullOrEmpty(markup.Markup))
                    {
                        return string.Format(markup.Markup, invoiceid);
                    }
                }
                return string.Empty;
            }
            return string.Empty;

           
        }
    }
}

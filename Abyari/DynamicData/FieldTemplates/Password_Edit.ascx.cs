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
using System.Data.Entity.Core.Objects;
namespace Modiriat_Gharardadha.DynamicData.FieldTemplates
{
    public partial class Password_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected ObjectContext ObjectContext { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.MaxLength = Column.MaxLength;
            if (Column.MaxLength < 20)
                TextBox1.Columns = Column.MaxLength;
            TextBox1.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(DynamicValidator1);
            SetUpValidator(CusValidator);
            Microsoft.AspNet.EntityDataSource.EntityDataSource ds = (Microsoft.AspNet.EntityDataSource.EntityDataSource)this.FindDataSourceControl();
            RegularExpressionValidator1.ValidationExpression = "";
            ds.ContextCreated += (_, ctxCreatedEventArg) => ObjectContext = ctxCreatedEventArg.Context;
            
            // This field template is used both for Editing and Inserting
            ds.Updating += ds_Updating;
            ds.Inserting += ds_Updating;
            var control = this.FindControl("GridView1");
        }
        void ds_Updating(object sender, Microsoft.AspNet.EntityDataSource.EntityDataSourceChangingEventArgs e)
        {
            
         
        }
    
    
        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
           tkv.Utility.HashHelpers hash = new tkv.Utility.HashHelpers();
           
            
            dictionary[Column.Name] = ConvertEditedValue(hash.Encrypt(TextBox1.Text));
        }

        public override Control DataControl
        {
            get
            {
                return TextBox1;
            }
        }

        protected void CusValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
       
    
            //args.IsValid = false;
            //Isvalid = false;//to make it possibloe in future
        }
    
    }
}

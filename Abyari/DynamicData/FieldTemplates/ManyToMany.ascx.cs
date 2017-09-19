using System;
using System.ComponentModel;
using System.Web.UI;
using Telerik.Web.UI;
using System.Web.DynamicData;
namespace DynamicWebApp
{
    public partial class ManyToManyField : System.Web.DynamicData.FieldTemplateUserControl
    {
        public int RePeatColumn
        {
            set;
            get;
        }
        protected void Page_Load(object sender, EventArgs e)
        {




        }
        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            object entity;
            ICustomTypeDescriptor rowDescriptor = Row as ICustomTypeDescriptor;
            if (rowDescriptor != null)
            {
                // Get the real entity from the wrapper
                entity = rowDescriptor.GetPropertyOwner(null);
            }
            else
            {
                entity = Row;
            }

            // Get the collection
            var entityCollection = Column.EntityTypeProperty.GetValue(entity, null);
            if (entityCollection != null)
            {
                //         cmbForignKeys.Items.Add(new RadComboBoxItem() { Text="برای مشاهده لیست کلید نمایید",Value=""});

            }
            cmbForignKeys.DataSource = entityCollection;
            if (ChildrenColumn != null)
            {
                cmbForignKeys.DataTextField = ChildrenColumn.ChildTable.DisplayColumn.Name;
            }
            cmbForignKeys.DataBind();
            cmbForignKeys.SelectedIndex = -1;
            //Repeater1.DataSource = entityCollection;
            //Repeater1.DataBind();
        }

        public override Control DataControl
        {
            get
            {
                return Repeater1;
            }
        }


    }
}
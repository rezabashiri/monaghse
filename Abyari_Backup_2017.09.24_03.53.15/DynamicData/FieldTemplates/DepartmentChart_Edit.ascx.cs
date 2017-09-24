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
using Telerik.Web.UI;
using tkv.Utility;
namespace Modiriat_Gharardadha.DynamicData.FieldTemplates
{
    public partial class DepartmentChart_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        MetaTable table;
        protected void Page_Init(object sender, EventArgs e)
        {
            table = DynamicDataRouteHandler.GetRequestMetaTable(Context);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            trvChart.ToolTip = Column.Description;

        }
        public IQueryable<global::AccessManagementService.Model.OrganiztionRole> FillOrganizationRoles()
        {
            MetaColumn mc = Table.Columns.Where(x => x.Name == "ID").FirstOrDefault();
            int id = GetColumnValue(mc).ToInt32();
            if (id != int.MinValue)
            {
                
                return global::AccessManagementService.Model. OrganiztionRole.GetOrganizationRoles();
            }
            return global::AccessManagementService.Model.OrganiztionRole.GetOrganizationRoles();  //inser mode , id not exist
        }
        public override void DataBind()
        {
            if (this.FieldValue != null)
            {   
                if (this.FieldValue.GetType() != typeof( System.DBNull))
                trvChart.LoadXml((string)this.FieldValue);
            }
            base.DataBind();
        }
        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(trvChart.GetXml());
        }

        public override Control DataControl
        {
            get
            {
                return trvChart;
            }
        }
        protected void btnAddNode_Click(object sender, EventArgs e)
        {

            global::AccessManagementService.Model.OrganiztionRole org = new global::AccessManagementService.Model.OrganiztionRole();
            IRadTreeNodeContainer target = trvChart;
            int? ParrentOrganizationRoleId = -1;
               int OrganizationRoleId;

            if (string.IsNullOrEmpty(cmbOrganizationRoles.SelectedValue))
            {
                //  Helpers.ContextHelpers.ShowMessage(this.Page, "یک نقش سازمانی انتخاب نمایید");
                return;
            }
            OrganizationRoleId = cmbOrganizationRoles.SelectedValue.ToInt32();
            if (trvChart.SelectedNode != null)
            {
                trvChart.SelectedNode.Expanded = true;
                target = trvChart.SelectedNode;
                ParrentOrganizationRoleId = trvChart.SelectedNode.Attributes["OrganizationRoleId"].ToInt32();
            }
            else
            {
                ParrentOrganizationRoleId = null;   //very important to set first node's parrent id to null
            }

              // org.SetParrentId( OrganizationRoleId,ParrentOrganizationRoleId);   no more need because all deparment mabe use this org 
         
                RadTreeNode addedNode = new RadTreeNode(cmbOrganizationRoles.SelectedText);
                addedNode.ToolTip = string.Format("شماره نقش{0}", cmbOrganizationRoles.SelectedValue);
                addedNode.Attributes.Add("OrganizationRoleId", cmbOrganizationRoles.SelectedValue);
                addedNode.Selected = true;
                target.Nodes.Add(addedNode);
             
            //cmbOrganizationRoles.DataBind();
        }

        protected void RadTreeView1_NodeClick(object sender, RadTreeNodeEventArgs e)
        {
            RadTreeNode clickednode = e.Node;
            if (clickednode != null)
            {
                string OrganizationRoleId = string.Empty;
                OrganizationRoleId = clickednode.Attributes["OrganizationRoleId"];
                cmbOrganizationRoles.SelectedValue = OrganizationRoleId;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (trvChart.SelectedNode != null)
            {
                global::AccessManagementService.Model.OrganiztionRole org = new global::AccessManagementService.Model.OrganiztionRole();
                int OrganizationRoleId = trvChart.SelectedNode.Attributes["OrganizationRoleId"].ToInt32();
             //   org.SetParrentId(OrganizationRoleId, null); no need any more organizationRole Logis has been changed
                    trvChart.SelectedNode.Remove();
              
            }
        }
    }
}

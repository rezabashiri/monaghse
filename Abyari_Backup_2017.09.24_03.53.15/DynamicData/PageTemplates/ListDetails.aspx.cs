using System;
using System.Data;
using System.Configuration;
using System.Collections;
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
using System.Web.DynamicData.ModelProviders;
using System.Text;
using Telerik.Web.UI.DynamicData;
using Abyari.Helpers;
using System.IO;
namespace Abyari.DynamicData.PageTemplates
{
    public partial class ListDetails : System.Web.UI.Page
    {
        
        protected void Page_Init(object sender, EventArgs e)
        {
            DynamicDataManager1.RegisterControl(GridView1, true /*setSelectionFromUrl*/);
       

        }
        protected void Label_PreRender(object sender, EventArgs e)
        {
            Label label = (Label)sender;
            DynamicFilter dynamicFilter = (DynamicFilter)label.FindControl("DynamicFilter");

            QueryableFilterUserControl fuc = dynamicFilter.FilterTemplate as QueryableFilterUserControl;
            if (fuc != null && fuc.FilterControl != null)
            {
                label.AssociatedControlID = fuc.FilterControl.GetUniqueIDRelativeTo(label);
            }
        }
        protected void DynamicFilter_FilterChanged(object sender, EventArgs e)
        {
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            MetaTable table = GridDataSource.GetTable();
            Title = table.DisplayName;
            GridDataSource.Include = table.ForeignKeyColumnsNames;
            GridDataSource.AutoGenerateWhereClause = false;
            // Disable various options if the table is readonly
            GridView1.ItemCommand += new GridCommandEventHandler(GridView1_ItemCommand);
 
        }
        void GridView1_ItemCommand(object source, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.ExpandCollapseCommandName)
            {
                Telerik.Web.UI.GridDataItem _griddataitem = e.Item as Telerik.Web.UI.GridDataItem;
                if (_griddataitem != null)
                {
                    RadGrid detailedGrid =  _griddataitem.ChildItem.FindControl("DetailGridView") as RadGrid;
                    detailedGrid.Rebind();

                }
            }
        }


        protected void GridDetailDataSource_ItemCommand(object source, GridCommandEventArgs e)
        {

        }

        protected void GridDetailDataSource_Selecting(object sender, Microsoft.AspNet.EntityDataSource.EntityDataSourceSelectingEventArgs e)
        {
            
            GridDataItem parentItem = ((GridNestedViewItem)e.DataSource.NamingContainer).ParentItem;
            int hierarchyIndex = parentItem != null ? parentItem.ItemIndex : -1;

            if (hierarchyIndex == -1)
            {
                e.Cancel = true;
                return;
            }

            MetaTable masterMetaTable = GridDataSource.GetTable();
            MetaTable detailMetaTable = e.DataSource.GetTable();

            StringBuilder sb = new StringBuilder();
            sb.Append(Helpers.PersianSearchDataSourceHelpers.GetValidUniCodeQuery(e.DataSource.Where));
            if (masterMetaTable.ForeignKeyColumnsNames != string.Empty)
            {
                //Many to One relation
                foreach (MetaColumn column in detailMetaTable.PrimaryKeyColumns)
                {
                    foreach (string name in masterMetaTable.ForeignKeyColumnsNames.Split(','))
                    {
                     
                        string columnName = ((MetaForeignKeyColumn)masterMetaTable.GetColumn(name)).ForeignKeyNames.Where(n => n == name + "." + column.Name).FirstOrDefault();
                        GridTableView ownerTableView = ((GridNestedViewItem)e.DataSource.NamingContainer).OwnerTableView;
                        if (!ownerTableView.DataKeyNames.Contains(columnName))
                            continue;
                        if (sb.Length > 0)
                            sb.Append(" AND ");
                        sb.AppendFormat("it.{0} = '{1}'", column.Name, ownerTableView.DataKeyValues[hierarchyIndex][columnName]);
                        //break;
                    }
                }
            }
            //else
            //{
                //One to Many relation
                foreach (MetaColumn col in detailMetaTable.Columns)
                {
                    if (col is MetaForeignKeyColumn)
                    {
                        MetaForeignKeyColumn column = (MetaForeignKeyColumn)col;
                        if (column.ParentTable.Name == masterMetaTable.Name)
                        {
                            int primarykeyindex = 0; // in relations witch has mor than one foreign key column
                            foreach (string name in column.ForeignKeyNames)   //maybe 
                            {
                           
                                GridTableView ownerTableView = ((GridNestedViewItem)e.DataSource.NamingContainer).OwnerTableView;
                                string columnName = name;//.Split('.')[1];
                                //if (!ownerTableView.DataKeyNames.Contains(columnName))    //maybe spel of foreignkey in child table does not equla to primary key in parrent table
                                //    continue;
                                switch (masterMetaTable.PrimaryKeyColumns[primarykeyindex].ColumnType.Name)
                                {
                                    case "Int16":
                                    case "Int32":
                                    case "Int64":
                                        if (sb.Length > 0)
                                            sb.Append(" AND ");
                                        sb.AppendFormat("it.{0} = {1}", name, ownerTableView.DataKeyValues[hierarchyIndex][masterMetaTable.PrimaryKeyColumns[primarykeyindex].Name]);  //its depond on our chance witch is the orders of foeign key and parimary in master table should be equal
                                        break;
                                    default:
                                        if (sb.Length > 0)
                                            sb.Append(" AND ");
                                        sb.AppendFormat("it.{0} = '{1}'", name, ownerTableView.DataKeyValues[hierarchyIndex][masterMetaTable.PrimaryKeyColumns[primarykeyindex].Name]);  //its depond on our chance witch is the orders of foeign key and parimary in master table should be equal
                                        break;
                                }
                                primarykeyindex++;
                                //break;                            
                            }

                            break;
                        }
                    }
                }
            //}

            e.DataSource.Where = sb.ToString();
        }
        protected void DetailGridView_Init(object sender, EventArgs e)
        {
         //   string detailTableName = DynamicDataRouteHandler.GetRequestContext(this.Context).RouteData.Values["details"].ToString();
            MetaTable table = DynamicDataRouteHandler.GetRequestMetaTable(Context);
     //       var parents = detailTable.Columns.OfType<MetaForeignKeyColumn>().Select(s => s.ParentTable).Distinct();
       //     var children = detailTable.Columns.OfType<MetaChildrenColumn>().Select(s => s.ChildTable).Distinct();
         //   var detailschildren = children.Where(x => x.Attributes[typeof(Modiriat_Gharardadha.Helpers.DetailTableName)] != null); //get child from custom attributes
            Helpers.DetailTableName tblName = table.Attributes[typeof(Helpers.DetailTableName)] as Helpers.DetailTableName;
            
            MetaModel model = ((DynamicDataRouteHandler)(DynamicDataRouteHandler.GetRequestContext(this.Context).RouteData.RouteHandler)).Model;
            Microsoft.AspNet.EntityDataSource.EntityDataSource GridDetailDataSource = (Microsoft.AspNet.EntityDataSource.EntityDataSource)((sender as RadGrid).NamingContainer).FindControl("GridDetailDataSource");
            GridDetailDataSource.ContextTypeName = table.DataContextType.ToString();
            if (tblName != null)
            {

                GridDetailDataSource.EntitySetName = tblName.TabeName;
            }
            else
            {
                ((RadGrid)sender).DataSourceID = string.Empty;

 
            }
           
        }

        protected void OnGridViewDataBound(object sender, EventArgs e)
        {

        }
    

        protected void OnGridViewRowCreated(object sender, GridViewRowEventArgs e)
        {
            SetDeleteConfirmation(e.Row);
        }


        protected void OnDetailsViewItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void OnDetailsViewItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void OnDetailsViewItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void OnDetailsViewModeChanging(object sender, DetailsViewModeEventArgs e)
        {

        }

  

        private void SetDeleteConfirmation(TableRow row)
        {
            foreach (Control c in row.Cells[0].Controls)
            {
                if (c is LinkButton)
                {
                    LinkButton btn = (LinkButton)c;
                    if (btn.CommandName == DataControlCommands.DeleteCommandName)
                    {
                        btn.OnClientClick = "return confirm('Are you sure you want to delete this item?');";
                    }
                }
            }
        }


        protected void GridDataSource_Selecting(object sender, Microsoft.AspNet.EntityDataSource.EntityDataSourceSelectingEventArgs e)
        {
            e.DataSource.Where = Helpers.PersianSearchDataSourceHelpers.GetValidUniCodeQuery(e.DataSource.Where);
        }

   

        protected void GridDataSource_Inserted(object sender, Microsoft.AspNet.EntityDataSource.EntityDataSourceChangedEventArgs e)
        {
            Int64 ExternalExcetion = Helpers.ExceptionHelper.HandelException(this.Page, e.Exception);
            switch (ExternalExcetion)
            {
                case 1:
                   
                    e.ExceptionHandled = true;
                    break;
         
            }
        }

        protected void GridView1_GridExporting(object sender, GridExportingArgs e)
        {

        }

        protected void GridView1_ExcelExportCellFormatting(object sender, ExcelExportCellFormattingEventArgs e)
        {
            var c = e.Cell;
        }

        protected void btnExportExcel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                GridView1.DataBind();

                GridView1.MasterTableView.HeaderStyle.BackColor =System.Drawing. Color.White;
                //foreach (TableCell cell in GridView1.master.Cells)
                //{
                //    cell.BackColor = GridView1.HeaderStyle.BackColor;
                //}
                //foreach (GridViewRow row in GridView1.MasterTableView.Items)
                //{
                //    row.BackColor = Color.White;
                //    foreach (TableCell cell in row.Cells)
                //    {
                //        if (row.RowIndex % 2 == 0)
                //        {
                //            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                //        }
                //        else
                //        {
                //            cell.BackColor = GridView1.RowStyle.BackColor;
                //        }
                //        cell.CssClass = "textmode";
                //    }
                //}
                hw.Write("<form runat='server' >");
                GridView1.MasterTableView.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
         
                Response.Output.Write(sw.ToString());
                Response.Write("</form>");
                Response.Flush();
                Response.End();
            }
        }
    }
}
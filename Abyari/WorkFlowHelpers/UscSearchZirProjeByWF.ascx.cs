using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using WorkFlow.Logic;
using System.Web.DynamicData;
namespace Abyari.WorkFlowHelpers
{
    public partial class UscSearchZirProjeByWF : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetPrimaryKeys();
            SetGroupByExpression();
            _engine = new WorkFlowEngineHelpers();
        }
        public bool View
        {
            get;
            set;
        }

        public bool Insert
        {
            get;
            set;
        }

        public bool Edit
        {
            get;
            set;
        }

        public bool Delete
        {
            get;
            set;
        }

        public bool Print
        {
            get;
            set;
        }


        public bool Attach
        {
            get;
            set;
        }

        public bool WorkFlow
        {
            get;
            set;
        }
        public string GroupByExpressionField
        {
            set;
            get;
        }
        public int? ExecutingID
        {
            get;
            set;
        }
        public string LastStep
        {
            get;
            set;
        }
 
        private void SetPrimaryKeys()
        {
            grdZirProjeData.MasterTableView.DataKeyNames = new string[3] { "Code", "IDPaymankar", "ID" };
        }
        private void SetGroupByExpression()
        {
            if (!string.IsNullOrEmpty(GroupByExpressionField))
            {
                GridGroupByExpression expression = new GridGroupByExpression();
                GridGroupByField gridGroupByField;
                string[] split = GroupByExpressionField.Split(',');
                foreach (string sp in split)
                {
                    gridGroupByField = new GridGroupByField();
                    gridGroupByField.FieldName = sp;

                    expression.SelectFields.Add(gridGroupByField);
                    gridGroupByField = new GridGroupByField();
                    gridGroupByField.FieldName = sp;
                    expression.GroupByFields.Add(gridGroupByField);
                }

                grdZirProjeData.MasterTableView.GroupByExpressions.Add(expression); ;
            }
        }
        WorkFlowEngineHelpers _engine;
        string WhereParams;
        public int EntityTypeID
        {
            get;
            set;
        }
        public void DoSearch(string WhereParameter)
        {
            WhereParams = WhereParameter;
            var data = _engine.SearchOnZirProje(WhereParameter, EntityTypeID);
            ViewState["datasource"] = data;
            grdZirProjeData.DataSource = data;       
            grdZirProjeData.DataBind();
        }
        protected void grdZirProjeData_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            
            _engine = new WorkFlowEngineHelpers();
            HiddenField hd = e.Item.FindControl("hdColumn") as HiddenField;
            HiddenField exeID = e.Item.FindControl("hdExecuting") as HiddenField;
            
       
        }
        protected void grdZirProjeData_DataBound(object sender, EventArgs e)
        {
            _engine = new WorkFlowEngineHelpers();
            if (ViewState["datasource"] == null)
                return;
            var access = ViewState["datasource"] as List< Model.sp_ListOFPaymankarsProject_Result> ;

            int counter = 0;
            foreach (Telerik.Web.UI.GridDataItem item in grdZirProjeData.Items)
            {
              //  Model.sp_ListOFPaymankarsProject_Result _search = access[counter];// access[counter] as Model.sp_ListOFPaymankarsProject_Result;
                global::WorkFlow.InterFaces.ISearchTable _search = access[counter];
                
            
                if (item.FindControl("hdColumn") != null)
                {

                    ((HiddenField)item.FindControl("hdColumn")).Value = Server.HtmlEncode(_search.StepAccess);
                    ((HiddenField)item.FindControl("hdExecuting")).Value = _search.WfExecutingID.ToString();
                    if (!string.IsNullOrEmpty(_search.StepAccess))
                    {
                        if (!_engine.CheckAccess(_search.StepEntity, global::AccessManagementService.Access.RightRelatedService.View))
                        {
                            item.Controls.RemoveAt(2);
                            item.Controls.AddAt(2,new GridTableCell() { Text="اتمام مهلت" });
                            
                        }
                        
                        
                        ((Label)item.FindControl("lblStepName")).Text = _search.StepEntity.Name;
                    }
                    else
                    {
                        ((ImageButton)item.FindControl("btnSelect")).Visible = false;
                        ((ImageButton)item.FindControl("btnGO")).Visible = true;  //if user doesnt create wf
                    }
                }
                counter++;

            }

        }
    }
}
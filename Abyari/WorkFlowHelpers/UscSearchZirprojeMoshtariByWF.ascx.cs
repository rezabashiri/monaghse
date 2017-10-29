using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Abyari.WorkFlowHelpers
{
    public partial class UscSearchZirprojeMoshtariByWF : System.Web.UI.UserControl,WorkFlow.InterFaces.IWorkFlowAccess
    {
        public bool Attach
        {
            get;
            set;
        }

        public bool Delete
        {
            get;
            set;
        }

        public bool Edit
        {
            get;
            set;
        }

        public int? ExecutingID
        {
            get;
            set;
        }

        public bool Insert
        {
            get;
            set;
        }

        public string LastStep
        {
            get;
            set;
        }

        public bool Print
        {
            get;
            set;
        }

        public bool View
        {
            get;
            set;
        }

        public bool WorkFlow
        {
            get;
            set;
        }
        public int EntityTypeID
        {
            get;
            set;
        }
        WorkFlowEngineHelpers _engine;
        string WhereParams;
        protected void Page_Load(object sender, EventArgs e)
        {
            SetPrimaryKeys();

        }

        public void DoSearch(string WhereParameter)
        {
            _engine = new WorkFlowEngineHelpers();

            WhereParams = WhereParameter;
            var data = _engine.SearchOnZirProjeMoshtari(WhereParameter, EntityTypeID);
            ViewState["datasource"] = data;
            grdProjecsSelect.DataSource = data;
            grdProjecsSelect.DataBind();
        }
        private void SetPrimaryKeys()
        {
            grdProjecsSelect.MasterTableView.DataKeyNames = new string[3] { "Code", "IDPaymankar", "ID" };
        }
        protected void grdProjecsSelect_DataBound(object sender, EventArgs e)
        {
            _engine = new WorkFlowEngineHelpers();
            if (ViewState["datasource"] == null)
                return;
            var access = ViewState["datasource"] as List<Model.ViewZirProjeMoshtary>;

            int counter = 0;
            foreach (Telerik.Web.UI.GridDataItem item in grdProjecsSelect.Items)
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
                            item.Controls.AddAt(2, new GridTableCell() { Text = "اتمام مهلت" });

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
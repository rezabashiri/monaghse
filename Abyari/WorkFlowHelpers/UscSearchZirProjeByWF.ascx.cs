using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using WorkFlow.Logic;
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
            grdZirProjeData.DataSource = data;       
            grdZirProjeData.DataBind();
        }
    }
}
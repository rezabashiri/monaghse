using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;
using Telerik.Web.UI;
using System.Data;

namespace Abyari.Monaghese
{
    public partial class getData : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            ImportFromExcel_projectProperties.OnImportDataCompelete += ImportFromExcel_projectProperties_OnImportDataCompelete;
            ImportFromExcel_ProjectGeneral.OnImportDataCompelete += ImportFromExcel_ProjectGeneral_OnImportDataCompelete;
            ImportFromExcel_ProjectOne.OnImportDataCompelete += ImportFromExcel_ProjectOne_OnImportDataCompelete;
            RadWizard3.NextButtonClick += RadWizard3_NextButtonClick;
            RadWizard3.NavigationBarButtonClick += RadWizard3_NavigationBarButtonClick;
            //uscFileUplaod.AttachId
        }

        private void ImportFromExcel_ProjectOne_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            var projes = new Model.ZirProje();
            DataColumn Col = _ds.Tables[0].Columns.Add("ProjectID", typeof(System.String));
            Col.SetOrdinal(0);

            foreach (DataRow row in _ds.Tables[0].Rows)
            {
                row["ProjectID"] = selectedProjectID.Value;
            }
            //_ds.Tables[0].Rows[0]["ProjectID"] = selectedProjectID.Value;

            var msg = projes.ImportFromExcelProject(_ds);



        }

        private void ImportFromExcel_ProjectGeneral_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            var projes = new Model.ZirProje();
            var msg = projes.ImportFromExcelProject(_ds);
        }

        private void ImportFromExcel_projectProperties_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            grdShowProjecs.DataSource = _ds.Tables[0];
            grdShowProjecs.DataBind();

            var projes = new Model.ZirProje();
            var msg = projes.ImportFromExcel(_ds, uscRoleSelect.RoleId, uscRoleSelect.UserId);

            ViewState["IsNextStep"] = true;
            //WebUtility.Helpers.RegisterHelpers.RegisterScript(this, "importExcel", "alert('salam')", true);
        }

        private void RadWizard3_NavigationBarButtonClick(object sender, Telerik.Web.UI.WizardEventArgs e)
        {
            RadWizard3.ActiveStepIndex = e.CurrentStepIndex;
        }

        private void RadWizard3_NextButtonClick(object sender, Telerik.Web.UI.WizardEventArgs e)
        {
            bool isNextstep = ViewState["IsNextStep"] != null ? (bool)ViewState["IsNextStep"] : false;
            string projectCodes = ViewState["projectCode"] != null ? ViewState["projectCode"].ToString() : string.Empty;


            var projes = new Model.ZirProje();


            if (isNextstep == true)
            {
                RadWizard3.ActiveStepIndex = e.CurrentStepIndex + 1;
                grdProjecsSelect.DataSource = projes.SearchZirProjeByConditions(projectCodes);
                grdProjecsSelect.DataBind();
            }
            else
                RadWizard3.ActiveStepIndex = e.CurrentStepIndex;
        }

        protected void grdShowProjecs_DataBound(object sender, EventArgs e)
        {

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            string id;

            foreach (GridDataItem item in (sender as Telerik.Web.UI.RadGrid).Items)
            {
                id = item.Cells[4].Text;
                sb.Append(" Code = ");
                sb.Append(id);
                sb.Append(" OR ");
            }

            string temp = sb.ToString();

            temp = temp.Remove(temp.Length - 3);


            ViewState["projectCode"] = temp;
        }
    }
}
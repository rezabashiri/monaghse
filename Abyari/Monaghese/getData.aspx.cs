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
            ImportFromExcel_LolehGeneral.OnImportDataCompelete += ImportFromExcel_LolehGeneral_OnImportDataCompelete;
            RadWizard3.NextButtonClick += RadWizard3_NextButtonClick;
            RadWizard3.NavigationBarButtonClick += RadWizard3_NavigationBarButtonClick;
            //uscFileUplaod.AttachId
        }

        private void ImportFromExcel_LolehGeneral_OnImportDataCompelete(DataSet _ds)
        {
            var looleha = new Model.ZirProjeLoole();
            looleha.ImportFromExcelLoloehProject(_ds);
            ViewState["IsNextStep"] = true;

        }

        private void ImportFromExcel_ProjectGeneral_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            var projes = new Model.ZirProje();
            var msg = projes.ImportFromExcelProject(_ds);
            ViewState["IsNextStep"] = true;
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
                if (e.CurrentStepIndex == 2)
                {
                    UscGridWtihAttachment.DataBound(projectCodes);
                }

                RadWizard3.ActiveStepIndex = e.CurrentStepIndex + 1;
                ViewState["IsNextStep"] = false;
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
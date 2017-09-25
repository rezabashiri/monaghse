using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;

namespace Abyari.Monaghese
{
    public partial class getData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ImportFromExcel.OnImportDataCompelete += ImportFromExcel_OnImportDataCompelete;
            //btnGoToNextSteps.Enabled = false;
            RadWizard3.NextButtonClick += RadWizard3_NextButtonClick;
            RadWizard3.NavigationBarButtonClick += RadWizard3_NavigationBarButtonClick;
            RadAjaxManager1.AjaxSettingCreating += RadAjaxManager1_AjaxSettingCreating;
        }

        private void RadAjaxManager1_AjaxSettingCreating(object sender, Telerik.Web.UI.AjaxSettingCreatingEventArgs e)
        {
            if (e.Updated != grdShowProjecs) {
                e.UpdatePanel.RenderMode = UpdatePanelRenderMode.Inline;
            }
        }

        private void RadWizard3_NavigationBarButtonClick(object sender, Telerik.Web.UI.WizardEventArgs e)
        {
            RadWizard3.ActiveStepIndex = e.CurrentStepIndex;
        }

        private void RadWizard3_NextButtonClick(object sender, Telerik.Web.UI.WizardEventArgs e)
        {
            bool isNextstep = ViewState["IsNextStep"] != null ? (bool)ViewState["IsNextStep"] : false;

            if (isNextstep == true)
                RadWizard3.ActiveStepIndex = e.CurrentStepIndex + 1;
            else
                RadWizard3.ActiveStepIndex = e.CurrentStepIndex;
        }

        void ImportFromExcel_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            grdShowProjecs.DataSource = _ds.Tables[0];
            grdShowProjecs.DataBind();

            var projes = new Model.ZirProje();
            var msg = projes.ImportFromExcel(_ds, uscRoleSelect.RoleId, uscRoleSelect.UserId);

            ViewState["IsNextStep"] = true;
            //WebUtility.Helpers.RegisterHelpers.RegisterScript(this, "importExcel", "alert('salam')", true);
        }


        protected void NewRegistrationButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultCS.aspx");

        }



        //void readFromExcel(System.Data.DataSet _ds)
        //{
        //    for (int i = 0; i < _ds.Tables[0].Rows.Count; i++)
        //    {

        //    }
        //}

        //protected void hdfield_Init(object sender, EventArgs e)
        //{
        //    grdShowProject.SetMetaTable(AppStart.DynamicDataConfig.GetMetaTable("Import"));
        //}
    }
}
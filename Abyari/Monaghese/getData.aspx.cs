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
            var msg = looleha.ImportFromExcelLoloehProject(_ds);

            ViewState["IsNextStep"] = true;
            ViewState["loolehaCount"] = msg;
        }

        private void ImportFromExcel_ProjectGeneral_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            var projes = new Model.ZirProje();
            var msg = projes.ImportFromExcelProject(_ds);
            ViewState["IsNextStep"] = true;
            ViewState["fehrestbahaCount"] = msg;
        }

        private void ImportFromExcel_projectProperties_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            grdShowProjecs.DataSource = _ds.Tables[0];
            grdShowProjecs.DataBind();
            //ViewState["__projectProperties"];

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

                    string fehrestbahaCount = ViewState["fehrestbahaCount"] != null ? ViewState["fehrestbahaCount"].ToString() : string.Empty;
                    string loolehaCount = ViewState["loolehaCount"] != null ? ViewState["loolehaCount"].ToString() : string.Empty;

                    Dictionary<string, string> phonesName = new Dictionary<string, string>();
                    phonesName = UscGridWtihAttachment.DataBound(projectCodes);

                    if (new tkv.Utility.WebConfigurationHelper().GetAppSettingValue("SendSMS") == "yes")
                    {
                        Helpers.SMSHelpers sms = new Helpers.SMSHelpers();
                        sms.SendSMS(phonesName);
                    }

                    // for show report

                    lblProjectCount.Text = phonesName.Count.ToString();
                    lblfehrestbahaCount.Text = fehrestbahaCount;
                    lblLoolehaCount.Text = loolehaCount;
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

            //int rowCount = (sender as Telerik.Web.UI.RadGrid).Items.Count;
            //string[] mobiles = new string[rowCount]; 
            //int i = 0;

            //Dictionary<string, string> MobileName = new Dictionary<string, string>();
            //string mobile;
            //string fullName;

            foreach (GridDataItem item in (sender as Telerik.Web.UI.RadGrid).Items)
            {
                id = item.Cells[4].Text;
                sb.Append(" Code = ");
                sb.Append(id);
                sb.Append(" OR ");

                //mobiles[i++] = item.Cells[13].Text;
                //mobile = item.Cells[13].Text;
                //fullName = item.Cells[2].Text;

                //MobileName.Add(mobile, fullName);
            }

            string temp = sb.ToString();

            temp = temp.Remove(temp.Length - 3);

            ViewState["projectCode"] = temp;
        }
    }
}
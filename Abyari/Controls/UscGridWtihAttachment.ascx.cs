using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari.Controls
{
    public partial class UscGridWtihAttachment : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ImportFromExcel_ProjectOne.OnImportDataCompelete += ImportFromExcel_ProjectOne_OnImportDataCompelete;
            ImportFromExcel_lolehProjectOne.OnImportDataCompelete += ImportFromExcel_lolehProjectOne_OnImportDataCompelete;
        }

        private void ImportFromExcel_lolehProjectOne_OnImportDataCompelete(DataSet _ds)
        {
            var looleha = new Model.ZirProjeLoole();
            DataColumn Col = _ds.Tables[0].Columns.Add("ProjectID", typeof(System.String));
            Col.SetOrdinal(0);

            foreach (DataRow row in _ds.Tables[0].Rows)
            {
                row["ProjectID"] = selectedProjectID.Value;
            }
            //_ds.Tables[0].Rows[0]["ProjectID"] = selectedProjectID.Value;

            var msg = looleha.ImportFromExcelLoloehProject(_ds);
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

        public void DataBound(string projectCodes)
        {
            var projes = new Model.ZirProje();
            var role = AccessManagementService.Access.AccessControl.LoggedInUser.Roles.FirstOrDefault();

            if (role!=null)
            {
                uscFileUplaod.RoleId = role.ID;
            }
            uscFileUplaod.UserId = AccessManagementService.Access.AccessControl.LoggedInUser.ID;

            grdProjecsSelect.DataSource = projes.SearchZirProjeByConditions(projectCodes);
            grdProjecsSelect.DataBind();
        }
    }
}
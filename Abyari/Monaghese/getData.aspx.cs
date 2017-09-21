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
        }

        void ImportFromExcel_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            grdProjecs.DataSource = _ds.Tables[0];
            grdProjecs.DataBind();


            //WebUtility.Helpers.RegisterHelpers.RegisterScript(btnGoToNextSteps, "go", "$('#btnGoToNextSteps').prop('disabled', false);)", true);
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
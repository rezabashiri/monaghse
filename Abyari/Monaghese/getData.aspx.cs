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
            btnSave.Enabled = false;
            //btnGoToNextSteps.Enabled = false;
        }

        void ImportFromExcel_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            grdProjecs.DataSource = _ds.Tables[0];
            grdProjecs.DataBind();

            btnSave.Enabled = true;
            //WebUtility.Helpers.RegisterHelpers.RegisterScript(this, "importExcel", "alert('salam')", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //btnGoToNextSteps.Enabled = true;
            //WebUtility.Helpers.RegisterHelpers.RegisterScript(btnSave, "goNext", "alert('dsd');", true);
        }

        //protected void btnGoToNextSteps_Click(object sender, EventArgs e)
        //{
        //    WebUtility.Helpers.RegisterHelpers.RegisterScript(btnGoToNextSteps, "goNext", "GoToNextStep();", true);

        //}

        //protected void btnPrevToSlide1_Click(object sender, EventArgs e)
        //{
        //    WebUtility.Helpers.RegisterHelpers.RegisterScript(btnPrevToSlide1, "goPrev", "GoToPrevStep();", true);

        //}

        protected void btnFinish_Click(object sender, EventArgs e)
        {

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
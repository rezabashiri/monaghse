using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;
using Abyari.Model;
 
using System.ComponentModel;
using Telerik.Web.UI;
using tkv.Utility;
namespace Abyari.Controls
{
    public partial class UscAbyari : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ImportFromExcel.OnImportDataCompelete += ImportFromExcel_OnImportDataCompelete;
        }

        void ImportFromExcel_OnImportDataCompelete(System.Data.DataSet _ds)
        {
            var projes = new Model.ZirProje();
            var msg=projes.ImportFromExcel(_ds,uscRoleSelect.RoleId,uscRoleSelect.UserId);
            ImportFromExcel.Message = msg;
        }
        protected void Page_Init(object sender, EventArgs e)
        {
           
        }
    
        public List<Sherkat> Get_Tarah()
        {
            Sherkat _sherkat = new Sherkat();
            return _sherkat.GetAllSherkats(null);
        }
        protected void AbyariEntityDataSource_Init(object sender, EventArgs e)
        {

            MetaTable mt = AppStart.DynamicDataConfig.GetMetaTable("ZirProjes");
            AbyariEntityDataSource.EntitySetName = mt.Name;
            //grdAbyari.SetMetaTable(mt);
           
        }
        private void CombBoxBind()
        {

            RadComboBox cmb = frmAbyari.FindControl("cmbNoe") as RadComboBox;
            if (cmb == null)
                return;
            foreach (var type in Enum.GetValues(typeof(Enums.AbyariTypes)))
            {
                Enums.AbyariTypes t = (Enums.AbyariTypes)type;
                cmb.Items.Add(new RadComboBoxItem() { Text = t.GetAttributeOfType<DescriptionAttribute>().Description, Value = t.ToString() });
            }
        }
        protected void grdAbyari_PreRender(object sender, EventArgs e)
        {
            if (ViewState["SelectetValue"] != null)
            {

                //foreach (GridItem item in grdAbyari.MasterTableView.Items)
                //{
                //    if (item is GridDataItem)
                //    {
                //        GridDataItem dataItem = (GridDataItem)item;
                //        if (dataItem.OwnerTableView.DataKeyValues[dataItem.ItemIndex]["ID"].ToString() == ViewState["SelectetValue"].ToString())
                //        {
                //            dataItem.Selected = true;
                //            break;
                //        }
                //    }
                //}
            }
        }
        protected void grdAbyari_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridDataItem gr = e.Item as GridDataItem;
            if (gr == null)
                return;
            int Id = gr.GetDataKeyValue("ID").ToInt32();
            ViewState["SelectetValue"] = Id;
          
        }
        public List<NoeProje> GetNoe()
        {
            return new NoeProje().GetNoe();
        }
        protected void frmAbyari_ItemCreated(object sender, EventArgs e)
        {
            //var _formview = sender as FormView;
            //MPOInterface.Controls.UscMahaleEjra mahaleejar = frmAbyari.FindControl("UscMahaleEjra") as MPOInterface.Controls.UscMahaleEjra;
            var contract = frmAbyari.FindControl("dteContract") as JQControls.JQDatePicker;
            var entry = frmAbyari.FindControl("dteEntry") as JQControls.JQDatePicker;
            //if (frmAbyari.CurrentMode == FormViewMode.Edit)
            //{
            //    var zirproje = _formview.DataItem as Model.ZirProje;
                
            //    if (mahaleejar != null && zirproje != null)
            //    {

            //        mahaleejar.UserID = AccessManagementService.Access.AccessControl.LoggenInUser.ID;
            //        mahaleejar.PrePareDropDowns(zirproje.IDRoosta ?? int.MinValue);
            //        contract.Date = entry.Date = DateTime.Now;
            //        //entry.YearRange = contract.YearRange = "1390:1400";
                    
            //    }
            //}
            if (frmAbyari.CurrentMode == FormViewMode.Insert)
            {
                contract.Date = entry.Date = DateTime.Now;    
            }
             
        }

        protected void frmAbyari_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            var t = e;
        }

        protected void frmAbyari_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Int64 ExternalExcetion = Helpers.ExceptionHelper.HandelException(this.Page, e.Exception);
            switch (ExternalExcetion)
            {
                case 1:
                    e.KeepInEditMode = true;
                    e.ExceptionHandled = true;
                    break;
                case 0:
                    Helpers.ContextHelpers.ShowMessage(Page, "اطلاعات با موفقیت ثبت شد ");

                    break;
            }

        }

        protected void frmAbyari_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Int64 ExternalExcetion = Helpers.ExceptionHelper.HandelException(this.Page, e.Exception);
            switch (ExternalExcetion)
            {
                case 1:
                    e.KeepInInsertMode = true;
                    e.ExceptionHandled = true;
                    break;
                case 0:
                    Helpers.ContextHelpers.ShowMessage(Page, "اطلاعات با موفقیت ثبت شد ");
                    frmAbyari.DefaultMode = FormViewMode.ReadOnly;
                    frmAbyari.ChangeMode(FormViewMode.ReadOnly);
                    frmAbyari.DataBind();
                    break;
            }

        }

        protected void frmAbyari_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            e.Values["SahmeDolat"] = tkv.Utility.CurrencyHelpers.GetValidCurrency(e.Values["SahmeDolat"]);
            e.Values["SahmeBank"] = tkv.Utility.CurrencyHelpers.GetValidCurrency(e.Values["SahmeBank"]);
            e.Values["SahmeMotaghazi"] = tkv.Utility.CurrencyHelpers.GetValidCurrency(e.Values["SahmeMotaghazi"]);
        }

        protected void frmAbyari_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            e.NewValues["SahmeDolat"] = tkv.Utility.CurrencyHelpers.GetValidCurrency(e.NewValues["SahmeDolat"]);
            e.NewValues["SahmeBank"] = tkv.Utility.CurrencyHelpers.GetValidCurrency(e.NewValues["SahmeBank"]);
            e.NewValues["SahmeMotaghazi"] = tkv.Utility.CurrencyHelpers.GetValidCurrency(e.NewValues["SahmeMotaghazi"]);
        }
    }
}
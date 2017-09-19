 
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Helpers;
using Telerik.Web.UI;
using Abyari.Model;
using System.Web.DynamicData;
namespace Abyari.ZirProje
{

    public partial class SearcZirProject : System.Web.UI.Page
    {

        

        protected override void OnPreInit(EventArgs e)
        {
            if (Helpers.ContextHelpers.GetViewMode() == Helpers.ContextHelpers.ViewMode.PopUp)
                this.MasterPageFile = "/Design/Masters/Sitepopup.master";
            base.OnPreInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            UscZirprojeSearchParameter.OnSearchCompelete += UscZirprojeSearchParameter_OnSearchCompelete;
            if (!IsPostBack)
            {
               entrydate.Date = contractdate.Date = DateTime.Now;
                
            }
        }

        void UscZirprojeSearchParameter_OnSearchCompelete(string WhereParameters)
        {
            var data = new Model.ZirProje().SearchZirProjeByConditions(WhereParameters);
            GrdZirPRoje.DataSource = data;
            GrdZirPRoje.DataBind();
        }
        public bool setvisible()
        {
            if (Helpers.ContextHelpers.GetViewMode() == Helpers.ContextHelpers.ViewMode.PopUp)
                return true;
            return false;
        }
        public string GetCommandArgument(object NoeBaravord, object _NoeMoamele)
        {
            if (NoeBaravord == null)
                return string.Empty;
            return string.Format("{0},{1}", NoeBaravord, _NoeMoamele);

        }


        protected void GrdZirPRoje_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            RadGrid grd = sender as RadGrid;
            GridDataItem gr = e.Item as GridDataItem;
            if (gr == null)
                return;
            string path = Helpers.ContextHelpers.GetRedirectPath();
            //string id = grd.SelectedValue.ToString();
            int id = gr.GetDataKeyValue("ID").ToInt32();
            if (e.CommandName == "Select")
            {
                string commandargument = e.CommandArgument.ToString();
                string[] split = commandargument.Split(',');
                if (split.Length < 1)    ////some error we have
                {
                    throw new ArgumentOutOfRangeException();
                }
              
            }
            if (e.CommandName == "Close")
            {
            
                Helpers.ContextHelpers.View View = Helpers.ContextHelpers.GetView();
                string vpath = string.Empty;
                vpath = string.Format("{0}?{1}", path, Helpers.ContextHelpers.SetZirProjeId(id));
                Helpers.ContextHelpers.CloseAndRedirectIframe(this.Page, vpath);
            }
          
        }
        public object SetPathSearch()
        {
            return Abyari.Helpers.SetPathHelpers.SetZirProjeSearchPath(this.Page);
        }
     

    

        protected void uscMahaleEjra_Init(object sender, EventArgs e)
        {
             

        }

        protected void GrdZirPRoje_DataBound(object sender, EventArgs e)
        {
            foreach (GridDataItem item in (sender as Telerik.Web.UI.RadGrid).Items)
            {
                
                int id = item.GetDataKeyValue("ID").ToInt32();
                WebUtility.Controls.ReportShowButton _btn = item.FindControl("RepShow") as WebUtility.Controls.ReportShowButton;
                _btn.Params = new Dictionary<string, object>() { { "IDZirproje", id.ToString() } };
            }
        }
    }
}
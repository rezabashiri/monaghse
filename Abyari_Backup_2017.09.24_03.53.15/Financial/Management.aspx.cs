using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;
using tkv.Utility;
namespace Abyari.Financial
{
    public partial class Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UscPaymankarSearchParameter.OnSearchCompelete += UscPaymankarSearchParameter_OnSearchCompelete;
        //    this.Form.DefaultButton = UscPaymankarSearchParameter.SearchButton.ClientID;
        }

        void UscPaymankarSearchParameter_OnSearchCompelete(List<Model.Paymankar> data)
        {
            grdPaymankar.DataSource = data;
            grdPaymankar.DataBind();
        }

        protected void invoice_Init(object sender, EventArgs e)
        {
        }
        public System.Collections.IEnumerable GetPaymankars()
        {
            Guid? _inv = Helpers.SessionHelpers.GetInvoiceID();
            Model.Paymankar _pay = new Model.Paymankar();
            return _pay.GetPaymanakrByInvoiceID(_inv);//if inv be null it return all paymankar(couce he's admin
        }
 

        protected void paymankarDatasource_Selecting(object sender, Microsoft.AspNet.EntityDataSource.EntityDataSourceSelectingEventArgs e)
        {

        }

        protected void paymankarDatasource_QueryCreated(object sender, QueryCreatedEventArgs e)
        {
            var t = e.Query;
        }

        protected void grdPaymankar_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            var data = e.Item as Telerik.Web.UI.GridDataItem;
            var _item = e.Item.DataItem as Model.Paymankar;
            if (data == null)
                return;
            var inv = data.GetDataKeyValue("InvoiceID") as Guid?;
            if (inv == null)//first create invoice 
            {
                var idpay = data.GetDataKeyValue("ID");
                Model.Paymankar _pay = new Model.Paymankar();
                inv=Guid.NewGuid();
                _pay.SetInvoiceID(idpay.ToInt32(), inv);
                grdPaymankar.DataBind();
            }
            invoice.InvoiceID = inv ;
            invoice.Rebind();
        }

      

        protected void hdn_Init(object sender, EventArgs e)
        {
            grdPaymankar.SetMetaTable(AppStart.DynamicDataConfig.GetMetaTable("Paymankars"));

        }
    }
}
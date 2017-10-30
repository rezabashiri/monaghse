using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Model;
namespace Abyari.Reports
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             //JQDatePicker1.YearRange=  dteEnd.YearRange= dteFrom.YearRange = "1385:1405";
                 dteFrom.Regional = JQControls.Regional.fa;
                //dteEnd.CalendarType = JQControls.CalendarType.Jalali;
              
               dteFrom.Date = new tkv.Utility.DateConversion().converttomiladi("1394/01/01");
               //((Abyari.Design.Masters.Main)this.Master).PageTitle = " گزارشات مدیریت";
               //((Abyari.Design.Masters.Main)this.Master).BreadCrumb = "براساس پارامترها ، شرایط جستجو را محدود کنید";
            }
             

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
                string conditions = string.Empty;
                WebUtility.Helpers.InvoiceReportHelpers _irh = new WebUtility.Helpers.InvoiceReportHelpers();
                Helpers.ReportHelpers _rh = new Helpers.ReportHelpers();

                conditions = UscPaymankarSearchParameter.GetSearchCondition();
                var result = _rh.ReportTotalGroupByCpmpany(conditions, dteFrom.Date.HasValue ? dteFrom.Date.Value.ToShortDateString() : string.Empty);
                string invoiceconditions = CreateInvoiceSearchCondition(result);
                var res2 = _irh.ReportTotalInvoiceGroupByInoiceID(invoiceconditions);
                var join = from res in result join rs1 in res2 on res.InvoiceID equals rs1.InvoiceID into temp from rs2 in temp.DefaultIfEmpty() select new { res.InvoiceID, res.ID, res.NamePaymankar, res.Rotbe, res.SatheJari,res.TedadKarMojaz, res.SatheKol, res.TedadKol, res.TedadJari, res.TedadTahvilShode, res.آبیاری_بارانی, res.آبیاری_قطره_ای, res.آبیاری_بارانی_تیپ, res.آبیاری_کم_فشار, res.آبیاری_کم_فشار_تیپ, res.موضعی, res.SatheMojazeSalane, res.TedadJariBozorg, TotalDue = (rs2 == null ? 0 : rs2.TotalDue), TotalInvoice = (rs2 == null ? 0 : rs2.TotalInvoice), TotalPayment = (rs2 == null ? 0 : rs2.TotalPayment) };
                grdTotalByPaymankar.DataSource = join;
                grdTotalByPaymankar.DataBind();
                dteFrom.Date = dteFrom.Date.HasValue ? dteFrom.Date : new tkv.Utility.DateConversion().converttomiladi("1394/01/01");
             
             

        }
        private string CreateInvoiceSearchCondition(List<sp_ReportTotalGroupByCompany_Result> _res)
        {
            string conditions = string.Empty;
            foreach (var res in _res)
            {
                if(res.InvoiceID != null)
                conditions += string.Format("or InvoiceID='{0}' ", res.InvoiceID);
            }
            if (!string.IsNullOrEmpty(conditions))
            {
                conditions =string.Format("({0})", conditions.Remove(0, 2));
                if (!string.IsNullOrEmpty(InvoiceTypes.SelectedKey))
                {
                  conditions=  string.Format("{0}={1} and {2}", "TypeID", InvoiceTypes.SelectedKey, conditions);
                }
                if (dteFrom.Date.HasValue)
                {
                    conditions += string.Format(" and {0} >= '{1}'  ", "CreateDate", dteFrom.Date.Value.Date.ToShortDateString());
                }
            }
            return conditions;
        }

        protected void grdTotalByPaymankar_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            btnSearch_Click(null, null);
        }

     

        protected void SearchReserve_Click(object sender, EventArgs e)
        {
            ZirProjeReservation _reserve = new ZirProjeReservation();
            grdReserve.DataSource = _reserve.SearchReservation(UscReserveSearch.GetSearchParameter);
            grdReserve.DataBind();
        }

        protected void grdReserve_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            SearchReserve_Click(null, null);
        }
    }
}

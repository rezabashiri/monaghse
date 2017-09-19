using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.ComponentModel.DataAnnotations;
namespace Abyari.Model
{
    [System.ComponentModel.DisplayName("رزرو زیرپروژه")]
    [MetadataType(typeof(MetaData))]

    public partial class ZirProjeReservation
    {
        private class MetaData
        {
            [Display(Name="زمان ثبت")]
            [System.ComponentModel.ReadOnly(true)]
            public Nullable<System.DateTime> CreateDate { get; set; }
            public virtual Paymankar Paymankar { get; set; }
            public virtual ZirProje ZirProje { get; set; }
        }
        [Display(Name="نام پیماکنکار")]
        public string PaymankerName
        {
            get
            {
                if (this.Paymankar != null)
                    return this.Paymankar.Sharh;
                return string.Empty;
            }
        }
        public int Reserve(int idpaymankar, int idproje,bool Tavafogh)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                try
                {
                     en.sp_ZirProjeReserve(idpaymankar, idproje,Tavafogh);
                     return 0;
                }
                catch (Exception ex)
                {
                    new tkv.Utility.Log().TakeLogWithPersian(ex.Message, HttpContext.Current.Server.MapPath("/"));
                    return -1;
                }
            }
        }
        public int UnReserve(   int idproje )
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                try
                {
                    var com = Helpers.SessionHelpers.GetCompany();
                    if (com != null)
                    {
                        en.sp_ZirProjeUnReserve(com.ID, idproje);
                        return 0;
                    }
                    else
                        return -1;
                }
                catch (Exception ex)
                {
                    new tkv.Utility.Log().TakeLogWithPersian(ex.Message, HttpContext.Current.Server.MapPath("/"));
                    return -1;
                }
            }
        }
        public int Contract(int idpaymankar, int idproje,string date,string entry)
        {
           
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                try
                {
                    en.sp_Contract(idproje, idpaymankar, new tkv.Utility.DateConversion().converttomiladi(date).ToShortDateString(), new tkv.Utility.DateConversion().converttomiladi(entry).ToShortDateString());
                     return 0;
                }
                catch (Exception ex)
                {
                    new tkv.Utility.Log().TakeLogWithPersian(ex.Message, HttpContext.Current.Server.MapPath("/"));
                    return -1;
                }
            }
        }
        public int DeContract(  int idproje)
        {

            using (var en = Helpers.ContextHelpers.GetContext())
            {
                try
                {
                    WebUtility.Model.Invoice _inv = new WebUtility.Model.Invoice();
                    var invoices = _inv.SearchInvoicesByExtraData(Helpers.InvoiceHelpers.SetExtraData(idproje .ToString()));
                    if (invoices != null && invoices.Count() >0)
                        return -2;
                    en.sp_Contract(idproje, null,null,null);
                    return 0;
                }
                catch (Exception ex)
                {
                    new tkv.Utility.Log().TakeLogWithPersian(ex.Message, HttpContext.Current.Server.MapPath("/"));
                    return -1;
                }
            }
        }
        public List<ViewZirprojeResevation> SearchReservation(string conditions)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                return en.sp_SearchReserved(conditions, new System.Data.Entity.Core.Objects.ObjectParameter("RowCount", typeof(int))).ToList<ViewZirprojeResevation>();
            }
        }
    }
}
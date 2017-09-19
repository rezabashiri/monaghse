using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using tkv.Utility; 
namespace Abyari.Model
{
    [System.ComponentModel.DisplayName("پیمانکاران")]
    [MetadataType(typeof(MetaData))]
    public partial class Paymankar
    {
        private class MetaData
        {

            [Display(AutoGenerateField = false)]
            public int ID { get; set; }

            [Required(ErrorMessage = "شرح را وارد نمایید")]
            [Display(Name = "شرح", Order = 1)]
            public string Sharh { get; set; }

            [Required(ErrorMessage = "شماره ثبت/شماره شناسنامه را وارد نمایید")]
            [Display(Name = "شماره ثبت/شماره شناسنامه", Order = 3)]
            public string ShomareSabt { get; set; }
 
            [Display(Name="کد اقتصادی")]
            public string CodeEghtesadi { get; set; }

            [Required(ErrorMessage = "شناسه ملی /کدملی را وارد نمایید")]
            [Display(Name = "شناسه ملی /کدملی", Order = 4)]
            public string ShenaseMeli { get; set; }

            [Display(Name = "حقیقی است", Order = 0)]
            public Nullable<bool> Haghighi { get; set; }

            [Display(Name = "در لیست سیاه است")]
            public Nullable<bool> ListSiah { get; set; }

            [Required(ErrorMessage = "نام کامل را وارد نمایید")]
            [Display(Name = "نام کامل")]
            public string NameKamel { get; set; }

            [Display(Name = "نمابر")]
            public string Fax { get; set; }

            [Display(Name = "تلفن")]
            public string Tel { get; set; }

            [Display(Name = "پست الکترونیکی")]

            public string EMail { get; set; }

            [Display(Name = "نام مدیر")]
            public string Modir { get; set; }

            [Display(Name = "تلفن مدیر")]
            public string TelMOdir { get; set; }


            [Display(Name = "فعال")]
            public bool Faal { get; set; }


            [Display(Name = "آدرس")]
            public string Addres { get; set; }


            [Display(Name = "محل ثبت")]
            public string MahalSabt { get; set; }
            [Display(Name="کاربر متصل به شرکت")]
            [UIHint("UserSelect")]
            public Nullable<int> UserID { get; set; }
            [ScaffoldColumn(false)]
            public virtual ICollection<PaymankarReshte> PaymankarReshtes { get; set; }
            [ScaffoldColumn(false)]
            public virtual ICollection<ZirProje> ZirProjes { get; set; }

        }
        public List<ViewPaymankarReshte> SearchPaymankaranMojaz(string ReshteIds,string Conditions,int IDZirProje)
        {
            using (var myen = new AbyariEntities())
            {

                System.Data.Entity.Core.Objects.ObjectResult<ViewPaymankarReshte> res = myen.ListOfPaymankaranMojaz(ReshteIds,Conditions,IDZirProje);
                if (res != null)
                    return res.ToList<ViewPaymankarReshte>();
                return null;
            }
        }
        public List<ViewPaymankarReshte> SearchPaymankaranMojaz(string ReshteIds, int IDZirProje)
        {
            return SearchPaymankaranMojaz(ReshteIds, string.Empty,IDZirProje);
        }
        public Guid? GetPaymankarInvestmentID()
        {
            int? userid=Helpers.SessionHelpers.GetUser().ID;
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                var invoiceid = en.Paymankars.AsNoTracking().Where(x => x.UserID == userid).Select(x => x.InvoiceID).FirstOrDefault();
                return invoiceid;
            }
        }
        public Paymankar GetPaymankarBasedonUserID()
        {
            int? userid = Helpers.SessionHelpers.GetUser().ID;
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                var paymankar = en.sp_GetPaymankarDetail(userid).FirstOrDefault();
                return paymankar;
            }
        }
        public List<Paymankar> SearchByConditions(string conditions)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                return en.sp_SearchPaymankar(conditions).ToList();
            }
        }
        public List<Paymankar> GetPaymanakrByInvoiceID(Guid? InvoiceID)
        {
            string cond = string.Empty;
            if (InvoiceID != null)
            {
                  cond = string.Format("InvoiceID='{0}'", InvoiceID);
            }
            return SearchByConditions(cond);
        }
        public int SetInvoiceID(int idpaymankar, Guid? invoiceid)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                return en.SetPaymankarInvoiceID(idpaymankar, invoiceid);
            }
        }
        public string SetUserID(string idpaymankar )
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                int? userid = Helpers.SessionHelpers.GetUser().ID;
                if (!string.IsNullOrEmpty(idpaymankar))
                {
                    var res = en.sp_SetPaymankarUserID(idpaymankar.ToInt32(), userid).FirstOrDefault();
                    switch (res)
                    {
                        case -1:
                            return "نام کاربری شما قبلا به عنوان پیمانکار ثبت شده است";
                        case 0:
                            return "این شرکت قبلا انتخاب شده است";
                        case 1:
                            return "اطلاعات ثبت شد";
                    }
                }
                return "شرکت انخاب نشده است";
            }
        }
        public sp_GetPaymanakrStatistics_Result GetPaymankarStatistics(string FromDate)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                var detail = en.sp_GetPaymanakrStatistics(AccessManagementService.Access.AccessControl.LoggedInUser.ID, FromDate).FirstOrDefault();
                if (detail != null)
                {
                    detail.Allowed = detail.Allowed ?? 0;
                    detail.Contracted =  detail.Contracted ?? 0 ;
                    detail.TotalInvoice = detail.TotalInvoice;
                    detail.TotalPayment =  detail.TotalPayment ?? 0 ;
                    detail.Reserved =  detail.Reserved ?? 0 ;
                  
                }
                return detail;
            }
        }
    }

   
    
}
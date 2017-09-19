using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Model;
using tkv.Utility;
using WebUtility.Helpers;
namespace Abyari.ClientFunctions
{
    public partial class ClientCalls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod()]
        public static string CheckNamayande(string CodeMeli)
        {
            Model.Moshtary _moshtary = new Model.Moshtary();
            var _get = _moshtary.GetMoshtary(CodeMeli);
            return _get != null ? _get.FullName : "false";
        }
        [System.Web.Services.WebMethod()]
        public static List<Model.ViewPaymankarReshte> SearchPaymankar(string reshteid, string condition,string idproje)
        {
            Paymankar _pay = new Paymankar();
            if (!string.IsNullOrEmpty(condition))
            {
                condition = string.Format(" NamePaymankar like N{0}", string.Format("'%{0}%'",condition));
            }
            return  _pay.SearchPaymankaranMojaz(reshteid, condition,idproje.ToInt32());
        }

        [System.Web.Services.WebMethod()]
        public static List<Model.ViewZirProjeMoshtary> SearchZirProje(string codemeli, string code, string IDPaymankar)
        {
        
            string WhereParameters = string.Empty;
            WhereParameters =string.Format( " IDPaymankar = {0}",IDPaymankar);  // whithout contract there is no chance to create invoice
            if (!string.IsNullOrEmpty(code))
            {
                WhereParameters = WhereParameters + string.Format(" and Code = N'{0}' ", code);
            }
            if (!string.IsNullOrEmpty(codemeli))
            {
                WhereParameters += string.Format(" and CodeMeliMoshtary={0}", codemeli);

            }
            //if (WhereParameters.Contains("and"))
            //    WhereParameters = WhereParameters.Remove(WhereParameters.IndexOf("and"), 3);
            return new Model.ZirProje().SearchZirProjeByConditions(WhereParameters);
        }
        [System.Web.Services.WebMethod()]

        public static string ZriprojeUnReserve(string idzirproje )
        {
            ZirProjeReservation _reserv = new ZirProjeReservation();
            if (!string.IsNullOrEmpty(idzirproje) && idzirproje != "undifiend" )
            {
                var res = _reserv.UnReserve(  idzirproje.ToInt32());
                if (res >= 0)
                    return "طرح از رزرو خارج شد،پس از اتمام زمان امکان رزرو مجدد وجود ندارد";
                else
                    return "این پیمانکار قبلا در این پروژه رزرو نشده است";
            }
            else
                return "پیمانکار و یا پروژه انتخاب نشده است";
        }
        [System.Web.Services.WebMethod()]

        public static string ZriprojeReserve(string idzirproje, string idpaymankar,bool tavafogh)
        {
            ZirProjeReservation _reserv = new ZirProjeReservation();
            if (!string.IsNullOrEmpty(idzirproje) && idzirproje != "undifiend" && !string.IsNullOrEmpty(idpaymankar) && idpaymankar != "undefined")
            {
                var res = _reserv.Reserve(idpaymankar.ToInt32(), idzirproje.ToInt32(),tavafogh);
                if (res >= 0)
                    return "اطلاعات با موفقیت ثبت شد";
                else
                    return "این پیمانکار قبلا در این پروژه ثبت شده است";
            }
            else
                return "پیمانکار و یا پروژه انتخاب نشده است";
        }
        [System.Web.Services.WebMethod()]

        public static string ZriprojeReserve(string idzirproje,   bool tavafogh)
        {
            var com = Helpers.SessionHelpers.GetCompany();
            if (com != null)
            {
                string idp = com.ID.ToString();
                return ZriprojeReserve(idzirproje, idp, tavafogh);
            }
            else
            {
                return "حساب کاربری شما فعال نشده است";
            }
        }
        [System.Web.Services.WebMethod()]
        public static string ZriprojeContract(string idzirproje, string idpaymankar,string date,string entry)
        {
            ZirProjeReservation _reserv = new ZirProjeReservation();
            if (!string.IsNullOrEmpty(idzirproje) && idzirproje != "undifiend" && !string.IsNullOrEmpty(idpaymankar) && idpaymankar != "undefined")
            {
                var res = _reserv.Contract(idpaymankar.ToInt32(), idzirproje.ToInt32(),date,entry);
                if (res >= 0)
                    return "اطلاعات با موفقیت ثبت شد";
                else
                    return "عقد قرارداد امکان پذیر نمیباشد";
            }
            else
                return "پیمانکار و یا پروژه انتخاب نشده است";
        }
        [System.Web.Services.WebMethod()]
        public static string ZriprojeDeContract(string idzirproje )
        {
            ZirProjeReservation _reserv = new ZirProjeReservation();
            if (!string.IsNullOrEmpty(idzirproje) && idzirproje != "undifiend" )
            {
                var res = _reserv.DeContract( idzirproje.ToInt32());
                if (res == -2)
                    return "برای این قرارداد صورت حساب صادر شده است و امکان لغو آن وجود ندارد";
                if (res >= 0)
                    return "قرارداد لغو شد";
                else
                    return "لغو قرارداد امکان پذیر نمیباشد";
            }
            else
                return "پیمانکار و یا پروژه انتخاب نشده است";
        }
        [System.Web.Services.WebMethod()]

        public static string SaveInvoiceExtraData(string invoiceid, string idproje)
        {
            WebUtility.Model.Invoice _save = new WebUtility.Model.Invoice();
            if (!string.IsNullOrEmpty(invoiceid) && invoiceid != "undifiend" && !string.IsNullOrEmpty(idproje) && idproje != "undefined")
            {

                var res = _save.UpdateExtraData(invoiceid.ToInt32(), Helpers.InvoiceHelpers.SetExtraData(idproje));
                switch (res)
                {
                    case 0:
                        return "برای این پروژه قبلا صورت حساب صادر شده است";
                    case 1:
                    return "اطلاعات با موفقیت ثبت شد";
                    default:
                    return "عقد قرارداد امکان پذیر نمیباشد";

                }
         
           
            }
            else
                return "صورت حساب و یا پروژه انتخاب نشده است";
        }
        [System.Web.Services.WebMethod()]
        public static System.Collections.IEnumerable GetPaymentsBasedOnInvoice(string invoiceid)
        {
            return new WebUtility.Model.Payment().SearchPayments(new Guid( invoiceid));
        }
        [System.Web.Services.WebMethod()]
        public static void DeliveryProje(string idproje)
        {
            if (!string.IsNullOrEmpty(idproje))
            {
                var delivery = new Model.ZirProjeTahvilMovaghat();
                delivery.DeliveryProje(idproje.ToInt32());
            }
        }
        [System.Web.Services.WebMethod()]

        public static sp_GetPaymanakrStatistics_Result GetPaymankarStatistics()
        {
            Paymankar _p = new Paymankar();
            var detail = _p.GetPaymankarStatistics((new tkv.Utility.DateConversion().Firstofyear_jessus().Year - 5).ToString()) ?? new sp_GetPaymanakrStatistics_Result();
            JsonHelpers _helper = new JsonHelpers();
            return detail;
           
        }
    }
}
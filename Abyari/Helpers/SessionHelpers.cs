using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abyari.Helpers
{
    public class SessionHelpers
    {
        public enum Sessions
        {
            user,
            InvoiceID,
            Company
        }
        public static void Set<T>(T obj, Sessions key)
        {
            HttpContext.Current.Session[Enum.GetName(typeof(Sessions),key)] = obj;
        }
        public static T Get<T>(Sessions key)
        {
            object value = HttpContext.Current.Session[Enum.GetName(typeof(Sessions), key)];
            if (value == null )
                return default(T);
            return (T)value;
        }
        public static AccessManagementService.Model.User GetUser()
        {
            return AccessManagementService.Access.AccessControl.LoggedInUser;
        }
        public static void SetCompany(Model.Paymankar Company)
        {
            Set<Model.Paymankar>(Company,Sessions.Company);
        }
        public static Model.Paymankar GetCompany()
        {
            return Get<Model.Paymankar>(Sessions.Company);
        }
        public static void SetInvoiceID(Guid? invoiceid)
        {
            Set<Guid?>(invoiceid,Sessions.InvoiceID);
        }
        public static Guid? GetInvoiceID()
        {
            return Get<Guid?>(Sessions.InvoiceID);
        }
    }
}
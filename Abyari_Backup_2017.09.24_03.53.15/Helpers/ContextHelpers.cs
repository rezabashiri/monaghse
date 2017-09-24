using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
namespace Abyari.Helpers
{
    public class ContextHelpers
    {
        public enum QueryStrings
        {
            ViewMode,
            RedirectPath,
            ZirProjeId,
            View

        }
        public enum ViewMode
        {
            None,
            PopUp
        }
        public enum View
        {
            View,
            Edit,
            Insert
        }
        public static string GetNamePath(string VirtualPath)
        {
            return VirtualPath.Replace("~", "");

        }
        public static string GetName(string VirtualPath)
        {
            string[] split = VirtualPath.Split('/');
            if (split.Length > 0)
            {
                string name = split[split.Length - 1];
                if (name.Contains(".aspx"))
                {
                    return name;
                }
            }
            return string.Empty;
        }
        public static string GetQueryStringValue( string QuerystringName)
        {
            string querystring = HttpContext.Current.Request.QueryString[QuerystringName];
            return querystring ?? string.Empty;
        }
        public static string GetQueryStringValue( QueryStrings Name)
        {
            string _name = Enum.GetName(typeof(QueryStrings), Name);
            return GetQueryStringValue( _name ?? string.Empty);
        }
        public static string SetQueryStringValue(QueryStrings Name, string Value)
        {
            return string.Format("{0}={1}", Enum.GetName(typeof(QueryStrings), Name), Value);
        }
        //تنظیم و دریافت ZirProjeId

        public static int GetZirProjeId()
        {
            return GetQueryStringValue( QueryStrings.ZirProjeId).ToInt32();
        }
        public static string SetZirProjeId(int Id)
        {
             
                return string.Format("{0}={1}", QueryStrings.ZirProjeId.ToString(), Id);
          
        }

        public static ViewMode GetViewMode()
        {
            string mode = GetQueryStringValue(QueryStrings.ViewMode);
            ViewMode vmode;
            if (Enum.TryParse(mode, out vmode))
            {
                return vmode;
            }
            return ViewMode.None;
        }

        public static string SetViewMode(ViewMode VMode)
        {
            return string.Format("{0}={1}", QueryStrings.ViewMode.ToString(), VMode.ToString());
        }
        public static string GetRedirectPath( )
        {
            return GetQueryStringValue( QueryStrings.RedirectPath);
        }
        public static string SetRedirectPath(string PageName)
        {
            return string.Format("{0}={1}", QueryStrings.RedirectPath.ToString(), PageName);
        }
        public static View GetView()
        {
            string mode = GetQueryStringValue( QueryStrings.View);
            View vmode;
            if (Enum.TryParse(mode, out vmode))
            {
                return vmode;
            }
            return View.View;
        }
        public static string SetView(View VMode)
        {
            return string.Format("{0}={1}", QueryStrings.View.ToString(), VMode.ToString());
        }
        public static void CloseAndRedirectIframe(Page _page, string path)
        {
            ScriptManager.RegisterStartupScript(_page, _page.GetType(), "closeiframe", string.Format("window.parent.tb_remove();window.parent.location='{0}';", path), true);

        }
        public static Model.AbyariEntities GetContext()
        {
            return new Model.AbyariEntities();
        }
        public static void ShowMessage(Page _page, string message)
        {
            WebUtility.Helpers.RegisterHelpers.RegisterScript(_page, "alerting", "show('" + message + "')");
            
        }
        public static void ShowSuccess(Page _page)
        {

            ShowMessage(_page, "عملیات با موفقیت صورت پذیرفت");
        }
    }
}
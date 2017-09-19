using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.FriendlyUrls;
using System.Web.Routing;
using System.Web.DynamicData;
namespace Abyari.AppStart
{
    public class ConfigRoutes
    {
        public static void Register(RouteCollection rcol)
        {
            //var settings = new FriendlyUrlSettings();
            //settings.AutoRedirectMode = RedirectMode.Permanent;
            //rcol.EnableFriendlyUrls(settings);
            rcol.EnableFriendlyUrls();
            rcol.Add(new DynamicDataRoute("{table}/{action}.aspx")
            {

                Constraints = new RouteValueDictionary(new { action = "List|Details|Edit|Insert|ListDetails" }),
                Model = DynamicDataConfig.DefualtModel
            });
            //rcol.MapPageRoute("adminpage", "administrator", "~/Pages/Admin/administrator.aspx");
            //rcol.MapPageRoute("index", "show/{Content}/{id}", "~/Default.aspx");
            rcol.MapPageRoute("zirproje", "zirproje", "~/Zir_Project/EtebaratEjra.aspx");
        }
    }
}
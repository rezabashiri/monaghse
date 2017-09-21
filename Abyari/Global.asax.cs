using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
 
namespace Abyari
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            // AppStart.DynamicDataConfig.RegisterEntityModel();
            //AppStart.ConfigRoutes.Register(RouteTable.Routes);
            WebUtility.AppStart.EntityModelHelpers.RegisterEntityModel(AppStart.DynamicDataConfig.DefualtModel, new Model.AbyariEntities());
            WebUtility.AppStart.ConfigRoutes.RegisterModelRoutes(RouteTable.Routes, AppStart.DynamicDataConfig.DefualtModel);
            WebUtility.AppStart.EntityModelHelpers.RegisterEntityModel(global::AccessManagementService.AppStart.DynamicDataConfig.AccessManagementModel, new global::AccessManagementService.Model.AccessEntities());
            WebUtility.AppStart.ConfigRoutes.RegisterModelRoutes(RouteTable.Routes, global::AccessManagementService.AppStart.DynamicDataConfig.AccessManagementModel);
        
            WebUtility.AppStart.EntityModelHelpers.RegisterEntityModel(WebUtility.AppStart.EntityModelHelpers.DefualtModel, new WebUtility.Model.WebUtilityEntities());
            WebUtility.AppStart.ConfigRoutes.RegisterModelRoutes(RouteTable.Routes, WebUtility.AppStart.EntityModelHelpers.DefualtModel);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
//            System.Threading.Thread.CurrentThread.CurrentCulture = new tkv.Utility.CultureHelpers().GetCulture();
                
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            global::AccessManagementService.Access.Login _login = new global::AccessManagementService.Access.Login();
            _login.LogOutUser(Session[global::AccessManagementService.Access.AccessControl.UserSesion] as global::AccessManagementService.Model.User);
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}
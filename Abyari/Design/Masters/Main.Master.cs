using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;
namespace Abyari.Design.Masters
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<MetaTable> _Basetables = Abyari.AppStart.DynamicDataConfig.DefualtModel.VisibleTables.Where(x => x.Scaffold == true).ToList();
                BaseRepeater.DataSource = _Basetables;
                BaseRepeater.DataBind();
                if (global::AccessManagementService.Access.AccessControl.IsValidAccessToRight("مجوز مدیریت کاربر"))
                {
                    UsersRepeater.DataSource = global:: AccessManagementService.AppStart.DynamicDataConfig.AccessManagementModel.VisibleTables.Where(x => x.Scaffold == true).ToList<MetaTable>();
                    UsersRepeater.DataBind();
                }
            }
            
        }
        public string PageTitle
        {
            get;
            set;
        }
        public string BreadCrumb
        {
            get;
            set;
        }
        protected void btnExit_Click(object sender, EventArgs e)
        {
            var user=new AccessManagementService.Access.Login();
            user.LogOutUser(Session[global::AccessManagementService.Access.AccessControl.UserSesion] as global::AccessManagementService.Model.User);
            user.RemoveSessions();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari.Monaghese
{
    public partial class farmerProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mobile = AccessManagementService.Access.AccessControl.LoggedInUser.UserName;

            //string mobile = "9131044588"; // come from username after farmer login


            string condition = string.Format(" Mobile = '{0}'", mobile);
            Abyari.Model.ZirProje proje = new Model.ZirProje();
            grdProjecsSelect.DataSource = proje.SearchZirProjeByConditions(condition);
            grdProjecsSelect.DataBind();
        }
    }
}
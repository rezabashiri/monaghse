using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari.Monaghese
{
    public partial class SearchWf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string mobile = AccessManagementService.Access.AccessControl.LoggedInUser.UserName;
                string condition = string.Format(" Mobile = '{0}'", mobile);
                UscSearchZirprojeMoshtariByWF.DoSearch(condition);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari
{
    public partial class LoginUser : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Form.DefaultButton = LoginControl.LoginButton.UniqueID;
            LoginControl.OnLoggedIn += LoginControl_OnLoggedIn;
        }

        void LoginControl_OnLoggedIn(AccessManagementService.Model.User user)
        {

            Helpers.SessionHelpers.SetCompany(new Model.Paymankar().GetPaymankarBasedonUserID());
        }
    }
}
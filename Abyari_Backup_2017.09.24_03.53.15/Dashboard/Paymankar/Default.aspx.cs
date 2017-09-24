using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari.Dashboard.Paymankar
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Helpers.SessionHelpers.GetCompany() == null )
            {
                Server.Transfer("/Administrator/SelectCompany.aspx", false);
            }
            ((Abyari.Design.Masters.Main)this.Master).PageTitle = " مدیریت پیمانکاران";
            ((Abyari.Design.Masters.Main)this.Master).BreadCrumb = "آمار اقدامات پیمانکار در سال جاری شمسی";
        }
    }
}
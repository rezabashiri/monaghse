using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Model;
namespace Abyari.Administrator
{
    public partial class SelectCompany : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Abyari.Design.Masters.Main)this.Master).PageTitle = " انتخاب شرکت";
            ((Abyari.Design.Masters.Main)this.Master).BreadCrumb = "لطفا شرکت خود را انتخاب نمایید،پس از ثبت امکان تغییر وجود نخواهد داشت";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var res = new Paymankar().SetUserID(UscSelectPaymankar.IDPaymankar);
           
            new AccessManagementService.Access.Login().LogOutUser();
        }
    }
}
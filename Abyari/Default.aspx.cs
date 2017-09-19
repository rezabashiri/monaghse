using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Abyari.Design.Masters.Main)this.Master).PageTitle = "رزرو طرح های مجاز برای شما";
            ((Abyari.Design.Masters.Main)this.Master).BreadCrumb = "از لیست زیر براساس پارامترهای دلخواه اقدام به جستجو نمایید ، در لیست طرح های مجاز براساس پارامترهای جستجو نمایش داده خواهد شد";
        }
    }
}
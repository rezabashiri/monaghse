﻿using System;
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
            ((Abyari.Design.MasterPages.Administrator)this.Master).PageTitle = "رزرو طرح های مجاز برای شما";
            ((Abyari.Design.MasterPages.Administrator)this.Master).BreadCrumb = "از لیست زیر براساس پارامترهای دلخواه اقدام به جستجو نمایید ، در لیست طرح های مجاز براساس پارامترهای جستجو نمایش داده خواهد شد";
            UscZirprojeSearchParameter.OnSearchCompelete += UscZirprojeSearchParameter_OnSearchCompelete;
        }

        void UscZirprojeSearchParameter_OnSearchCompelete(string condition)
        {
            UscSearchZirProjeByWF.DoSearch(condition);
        }
    }
}
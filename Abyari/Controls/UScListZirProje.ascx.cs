using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;
namespace Abyari.Controls
{
    public partial class UScListZirProje : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UscZirprojeSearchParameter.OnSearchCompelete += UscZirprojeSearchParameter_OnSearchCompelete;
        }

        void UscZirprojeSearchParameter_OnSearchCompelete(string WhereParameters)
        {
            Model.ViewZirProje _zir = new Model.ViewZirProje();
            grdZirProjeData.DataSource = _zir.SelectPaymankarsProject(WhereParameters);
            grdZirProjeData.DataBind();
        }

    

     
    }
}
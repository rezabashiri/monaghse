using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Model;
namespace Abyari.Controls
{
    public partial class UscPaymankarSearchParameter : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BtnSearch.Visible = !HideSearchBtn;
        }
        public delegate void SearchComplete(List<Paymankar> data);
        public event SearchComplete OnSearchCompelete;
        public Button SearchButton
        {
            get
            {
                return BtnSearch;
            }
        }
        public List<Paymankar> GetPaymankar()
        {
            return new Paymankar().SearchByConditions(string.Empty);
        }
        public bool HideSearchBtn
        {
            get;
            set;
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {

            if (OnSearchCompelete != null)
            {
                var data = new Model.Paymankar().SearchByConditions(GetSearchCondition());

                OnSearchCompelete(data);
            }
        }
        public string GetSearchCondition()
        {
            string condition = string.Empty;

            if (!string.IsNullOrEmpty(txtCodeEghtesadi.Text))
            {
                condition = string.Format(" and CodeEghtesadi='{0}'", txtCodeEghtesadi.Text);
            }
            if (!string.IsNullOrEmpty(txtSabt.Text))
            {
                condition += string.Format(" and ShomareSabt='{0}'", txtSabt.Text);
            }
            if (!string.IsNullOrEmpty(txtShenaseMeli.Text))
            {
                condition += string.Format(" and ShenaseMeli='{0}'", txtShenaseMeli.Text);
            }
            if (!string.IsNullOrEmpty(cmbPyamankar.SelectedValue))
            {
                condition += string.Format(" and ID={0}", cmbPyamankar.SelectedValue);
            }
            if (condition.Contains("and"))
                condition = condition.Remove(condition.IndexOf("and"), 3);
            return condition;
        }
    }
}
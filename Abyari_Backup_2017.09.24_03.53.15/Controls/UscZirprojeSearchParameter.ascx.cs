using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Model;
namespace Abyari.Controls
{
    public partial class UscZirprojeSearchParameter : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //uscMahaleEjra.UserID  = AccessManagementService.Access.AccessControl.LoggenInUser.ID;
            pnlStatus.Visible = ShowStatus;
            UscSelectPaymankar.Visible = ShowCompany;
        }
        [System.ComponentModel.DefaultValue(true)]
        public bool ShowStatus
        {
            get;
            set;
        }
        [System.ComponentModel.DefaultValue(true)]
        public bool ShowCompany
        {
            get;
            set;
        }
        public delegate void SearchComplete(string condition);
        public event SearchComplete OnSearchCompelete;
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string WhereParameters = string.Empty;


            if (! string.IsNullOrEmpty(uscMahaleEjra.IDShahrestan  ))
            {

                WhereParameters = WhereParameters + string.Format(" and IDRoosta= {0} ", uscMahaleEjra.IDShahrestan);
            }
      
            if (!string.IsNullOrEmpty(TxtCode.Text))
            {
                //WhereParameters = WhereParameters + string.Format(" and Name like N'{0}' ", string.Format("{0},{1},{2}", "%", TxtName.Text, "%"));
                WhereParameters = WhereParameters + string.Format(" and Code = N'{0}' ", TxtCode.Text);

            }
            if (!string.IsNullOrEmpty(UscSelectPaymankar.IDPaymankar))
            {
                WhereParameters += string.Format(" and IDPaymankar={0}", UscSelectPaymankar.IDPaymankar);
            }
            if (!string.IsNullOrEmpty(txtCodeMeli.Text))
            {
                WhereParameters += string.Format(" and CodeMeliMoshtary='{0}'", txtCodeMeli.Text);
            }
            if (!string.IsNullOrEmpty(txtFamily.Text))
            {
                WhereParameters += string.Format(" and Famil like N'%{0}%'", txtFamily.Text);
            }
            if (!string.IsNullOrEmpty(cmbSatus.SelectedValue))
            {
                switch (cmbSatus.SelectedValue)
                {
                    case "none":
                        WhereParameters +=  " and IDPaymankar is null" ;
                        break;
                    case "contract":
                        WhereParameters += " and IDPaymankar is not null";
                        break;
                    case "nodelivery":
                        WhereParameters += " and Tahvil=0";
                        break;
                    case "delivery":
                        WhereParameters += " and Tahvil=1";
                        break;

                }
            }
            if (!string.IsNullOrEmpty(txtName.Text))
            {
                WhereParameters += string.Format(" and Name like N'%{0}%'", txtName.Text);
            }
            if (!string.IsNullOrEmpty(UscSathParameter.Conditions))
            {
                WhereParameters += " and " + UscSathParameter.Conditions;
            }
            if (!string.IsNullOrEmpty(UscNoeParameter.Conditions))
            {
                WhereParameters += " and " + UscNoeParameter.Conditions;
            }
            if (WhereParameters.Contains("and"))
                WhereParameters = WhereParameters.Remove(WhereParameters.IndexOf("and"), 3);




             if (OnSearchCompelete != null)
             {
                
                 OnSearchCompelete(WhereParameters);
             }
        }
       
        public List<Model.NoeProje> getNoeZirproject()
        {
            return new Model.NoeProje().GetNoe();
        }
       
    }
}
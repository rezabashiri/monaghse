using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Model;
using System.Web.DynamicData;
using tkv.Utility;
namespace Abyari.Controls
{
    public partial class UscEntekhabPaymankar : System.Web.UI.UserControl
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
        }
        
        protected void Page_Init(object sender, EventArgs e)
        {
      
        }
        public List<Reshte> Get_Data()
        {
            Reshte _reshte = new Reshte();
            return _reshte.GetAllReshte(null);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                grdPaymankar.DataSource = new List<int>();
        }
        private int? selected;
        public int? SelectedPaymankar
        {
            get
            {
                selected=grdPaymankar.SelectedValue.ToInt32();
                if (selected == int.MinValue)
                    return null;
                return selected;
            }
            set
            {
                selected = value ;
            }
        }

     

        protected void cmbReshtes_Init(object sender, EventArgs e)
        {
            MetaTable mt = AppStart.DynamicDataConfig.GetMetaTable("ViewPaymankarReshtes");
            //grdPaymankar.SetMetaTable(mt);
        }

        protected void grdPaymankar_DataBound(object sender, EventArgs e)
        {
            foreach (Telerik.Web.UI.GridDataItem item in grdPaymankar.Items)
            {
                if (item.GetDataKeyValue("IDPaymankar").ToInt32() == selected)
                {
                    item.Selected = true;
                }
            }
        }
    }
}
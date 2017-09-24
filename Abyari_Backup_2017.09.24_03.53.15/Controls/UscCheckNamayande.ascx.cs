using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari.Controls
{
    public partial class UscCheckNamayande : System.Web.UI.UserControl
    {
          public string CodeMelli
        {
            get
            {
                return txtCodeMelli.Text;
            }
            set
            {
                if (value != null)
                txtCodeMelli.Text = value.ToString();
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void frmMoshtary_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            e.Values["CodeMelli"] = txtCodeMelli.Text;
        }
    }
}
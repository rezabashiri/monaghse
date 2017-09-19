using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Enums;
using Abyari.Model;
using System.Web.Security;
using System.Web.DynamicData;

namespace Abyari.Controls
{
    public partial class UscSearchZirProject : System.Web.UI.UserControl
    {
        public string id;


        int CodeZirProject;
        AbyariEntities MyEn;



        protected void Page_Load(object sender, EventArgs e)
        {
            MyEn =new AbyariEntities();

            if (!IsPostBack)
            {
                if (Helpers.ContextHelpers.GetZirProjeId() != int.MinValue)
                {
                    CodeZirProject = Helpers.ContextHelpers.GetZirProjeId();
                    TxtEntekhabZirProject.Text = CodeZirProject.ToString();
                    DivNemayesh.Visible = true;
                    Model.ZirProje MyZirProject = new Model.ZirProje();
                    MyZirProject = MyZirProject.GetZirProjeByCodeIncludes(CodeZirProject, null);
                    if (MyZirProject != null)
                    {
                        LblName.Text = MyZirProject.Name;
                        Lblcode.Text = MyZirProject.Code;

                    }
                }
            }

        }


        private string zirprojectcode;
        public string getZirprojectCode
        {
            get
            {
                return zirprojectcode;
            }
            set
            {
                zirprojectcode = TxtEntekhabZirProject.Text;
            }
        }
        public object SetPathSearch()
        {
            return Abyari.Helpers.SetPathHelpers.SetZirProjeSearchPath(this.Page);
        }
   

      


 











    

      

    }
}

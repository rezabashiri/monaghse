using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abyari.Helpers
{
    public class SetPathHelpers
    {
        private static int Width
        {
            get
            {
                return 900;
            }
        }
        private static int Heith
        {
            get
            {
                return 550;
            }
        }
        public static string PupUpProperties
        {
            get
            {
                return string.Format("TB_iframe=false&height={0}&width={1}", Heith, Width);
            }
        }

        public static string SetZirProjeSearchPath(System.Web.UI.Page _page)
        {
            string vpath = _page.AppRelativeVirtualPath;
            string name = ContextHelpers.GetName(vpath);
            return string.Format("/ZirProje/SearcZirProject.aspx?{0}&{1}&{2}", ContextHelpers.SetViewMode(ContextHelpers.ViewMode.PopUp), ContextHelpers.SetRedirectPath(name), PupUpProperties);

        }
        public static string SetSearchZirProjeReturnPath(string directOriginPath, int ID, string Code, string IDPaymankar)
        {
            Helpers.ContextHelpers.ViewMode View = Helpers.ContextHelpers.GetViewMode();
            var Context = HttpContext.Current;
            string vpath = string.Empty;
    
            vpath = string.Format("{0}?{1}", directOriginPath, Helpers.ContextHelpers.SetZirProjeId(ID));

            return vpath;
        }
    }
}
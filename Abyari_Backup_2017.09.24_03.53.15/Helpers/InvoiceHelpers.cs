using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Abyari.Model;
 
namespace Abyari.Helpers
{
    public class InvoiceHelpers
    {
        /// <summary>
        /// to communicate logically between project and invoices
        /// </summary>
        /// <param name="IDProje"></param>
        /// <returns></returns>
        public static string SetExtraData(string IDProje)
        {
            return string.Format("IdProje={0}", IDProje);
        }
        private static List<Model.ViewZirProjeMoshtary> _proje;
        private static bool _isload = false;
        private static int _count = 1;
        public static string GetProjeName(int ID)
        {
            if (!_isload)
            {
                _isload = true;
                _proje = new Model.ZirProje().SearchZirProjeByConditions(null);
            }
            if (_count <= _proje.Count/2)
            {
                _count++;
                var proj=_proje.Where(x => x.ID == ID).FirstOrDefault();
                return proj != null ? proj.Name : string.Empty;
            }
            else
            {
                _proje = null;
                _isload = false;
                _count = 1;
            }
            return string.Empty;
        }
        public static string GetIdProje(string extradata)
        {
        
            if (!string.IsNullOrEmpty(extradata))
            {
                string[] splite = extradata.Split('=');
                if (splite.Count() > 1)
                    return splite[1];
            }
            return string.Empty;
        }
    }
}
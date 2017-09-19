using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using tkv.Utility;
using System.Text;
namespace Abyari.Helpers
{
    public class LogHelpers
    {
        public static string LogPath
        {
            get
            {
                return string.Format("{0}\\log.txt", System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath);
            }
        }
        public static void WriteLog(string message, string source)
        {
            try
            {
                Log _log = new Log();
                StringBuilder sb = new StringBuilder();
                sb.Append(message);
                sb.Append(string.Format("----source : {0} ", source));
                _log.TakeLogWithPersian(sb.ToString(), LogPath);
            }
            catch (Exception ex)
            {

            }
        }

            
           
        
        
    }
}
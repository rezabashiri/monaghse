using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abyari.Helpers
{
    public class PersianSearchDataSourceHelpers
    {
        /// <summary>
        /// prepare string to use as where clouse in datasource to suport unicode special to use with radgrid
        /// </summary>
        /// <param name="wherequery"></param>
        /// <returns></returns>
        public static string GetValidUniCodeQuery(string wherequery)
        {
            if (string.IsNullOrEmpty(wherequery))
                return string.Empty;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            bool jump = false;
            foreach (char c in wherequery)
            {
                if (c == '"')
                {
                    if (!jump)
                    {
                        sb.Append('N');
                        jump = true;
                    }
                    else
                    {
                        jump = false;
                    }
                }
                sb.Append(c);
            }
            return sb.ToString();
        }
    }
}
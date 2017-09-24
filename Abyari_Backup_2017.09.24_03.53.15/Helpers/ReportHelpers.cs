using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Abyari.Model;
namespace Abyari.Helpers
{
    public class ReportHelpers
    {
        public List<sp_ReportTotalGroupByCompany_Result> ReportTotalGroupByCpmpany(string Condition,string FromDate)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                return en.sp_ReportTotalGroupByCompany(Condition,FromDate).ToList();
            }
        }
    }
}
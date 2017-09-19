using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WorkFlow.Logic;
namespace Abyari.WorkFlowHelpers
{
    public class WorkFlowSetPathHelpers
    {
        public static string ZriProjeActionPath(Step _step, int idzirproje,string Code,string IDPaymankar)
        {
            string path = string.Empty;
            string RetPath = string.Empty;
      
            switch (_step.EnName)
            {
                case "CreateZirProje":
                    path = "~/Zir_Project/ZirProject.aspx";
                    RetPath = Helpers.SetPathHelpers.SetSearchZirProjeReturnPath(path, idzirproje,Code,IDPaymankar);
                    break;
            }
            return RetPath;
        }
    }
}
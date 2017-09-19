using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WorkFlow.Logic;
using Abyari.Model;
namespace Abyari.WorkFlowHelpers
{
    public class WorkFlowEngineHelpers
    {
        public List<Model.ViewZirProje> SearchOnZirProje(string WhereParameter, int EntityTypeID)
        {

            WorkFlowSearchEngine _wfEngine = new WorkFlowSearchEngine();

            var data = _wfEngine.SearchByWorkflow<ViewZirProje>(EntityTypeID, WhereParameter, AccessManagementService.Access.AccessControl.LoggedInUser.UserRoles);
            return data;
        }
    }
}
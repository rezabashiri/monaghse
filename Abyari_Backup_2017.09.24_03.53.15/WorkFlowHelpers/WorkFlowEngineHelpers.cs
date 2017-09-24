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
        //private int UserID
        //{
        //    get
        //    {
        //        return SessionHelpers.GetUser().ID;
        //    }
        //}
        /// <summary>
        /// to get roles easilly from helper 
        /// </summary>
        //private string Roles
        //{
        //    get
        //    {
        //        return Helpers.SessionHelpers.GetRoles(HttpContext.Current.Session);
        //    }
        //}
        public List<Model.sp_ListOFPaymankarsProject_Result> SearchOnZirProje(string WhereParameter, int EntityTypeID)
        {

            WorkFlowSearchEngine _wfEngine = new WorkFlowSearchEngine();
            var data = _wfEngine.SearchByWorkflow<sp_ListOFPaymankarsProject_Result>(EntityTypeID, WhereParameter, AccessManagementService.Access.AccessControl.LoggedInUser.UserRoles, AccessManagementService.Access.AccessControl.LoggedInUser.ID);
            return data;
        }
        public Step Deserialze(string _step)
        {
            //we code current step to avoid potential dangerous
            Step CurrentStep;

            CurrentStep = new tkv.Utility.XmlHelper().DeserializeEntity<Step>(HttpContext.Current.Server.HtmlDecode(_step), new Step());//we should all time deserilized it because different steps

            return CurrentStep;
        }

        public bool CheckAccess(Step _step, global::AccessManagementService.Access.RightRelatedService _right)
        {

            if (_step != null)   //set access when search clicked
            {
                return _step._Access.Any(x => x._Action.Any(s => s._Right == _right));
            }

            return false;
        }
    }
}
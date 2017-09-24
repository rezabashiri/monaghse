using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abyari.WorkFlowHelpers
{
    public partial class WorkFlowDefinition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dictionary<string, string> _OrgRoles = new Dictionary<string, string>();
                Dictionary<string, string> _Roles = new Dictionary<string, string>();
                foreach (global::AccessManagementService.Model.OrganiztionRole orgrole in global::AccessManagementService.Model.OrganiztionRole.GetOrganizationRoles().ToList())
                {
                    _OrgRoles.Add(orgrole.OrganizationRoleName, orgrole.ID.ToString());
                }
                foreach (global::AccessManagementService.Model.Role role in global::AccessManagementService.Model.Role.GetRoles().ToList())
                {
                    _Roles.Add(role.RoleName, role.ID.ToString());
                }
                UscWfDefinition.SetBinding(_OrgRoles, _Roles);
                UscWfDefinition.OnError += UscWfDefinition_OnError;
            }
        }

        void UscWfDefinition_OnError(Exception ex)
        {
            throw new NotImplementedException();
        }
    }
}
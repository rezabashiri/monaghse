using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security;
using System.Security.Permissions;

namespace Abyari.Helpers
{
    public class ShowTable : System.Attribute
    {
        public enum ShowInMenu
        {
            BaseMenu,
            ZirProjeMenu,
            GharardadNezaratMenu,
            GharardadPaymanMenu,
            SherkatMohandesinMenu,
            GharardadSayerMenu,
            UsersMenu
        }
        public ShowInMenu WitchMenu
        {
            set;
            get;
        }
        public bool View = false;
        public ShowTable(ShowInMenu Menu)
        {
            WitchMenu = Menu;
        }
        public ShowTable()
        {
            WitchMenu = ShowInMenu.BaseMenu;
        }
    }
    public enum Format
    {
        Currency,
        Number,
        General,
        Percentage,
        Hexadecimal
    }
    [System.AttributeUsage(AttributeTargets.Property)]
    public class ColumnAggregateType : System.Attribute
    {
        public Telerik.Web.UI.GridAggregateFunction Function { set; get; }
        public string FooterText { set; get; }
        public string FooterFormatString { set; get; }
        public ColumnAggregateType(Telerik.Web.UI.GridAggregateFunction func, string Footertext, Format FooterFormat)
        {
            Function = func;
            FooterText = Footertext;
            switch (FooterFormat)
            {
                case Format.Currency:
                    FooterFormatString = "{0:C}";
                    break;
                case Format.General:
                    FooterFormatString = "{0:G}";
                    break;
                case Format.Hexadecimal:
                    FooterFormatString = "{0:X}";
                    break;
                case Format.Number:
                    FooterFormatString = "{0:N}";
                    break;
                case Format.Percentage:
                    FooterFormatString = "{0:P}";
                    break;
            }
        }
    }
    [System.AttributeUsage(AttributeTargets.Class)]
    public class DetailTableName : System.Attribute
    {
        public string TabeName { set; get; }
        public DetailTableName(string TableName)
        {
            this.TabeName = TableName;
        }
    }
    //[System.Serializable]
    
    //public sealed class EntityPermission : System.Security.Permissions.CodeAccessSecurityAttribute,IUnrestrictedPermission
    //{
    //    public string  EntityName;
    //    public AccessManagementService.RightRelatedService ServiceName;
    //    PrincipalPermission Permission;
    //    public EntityPermission(System.Security.Permissions.SecurityAction _Action )
    //        : base(_Action)
    //    {

    //    }
    //    public override bool IsDefaultAttribute()
    //    {
    //        return true;
    //    }
    //    public override System.Security.IPermission CreatePermission()
    //    {
    //        return new System.Security.Permissions.SecurityPermission(PermissionState.Unrestricted);
    //        return new PrincipalPermission(PermissionState.Unrestricted);
    //        if (AccessManagementService.Login.IsAuthenticated == false)
    //            return new PrincipalPermission(PermissionState.Unrestricted);
    //        bool IsValid =  AccessManagementService.AccessControl.IsValidAccessToEntity(EntityName,RightRelatedService.View);
    //        switch (IsValid)
    //        {
    //            case true:
    //                return new PrincipalPermission(PermissionState.None);
            
    //            default :
    //                return new PrincipalPermission(PermissionState.Unrestricted);
            
    //        }
    //    }

    //    public bool IsUnrestricted()
    //    {
    //        return false;
    //    }
    //}
    //public class Permission :System.Attribute
    //{
    //    private string entity;
    //    private RightRelatedService serivce;
    //    public Permission(string EntityName, RightRelatedService Service)
    //    {
    //        entity = EntityName;
    //        serivce = Service;
    //        bool IsValid = AccessManagementService.AccessControl.IsValidAccessToEntity(EntityName, RightRelatedService.View);
    //        HttpContext.Current.Response.Redirect("AccessDenied.aspx");
    //    }

    //}
     
}
﻿using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;

namespace DynamicWebApp
{
    public partial class Details : System.Web.UI.Page
    {
        protected MetaTable table;

        protected void Page_Init(object sender, EventArgs e)
        {
            table = DynamicDataRouteHandler.GetRequestMetaTable(Context);
            FormView1.SetMetaTable(table);
            DetailsDataSource.EntityTypeFilter = table.EntityType.Name;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Title = table.DisplayName;
            DetailsDataSource.Include = table.ForeignKeyColumnsNames;
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            Int64 ExternalExcetion = Abyari.Helpers.ExceptionHelper.HandelException(this.Page, e.Exception);
            switch (ExternalExcetion)
            {
                case 1:
                    e.ExceptionHandled = true;
                    break;
                case 0:
                    Response.Redirect(table.ListActionPath);
                    break;

            }

        }
    }

}

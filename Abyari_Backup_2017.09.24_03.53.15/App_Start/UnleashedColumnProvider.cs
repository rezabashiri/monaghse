using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.DynamicData.ModelProviders;
using System.ComponentModel;
namespace Abyari.AppStart
{
    public sealed class UnleashedColumnProvider:ColumnProvider
    {
        public UnleashedColumnProvider(UnleashedTableProvider table,PropertyDescriptor desciptor):base(table)
        {
            this.Name = desciptor.Name;
            this.ColumnType = desciptor.PropertyType;
            this.Nullable = this.ColumnType.IsValueType == false  || System.Nullable.GetUnderlyingType(this.ColumnType) != null;
            this.IsReadOnly = desciptor.IsReadOnly;
            this.IsCustomProperty = true;
        }
    }
}
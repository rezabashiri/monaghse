using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData.ModelProviders;
using System.Collections.ObjectModel;
using Microsoft.AspNet.DynamicData.ModelProviders;
namespace Abyari.AppStart
{
    public sealed class UnleashedModelProvider:DataModelProvider
    {
        private readonly EFDataModelProvider original;
        private readonly ReadOnlyCollection<TableProvider> tables;

        public UnleashedModelProvider(EFDataModelProvider original)
        {
            this.original = original;
            this.tables = original.Tables
              .Select(table => new UnleashedTableProvider(this, table))
              .Cast<TableProvider>().ToList().AsReadOnly();
        }

        public override Type ContextType
        {
            get { return this.original.ContextType; }
        }

        public override ReadOnlyCollection<TableProvider> Tables
        {
            get { return this.tables; }
        }

        public override object CreateContext()
        {
            return this.original.CreateContext();
        }
    }
}
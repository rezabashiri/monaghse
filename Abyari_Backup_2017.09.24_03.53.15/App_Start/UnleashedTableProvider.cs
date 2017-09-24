using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using System.Web.DynamicData.ModelProviders;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.Objects.DataClasses;
namespace Abyari.AppStart
{
    public sealed class UnleashedTableProvider:TableProvider
    {
        private readonly TableProvider original;
        private readonly ReadOnlyCollection<ColumnProvider> columns;
        public UnleashedTableProvider(UnleashedModelProvider model, TableProvider original)
            : base(model)
        {
            this.original = original;

            IEnumerable<PropertyDescriptor> customProperties = TypeDescriptor
              .GetProperties(original.EntityType).Cast<PropertyDescriptor>()
              .Where(p => p.PropertyType.IsSubclassOf(typeof(EntityReference)) == false) // filter out properties of EntityReference type, they are duplicates of regular navigation properties, i.e. SupplierReference is a duplicate of Supplier
              .Where(p => this.RootEntityType.IsAssignableFrom(p.ComponentType)) // filter out properties defined in the EntityObject
              .Where(p => original.Columns.All(c => c.Name != p.Name)); // filter out properties already recognized by the original provider

            this.columns = original.Columns
              .Concat(customProperties.Select(p => new UnleashedColumnProvider(this, p)))
              .ToList().AsReadOnly();
        }

        public override AttributeCollection Attributes
        {
            get { return this.original.Attributes; }
        }

        public override ReadOnlyCollection<ColumnProvider> Columns
        {
            get { return this.columns; }
        }

        public override string DataContextPropertyName
        {
            get { return this.original.DataContextPropertyName; }
        }

        public override Type EntityType
        {
            get { return this.original.EntityType; }
        }

        public override string Name
        {
            get { return this.original.Name; }
        }

        public override Type ParentEntityType
        {
            get { return this.original.ParentEntityType; }
        }

        public override Type RootEntityType
        {
            get { return this.original.RootEntityType; }
        }

        public override bool CanDelete(IPrincipal principal)
        {
            return this.original.CanDelete(principal);
        }

        public override bool CanInsert(IPrincipal principal)
        {
            return this.original.CanInsert(principal);
        }

        public override bool CanRead(IPrincipal principal)
        {
            return this.original.CanRead(principal);
        }

        public override bool CanUpdate(IPrincipal principal)
        {
            return this.original.CanUpdate(principal);
        }

        public override object EvaluateForeignKey(object row, string foreignKeyName)
        {
            return this.original.EvaluateForeignKey(row, foreignKeyName);
        }

        public override IQueryable GetQuery(object context)
        {
            return this.original.GetQuery(context);
        }

        public override ICustomTypeDescriptor GetTypeDescriptor()
        {
            return this.original.GetTypeDescriptor();
        }
    }
}
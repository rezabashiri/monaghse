using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.DynamicData;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Core.Objects.DataClasses;
using System.Data.Entity.Core.Objects;
using System.Web.DynamicData.ModelProviders;
namespace Abyari.AppStart
{
    public class DynamicDataConfig 
    {
        static MetaModel _DefualtModel = new MetaModel();
      public static MetaModel DefualtModel
      {
          get
          {
              return _DefualtModel ?? new MetaModel();
          }
      }
        public static void RegisterEntityModel()
        {
            //var model = new MetaModel(false);
          //  model.RegisterContext(() => new Model.MPOEntities(), new ContextConfiguration() { ScaffoldAllTables = true });
            //DataModelProvider provider = model.Tables[0].Provider.DataModel;
            //_DefualtModel.RegisterContext(new UnleashedModelProvider(provider), new ContextConfiguration() { ScaffoldAllTables = true });
            _DefualtModel.RegisterContext(
      new UnleashedModelProvider(new Microsoft.AspNet.DynamicData.ModelProviders.EFDataModelProvider(() => new Model.AbyariEntities())),
     new ContextConfiguration { ScaffoldAllTables = true });
        }
        public static string GetContextName
        {
            get
            {
                return "Modiriat_Gharardadha.Model.MPOEntities";
            }
        }
        public static ObjectContext GetObjectContext
        {
            get
            {

                Model.AbyariEntities aby = new Model.AbyariEntities();
                return ((System.Data.Entity.Infrastructure.IObjectContextAdapter)aby).ObjectContext;
            }
        }
        public static MetaTable GetMetaTable(string tablename)
        {
            return _DefualtModel.GetTable(tablename);
        }
        public static MetaTable GetMetaTable(Type entitytype)
        {
            return _DefualtModel.GetTable(entitytype);
        }
    }
}
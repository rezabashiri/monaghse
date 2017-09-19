using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Abyari.Model
{
    [ScaffoldTable(false)]
    public partial class Config
    {

        public void AddUpdate(Config entity)
        {
             
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                en.sp_AddUpdateConfig(entity.ID, entity.Scoring);
            }
        }
        public Config GetConfiguration()
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                return en.Configs.AsNoTracking().FirstOrDefault();
            }
        }
        public void AddUpdate( )
        {
            AddUpdate(this);
        }
    }
   
}
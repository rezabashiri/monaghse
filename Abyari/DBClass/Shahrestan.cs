using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Abyari.Model
{
    [MetadataType(typeof(MetaData))]
    [System.ComponentModel.DisplayName("شهرستان")]
    public partial class Shahrestan
    {
        private class MetaData
        {
            public int ID { get; set; }
            public Nullable<int> CodeOstan { get; set; }
            public string Sharh { get; set; }
            public string TelePhone { get; set; }
            public string Addres { get; set; }
            public string Fax { get; set; }
            public Nullable<System.DateTime> DateUpdate { get; set; }
            public Nullable<System.Guid> UserID { get; set; }
        }
        public List<Shahrestan> GetData()
        {
            using (var en = new Model.AbyariEntities())
            {
                return en.Shahrestans.ToList();
            }
        }
    }
}
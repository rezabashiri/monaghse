using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
namespace Abyari.Model
{
    [System.ComponentModel.DisplayName("رشته")]
    [MetadataType(typeof(MetaData))]
    public partial class Reshte
    {
        private class MetaData
        {
            public int ID { get; set; }
            [Display(Name="نام رشته")]
            public string Sharh { get; set; }
          
         
        }
        public List<Reshte> GetAllReshte(string[] includes)
        {
            using (var myen=new AbyariEntities())
            {
                var reshte = myen.Reshtes.AsQueryable();
                if (includes != null)
                {
                    foreach (string inc in includes)
                    {
                        reshte = reshte.Include(inc);

                    }

                }
                return reshte.ToList<Reshte>();
            }
        }
 
    }
}
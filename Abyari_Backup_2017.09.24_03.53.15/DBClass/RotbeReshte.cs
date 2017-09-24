using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Abyari.Model
{
    [MetadataType(typeof(MetaData))]
    [System.ComponentModel.DisplayName("رتبه هر پیمانکار")]
    [DisplayColumn("Rotbe")]
    public partial class RotbeReshte
    {
        private class MetaData
        {
            [Display(Name = "رتبه")]
            public Nullable<int> Rotbe { get; set; }
            [Display(Name = "تعداد کار مجاز")]

            public Nullable<int> TedadKarMojaz { get; set; }
            [Display(Name = "سطح مجاز")]
            public Nullable<long> SatheMojaz { get; set; }
            [Display(Name = "فعال")]

            public Nullable<bool> Faal { get; set; }
            
            [Display(Name="رشته")]
            public virtual Reshte Reshte { get; set; }
            [Display(AutoGenerateField=false)]
            public virtual ICollection<PaymankarReshte> PaymankarReshtes { get; set; }

        }
    }
}
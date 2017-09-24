using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Abyari.Model
{
    [System.ComponentModel.DisplayName("رشته پیمانکاران")]
    [MetadataType(typeof(MetaData))]
    public partial class PaymankarReshte
    {
        private class MetaData
        {
            public int IDPaymankar { get; set; }
            public int IDReshte { get; set; }
            [UIHint("PersianDate")]
            [Display(Name="تاریخ صدور مجوز")]
            public Nullable<System.DateTime> TarikhSodorMojavez { get; set; }
            [UIHint("PersianDate")]
            [Display(Name="تاریخ اعتبار مجوز")]
            public Nullable<System.DateTime> TarikhEtebarMojavez { get; set; }
            [Display(Name="شماره مجوز")]
            public string ShomareMojavez { get; set; }
            [Display(Name="فعال")]
            public Nullable<bool> Faal { get; set; }
            
            public virtual Paymankar Paymankar { get; set; }

            public virtual RotbeReshte RotbeReshte { get; set; }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Abyari.Model
{
    [MetadataType(typeof(MetaData))]
    [ScaffoldTable(false)]
    public partial class ViewPaymankarReshte
    {
        private class MetaData
        {
            [Display(AutoGenerateField=false)]
            public int IDPaymankar { get; set; }
            [Display(AutoGenerateField = false)]
            public int IDReshte { get; set; }
            [Display(Name="تاریخ صدور مجوز")]
            [UIHint("PersianDate")]
            public Nullable<System.DateTime> TarikhSodorMojavez { get; set; }
            [UIHint("PersianDate")]
            [Display(Name="تاریخ اعتبار مجوز")]
            public Nullable<System.DateTime> TarikhEtebarMojavez { get; set; }
            [Display(Name="شماره مجوز")]
            public string ShomareMojavez { get; set; }
            [Display(AutoGenerateField = false)]

            public Nullable<bool> Faal { get; set; }
            [Display(Name="رشته")]
            public string NameReshte { get; set; }
            [Display(Name="رتبه")]
            public Nullable<int> Rotbe { get; set; }
            [Display(Name="تعداد کار مجاز")]
            public Nullable<int> TedadKarMojaz { get; set; }
            [Display(Name="سطح مجاز")]
            public Nullable<long> SatheMojaz { get; set; }
            [Display(AutoGenerateField = false)]
            public Nullable<bool> ReshteFaal { get; set; }
            [Display(Name="نام پیمانکار",Order=0)]
            public string NamePaymankar { get; set; }
            [Display(Name = "کد اقتصادی", Order = 1)]

            public string CodeEghtesadi { get; set; }
            [Display(Name = "شناسه ملی", Order = 2)]

            public string ShenaseMeli { get; set; }
        }
    }
}
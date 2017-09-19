using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
namespace Abyari.Model
{
    [System.ComponentModel.DisplayName("شرکتهای طراح")]
    [MetadataType(typeof(MetaData))]
    public partial class Sherkat
    {
        private class MetaData
        {

            [Display(AutoGenerateField = false)]
            public int ID { get; set; }

            [Display(AutoGenerateField = false)]
            public Nullable<int> IDRotbe { get; set; }

            [Required(ErrorMessage = "نام را وارد نمایید")]
            [Display(Name = "نام", Order = 1)]
            public string Name { get; set; }

            [Required(ErrorMessage = "کد اقتصادی را وارد نمایید")]
            [Display(Name = "کد اقتصادی/سریال شناسنامه", Order = 2)]
            public string CodeEghtesadi { get; set; }

            [Required(ErrorMessage = "شماره ثبت را وارد نمایید")]
            [Display(Name = "شماره ثبت/شماره شناسنامه ", Order = 3)]
            public string ShomareSabt { get; set; }

            [Required(ErrorMessage = "شناسه ملی را وارد نمایید")]
            [Display(Name = "شناسه ملی /کد ملی", Order = 4)]
            public string ShenaseMeli { get; set; }

            [Display(Name = "حقیقی است", Order = 0)]
            public Nullable<bool> Haghighi { get; set; }

            [Display(Name = "در لیست سیاه است")]
            public Nullable<bool> ListSiah { get; set; }

            [Display(Name = "نام کامل")]
            public string NameKamel { get; set; }

            [Display(Name = "نمابر")]
            public string Fax { get; set; }

            [Display(Name = "تلفن")]
            public string Tel { get; set; }

            [Display(Name = "پست الکترونیکی")]

            public string EMail { get; set; }

            [Display(Name = "نام مدیر")]
            public string Modir { get; set; }

            [Display(Name = "تلفن مدیر")]
            public string TelMOdir { get; set; }

            [Display(Name = "فعال")]
            public Nullable<bool> Faal { get; set; }


            [Display(Name = "آدرس")]
            [UIHint("LongText")]
            public string Addres { get; set; }

            [UIHint("PersianDate")]
            [Display(Name = "تاریخ شروع مجوز")]
            public Nullable<System.DateTime> TarikhSodorMojavez { get; set; }

            [Display(Name = "مدت اعتبار مجوز")]
            public Nullable<int> modateEtebarMojavez { get; set; }

            [Display(Name = "شماره مجوز")]
            public string ShomareMojavez { get; set; }

            [Display(Name = "محل ثبت")]
            public string MahalSabt { get; set; }

            [Display(AutoGenerateField = false)]
            public Nullable<System.DateTime> DateUpdate { get; set; }
        }
        public List<Sherkat> GetAllSherkats(string[] includes)
        {
            using (var myen =new AbyariEntities())
            {
                IQueryable<Sherkat> _sherkats = myen.Sherkats.AsQueryable();
                if (includes != null)
                {
                    foreach (string inc in includes)
                    {
                        _sherkats = _sherkats.Include(inc);
                    }
                }
                return _sherkats.ToList();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using tkv.Utility;
namespace Abyari.Model
{
    [System.ComponentModel.DisplayName("تحویل موقت زیر پروژه")]
    [MetadataType(typeof(MetaData))]
    public partial class ZirProjeTahvilMovaghat
    {
        private class MetaData
        {
            public int IDZirProje { get; set; }
            [Display(Name="تاریخ تحویل")]
            [UIHint("PersianDate")]
            public Nullable<System.DateTime> TarikhTahvil { get; set; }
            [Display(Name="نام بهره برداران")]
            public string NameBahreBardaran { get; set; }
            [Display(Name="نام زیرپروژه")]
            public virtual ZirProje ZirProje { get; set; }
        }
        public int DeliveryProje(int IDZirproje)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                return en.sp_DeliveryProje(IDZirproje).ToInt32();
            }
        }
    }
}
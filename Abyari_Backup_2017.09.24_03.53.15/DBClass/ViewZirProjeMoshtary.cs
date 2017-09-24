using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Abyari.Model
{

    [MetadataType(typeof(MetaData))]
    [ScaffoldTable(false)]
    public partial class ViewZirProjeMoshtary
    {
        private class MetaData
        {
            [Display(Name="نام پروژه",Order=0)]
            public string Name { get; set; }
            [Display(AutoGenerateField=false)]

            public int ID { get; set; }
            [Display(Name = "سطح")]

            public Nullable<double> Sath { get; set; }
            [Display(Name = "تعداد دستگاه ۀبیاری")]
            public Nullable<int> TedadDastgahAbyari { get; set; }
            [Display(Name="نوع پمپ")]

            public string NoePomp { get; set; }
            [Display(Name="دبی")]
            public Nullable<long> Debi { get; set; }
            [Display(Name="منبع تامین آب")]
            public string ManbaeTaminAb { get; set; }
            [Display(Name="کد پیمانکار")]
            public Nullable<int> IDPaymankar { get; set; }
            [Display(AutoGenerateField=false)]
            public Nullable<int> IDSherkatTarah { get; set; }
            [Display(AutoGenerateField=false)]
            public Nullable<int> IDRoosta { get; set; }
            [Display(AutoGenerateField=false)]
            public Nullable<int> IDNoe { get; set; }
            [Display(Name="کدملی مشتری")]
            public string CodeMeliMoshtary { get; set; }
            [Display(Name="سهم دولت")]
            public Nullable<double> SahmeDolat { get; set; }
            [Display(Name="سهم بانک")]
            public Nullable<double> SahmeBank { get; set; }
            [Display(Name="سهم متقاضی")]
            public Nullable<double> SahmeMotaghazi { get; set; }
            [Display(Name="کد پروژه",Order=1)]
            public string Code { get; set; }
            [Display(Name="نام خانوادگی متقاضی")]
            public string Famil { get; set; }
            [Display(Name="موبایل متقاضی")]
            public string Mobile { get; set; }
            [Display(Name="نام متقاضی")]
            public string NameMoshtary { get; set; }

        }
    }
}
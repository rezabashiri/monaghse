using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Abyari.Model
{
    [ScaffoldTable(false)]
    [MetadataType(typeof(MetaData))]
    public partial class ViewZirProje
    {
        private class MetaData
        {
            [Display(AutoGenerateField = false)]
            public long RowNumber { get; set; }
            [Display(AutoGenerateField=false)]
            public int ID { get; set; }
            [Display(Name="نام پروژه")]
            public string Name { get; set; }
            [Display(Name="سطح")]
            public Nullable<double> Sath { get; set; }
 
            [Display(Name="تعداد دستگاه آبیاری")]
            public Nullable<int> TedadDastgahAbyari { get; set; }
            [Display(Name="نوع پمپ")]
            public string NoePomp { get; set; }
            [Display(Name="دبی")]
            public Nullable<long> Debi { get; set; }
            [Display(Name="منابع تامین آب")]
            public string ManbaeTaminAb { get; set; }
            [Display(AutoGenerateField = false)]
            public Nullable<int> IDPaymankar { get; set; }
            [Display(AutoGenerateField = false)]
            public Nullable<int> IDSherkatTarah { get; set; }
            [Display(AutoGenerateField = false)]
            public Nullable<int> IDRoosta { get; set; }
            [Display(AutoGenerateField = false)]
            public Nullable<int> IDNoe { get; set; }
           [Display(Name = "نوع پروژه")]
            public string NoeProje { get; set; }
            [Display(AutoGenerateField = false)]

            public Nullable<int> MeghdareEstesnaSath { get; set; }
            [Display(AutoGenerateField = false)]

            public Nullable<double> ZaribSath { get; set; }
            [Display(Name="رشته مربوطه")]
            public string Sharh { get; set; }
            [Display(AutoGenerateField = false)]
            public Nullable<int> IDReshte { get; set; }
            [Display(Name="تاریخ قرارداد")]
            [ScaffoldColumn(false)]
            [UIHint("PersianDate")]
            public Nullable<System.DateTime> ContractDate { get; set; }
            [Display(Name = "کدپروژه",Order=0)]

            public string Code { get; set; }
            [Display(Name = "کدملی مشتری")]

            public string CodeMeliMoshtary { get; set; }
            [Display(Name = "تحویل")]

            public Nullable<bool> Tahvil { get; set; }
            [ScaffoldColumn(false)]

            public Nullable<int> UserId { get; set; }
            [ScaffoldColumn(false)]

            public Nullable<int> RoleId { get; set; }
            [ScaffoldColumn(false)]

            public Nullable<int> WfExecutingID { get; set; }
        }
        public List<Model.sp_ListOFPaymankarsProject_Result>  SelectPaymankarsProject(string Condition)
        {
            var user = Helpers.SessionHelpers.GetUser(); 
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                return en.sp_ListOFPaymankarsProject(user.ID ,Condition).ToList();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Abyari.Model
{
    [MetadataType(typeof(MetaData))]
    [System.ComponentModel.DisplayName("نوع پروژه")]
    public partial class NoeProje
    {
        private class MetaData
        {
            [Display(Name="نوع پروژه")]
            public string Sharh { get; set; }
            [Display(Name="مقدار مجاز استثنا (تعداد نامحدود پروژه)")]
            public Nullable<int> MeghdareEstesnaSath { get; set; }

            [Display(AutoGenerateField=false)]
            public virtual Reshte Reshte { get; set; }
            [Display(AutoGenerateField=false)]
            public virtual ICollection<ZirProje> ZirProjes { get; set; }
        }
        public List<NoeProje> GetNoe()
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                return en.NoeProjes.ToList();
            }
        }
    }
}
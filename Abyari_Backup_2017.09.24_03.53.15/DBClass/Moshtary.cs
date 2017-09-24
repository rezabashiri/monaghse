using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
namespace Abyari.Model
{
    [MetadataType(typeof(MetaData))]
    [System.ComponentModel.DisplayName("نماینده بهره برداران")]
    [Helpers.ShowTable(View = true)]
    [DisplayColumn("FullName", "FullName")]
    [Serializable]
    public partial class Moshtary
    {
     
        private class MetaData
        {

            [Display(Name = "کد ملی")]
            [Required(ErrorMessage = "کد ملی را وارد نمایید")]

            public string CodeMelli { get; set; }
            [Display(Name = "نام")]
            [Required(ErrorMessage = "نام نماینده را وارد نمایید")]

            public string Name { get; set; }
            [Display(Name = "نام خانوادگی")]
            [Required(ErrorMessage = "نام خانوادگی نماینده را وارد نمایید")]

            public string Famil { get; set; }

            [Display(Name = "پست الکترونیکی")]

            public string EMail { get; set; }
            [Display(Name = "تلفن")]

            public string telephon { get; set; }
            [Display(Name = "موبایل")]

            public string Mobile { get; set; }
            [Display(Name = "آدرس")]

            public string Address { get; set; }

           
        }
        [Display(Name = "نام و نام خانوادگی")]

        public string FullName
        {
            get
            {
                return string.Format("{0} {1}", this.Name, this.Famil);
            }
        }
        public override string ToString()
        {
            return this.FullName;
        }
        public static Moshtary GetMoshtariById(  object moshtaryCodeMelli)
        {
            if (moshtaryCodeMelli == null)
                return new Moshtary();
            var myen = Helpers.ContextHelpers.GetContext();
            return myen.Moshtaries.Where(x => x.CodeMelli == moshtaryCodeMelli.ToString()).FirstOrDefault() ?? new Moshtary();
        }
        public static IQueryable<Moshtary> GetMoshtaries(string[] includes)
        {
            var context = Helpers.ContextHelpers.GetContext( );
            var _moshtari = context.Moshtaries.AsQueryable<Moshtary>();
            if (includes != null)
            {
                foreach (string inc in includes)
                {
                    _moshtari = _moshtari.Include(inc);
                }
            }
            return _moshtari;
        }
        public Moshtary GetMoshtary(string codemelli)
        {
            using (var context = Helpers.ContextHelpers.GetContext( ))
            {
                return context.Moshtaries.FirstOrDefault(x => x.CodeMelli == codemelli);
            }

        }
    }
}
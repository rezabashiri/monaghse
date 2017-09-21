using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using WebUtility;
namespace Abyari.Model
{
    [Serializable]
    public partial class sp_ListOFPaymankarsProject_Result :WorkFlow.InterFaces.ISearchTable
    {
        private class MetaData
        {
            [Display(AutoGenerateField=false)]
            public Nullable<long> RowNumber { get; set; }
            public Nullable<int> ID { get; set; }
            [Display(Name="نام طرح",Order=1)]
            public string Name { get; set; }
            [Display(Name="سطح",Order=2)]
            [WebUtility.Helpers.ColumnAggregateType(Telerik.Web.UI.GridAggregateFunction.Sum,"مجموع سطوح",WebUtility.Helpers.Format.Number)]
            public Nullable<double> Sath { get; set; }
            [Display(Name="تعداد دستگاه آبیاری")]
            public Nullable<int> TedadDastgahAbyari { get; set; }
            [Display(Name = "نوع پمپ")]
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
            [Display(Name="نوع پروژه")]
            public string NoeProje { get; set; }
            [Display(Name="مقدار استثنای سطح",Order=3)]
            public Nullable<int> MeghdareEstesnaSath { get; set; }
            public Nullable<double> ZaribSath { get; set; }
            public string Sharh { get; set; }
            public Nullable<int> IDReshte { get; set; }
            public Nullable<System.DateTime> ContractDate { get; set; }
            [Display(Name="کدطرح",Order=0)]
            public string Code { get; set; }
            [Display(Name="کدملی مشتری")]
            public string CodeMeliMoshtary { get; set; }
            [Display(AutoGenerateField = false)]

            public Nullable<bool> Tahvil { get; set; }
            [Display(AutoGenerateField = false)]

            public Nullable<int> UserId { get; set; }
            [Display(AutoGenerateField = false)]

            public Nullable<int> RoleId { get; set; }
            [Display(AutoGenerateField = false)]

            public Nullable<int> WfExecutingID { get; set; }
            [Display(AutoGenerateField = false)]

            public Nullable<bool> Reserved { get; set; }
        }



        public string StepAccess
        {
            get;
            set;
        }

        public WorkFlow.Logic.Step StepEntity
        {
            get
            {
                return new tkv.Utility.XmlHelper().DeserializeEntity<WorkFlow.Logic.Step>(StepAccess, new WorkFlow.Logic.Step());
            }
            set
            {

            }
        }

        public string StepName
        {
            get;
            set;
        }
    }
}
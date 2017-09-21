using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Abyari.Model
{
    public class Import
    {
            [Display(Name = "ردیف")]
            public int ID { get; set; }
            [Display(Name = "نام شرکت")]
            public string CompanyName { get; set; }
            [Display(Name = "شهر")]
            public string City { get; set; }
            [Display(Name = "نام کشاورز")]
            public string FarmerName { get; set; }
            [Display(Name = "تاریخ قرارداد")]
            public Nullable<System.DateTime> ContractDate { get; set; }
            [Display(Name = "تاریخ ورود به دفتر انجمن")]
            public Nullable<System.DateTime> EntryDate { get; set; }
            [Display(Name = "موضعی")]
            public int Mozeie { get; set; }
            [Display(Name = "بارانی")]
            public int barani { get; set; }
            [Display(Name = "کم فشار")]
            public int kamfeshar { get; set; }
            [Display(Name = "بارانی تیپ")]
            public int baraniTip { get; set; }
            [Display(Name = "کم فشار تیپ")]
            public int kamFesharTip { get; set; }
            [Display(Name = "سطح پروژه")]
            public int ProjeLevel { get; set; }
            [Display(Name = "قابل پرداخت")]
            public long PaymentAll { get; set; }
            [Display(Name = "نقدی")]
            public long PaymentCash { get; set; }
            [Display(Name = "چک")]
            public long PaymentCheck { get; set; }
            [Display(Name = "مایه التفاوت")]
            public long PaymentDifferent { get; set; }
            [Display(Name = "رتبه")]
            public int Rating { get; set; }
            [Display(Name = "عقد قرارداد")]
            public bool Contract { get; set; }
            [Display(Name = "صورت جلسه تحویل موقت")]
            public int TemporaryDeliveryMinutes { get; set; }
            [Display(Name = "کسر ظرفیت")]
            public int CapacityDeduction { get; set; }
            [Display(Name = "ظرفیت باقی مانده")]
            public int RemainingCapacity { get; set; }
         
    }
}
//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Abyari.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Sherkat
    {
        public Sherkat()
        {
            this.ZirProjes = new HashSet<ZirProje>();
        }
    
        public int ID { get; set; }
        public Nullable<int> IDRotbe { get; set; }
        public string Name { get; set; }
        public string CodeEghtesadi { get; set; }
        public string ShomareSabt { get; set; }
        public string ShenaseMeli { get; set; }
        public Nullable<bool> Haghighi { get; set; }
        public Nullable<bool> ListSiah { get; set; }
        public string NameKamel { get; set; }
        public string Fax { get; set; }
        public string Tel { get; set; }
        public string EMail { get; set; }
        public string Modir { get; set; }
        public string TelMOdir { get; set; }
        public Nullable<bool> Faal { get; set; }
        public string Addres { get; set; }
        public Nullable<System.DateTime> TarikhSodorMojavez { get; set; }
        public Nullable<int> modateEtebarMojavez { get; set; }
        public string ShomareMojavez { get; set; }
        public string MahalSabt { get; set; }
        public Nullable<System.DateTime> DateUpdate { get; set; }
        public Nullable<System.Guid> UserID { get; set; }
    
        public virtual ICollection<ZirProje> ZirProjes { get; set; }
    }
}

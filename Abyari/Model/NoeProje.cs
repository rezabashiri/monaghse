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
    
    public partial class NoeProje
    {
        public NoeProje()
        {
            this.ZirProjes = new HashSet<ZirProje>();
        }
    
        public int ID { get; set; }
        public string Sharh { get; set; }
        public Nullable<int> MeghdareEstesnaSath { get; set; }
        public Nullable<double> ZaribSath { get; set; }
        public Nullable<int> IDReshte { get; set; }
    
        public virtual Reshte Reshte { get; set; }
        public virtual ICollection<ZirProje> ZirProjes { get; set; }
    }
}

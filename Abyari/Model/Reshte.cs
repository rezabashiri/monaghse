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
    
    public partial class Reshte
    {
        public Reshte()
        {
            this.NoeProjes = new HashSet<NoeProje>();
            this.RotbeReshtes = new HashSet<RotbeReshte>();
        }
    
        public int ID { get; set; }
        public string Sharh { get; set; }
    
        public virtual ICollection<NoeProje> NoeProjes { get; set; }
        public virtual ICollection<RotbeReshte> RotbeReshtes { get; set; }
    }
}
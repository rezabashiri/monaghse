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
    
    public partial class Moshtary
    {
        public Moshtary()
        {
            this.ZirProjes = new HashSet<ZirProje>();
        }
    
        public string CodeMelli { get; set; }
        public string Name { get; set; }
        public string Famil { get; set; }
        public string EMail { get; set; }
        public string telephon { get; set; }
        public string Mobile { get; set; }
        public string Address { get; set; }
    
        public virtual ICollection<ZirProje> ZirProjes { get; set; }
    }
}
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
    
    public partial class ZirProjeReservation
    {
        public int IDPaymankar { get; set; }
        public int IDZirProje { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<bool> Tavafogh { get; set; }
    
        public virtual Paymankar Paymankar { get; set; }
        public virtual ZirProje ZirProje { get; set; }
    }
}

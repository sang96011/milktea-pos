//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLiQuanCaPhe.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class LichLamViec
    {
        public int MANV { get; set; }
        public string THU { get; set; }
        public int MACALV { get; set; }
        public Nullable<double> PHUCAP { get; set; }
        public Nullable<int> ISDEL { get; set; }
        public Nullable<System.DateTime> CREADTEDAT { get; set; }
        public Nullable<System.DateTime> UPDATEDAT { get; set; }
    
        public virtual CaLamViec CaLamViec { get; set; }
        public virtual NhanVien NhanVien { get; set; }
    }
}

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

    public partial class ChiTietDonhang
    {
        public string MADH { get; set; }
        public string MAMON { get; set; }
        public Double SOLUONG { get; set; }
        public Double DONGIA { get; set; }
        public Double THANHTIEN { get; set; }
        public Double GIAMGIA { get; set; }
        public int ISDEL { get; set; }
        public Nullable<System.DateTime> CREADTEDAT { get; set; }
        public Nullable<System.DateTime> UPDATEDAT { get; set; }

        public virtual DonHang DonHang { get; set; }
        public virtual MonAn MonAn { get; set; }
    }
}

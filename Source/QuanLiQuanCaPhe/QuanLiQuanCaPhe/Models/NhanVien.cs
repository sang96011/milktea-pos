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
    
    public partial class NhanVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NhanVien()
        {
            this.DonHangs = new HashSet<DonHang>();
            this.LichLamViecs = new HashSet<LichLamViec>();
        }
    
        public string MANV { get; set; }
        public string HOTEN { get; set; }
        public Nullable<double> LUONG { get; set; }
        public Nullable<System.DateTime> NGSINH { get; set; }
        public string PHAI { get; set; }
        public string CMND { get; set; }
        public string DIACHI { get; set; }
        public string DIENTHOAI { get; set; }
        public string CHUCVU { get; set; }
        public byte[] HINHANH { get; set; }
        public string TAIKHOAN { get; set; }
        public string MATKHAU { get; set; }
        public Nullable<int> ISDEL { get; set; }
        public Nullable<System.DateTime> CREADTEDAT { get; set; }
        public Nullable<System.DateTime> UPDATEDAT { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DonHang> DonHangs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichLamViec> LichLamViecs { get; set; }
    }
}

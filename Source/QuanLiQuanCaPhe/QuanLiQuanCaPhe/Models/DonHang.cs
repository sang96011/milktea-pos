
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
    using QuanLiQuanCaPhe.ViewModel;
    using System;
    using System.Collections.Generic;

    public partial class DonHang : BaseViewModel
    {

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public DonHang()
    {

        this.ChiTietDonhangs = new HashSet<ChiTietDonhang>();

    }

        private string _MADH;
    public string MADH { get=>_MADH; set {
                _MADH = value; OnPropertyChanged();
            } }

        private string _MANV;
    public string MANV { get=>_MANV; set {
                _MANV = value; OnPropertyChanged();
            } }

        private Nullable<System.DateTime> _THOIGIAN;
    public Nullable<System.DateTime> THOIGIAN { get=> _THOIGIAN; set {
                _THOIGIAN = value;OnPropertyChanged();
            } }

        private Nullable<double> _TONGTIEN;
    public Nullable<double> TONGTIEN { get=> _TONGTIEN; set {
                _TONGTIEN = value;OnPropertyChanged();
            } }

        private string _TENKH;
    public string TENKH { get=> _TENKH; set {
                _TENKH = value;OnPropertyChanged();
            } }

        private Nullable<int> _ISDEL;
    public Nullable<int> ISDEL { get=> _ISDEL; set {
                _ISDEL = value;OnPropertyChanged();
            } }

        private Nullable<System.DateTime> _CREADTEDAT;
    public Nullable<System.DateTime> CREADTEDAT { get=> _CREADTEDAT; set {
                _CREADTEDAT = value;OnPropertyChanged();
            } }

        private Nullable<System.DateTime> _UPDATEDAT;
    public Nullable<System.DateTime> UPDATEDAT { get=> _UPDATEDAT; set {
                _UPDATEDAT = value;OnPropertyChanged();
            } }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<ChiTietDonhang> ChiTietDonhangs { get; set; }

    public virtual NhanVien NhanVien { get; set; }

}

}


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
    
public partial class MonAn
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public MonAn()
    {

        this.ChiTietDonhangs = new HashSet<ChiTietDonhang>();

    }


    public string MAMON { get; set; }

    public string TENMON { get; set; }

    public double GIA { get; set; }

    public string MOTA { get; set; }

    public string MALOAI { get; set; }

    public byte[] HINHANH { get; set; }

    public string TTSP { get; set; }

    public Nullable<int> ISDEL { get; set; }

    public Nullable<System.DateTime> CREADTEDAT { get; set; }

    public Nullable<System.DateTime> UPDATEDAT { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<ChiTietDonhang> ChiTietDonhangs { get; set; }

    public virtual LoaiMonAn LoaiMonAn { get; set; }

}

}

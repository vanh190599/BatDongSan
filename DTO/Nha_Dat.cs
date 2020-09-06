using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Nha_Dat
    {
        public int Id { get; set; }
        public string Image1 { get; set; }
        public string Image2 { get; set; }
        public string Image3 { get; set; }
        public string DanhMuc_Id { get; set; }
        public string TieuDe { get; set; }
        public string Gia { get; set; }
        public string DienTich { get; set; }
        public string MoTa { get; set; }
        public string ChiTiet { get; set; }
        public string DiaChi { get; set; }
        public string LienHe { get; set; }
        public int LuotXem { get; set; }
        public Boolean status { get; set; }
        public DateTime created_at { get; set; }

    }
}

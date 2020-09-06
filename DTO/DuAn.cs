using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DuAn
    {
        public string id { get; set; }
        public string TenDuAn { get; set; }
        public string Anh { get; set; }
        public string DanhMucDuAn_Id { get; set; }
        public string MoTa { get; set; }
        public string DiaChi { get; set; }
        public string Gia { get; set; }
        public string ChuDauTu { get; set; }
        public string DienTich { get; set; }
        public string TienDo { get; set; }

        public Boolean status { get; set; }
        public DateTime created_at { get; set; }
    }
}

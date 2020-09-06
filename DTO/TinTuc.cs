using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TinTuc
    {
        private int luotXem;
        private string nguoiDang;
        private bool status;
        private string created_at;
        private int id;
        private int danhMucTinTuc_Id;
        private string anh;
        private string moTa;
        private string chiTiet;
        private string tenTinTuc;

        public int Id { get => id; set => id = value; }
        public int DanhMucTinTuc_Id { get => danhMucTinTuc_Id; set => danhMucTinTuc_Id = value; }
        public int LuotXem { get => luotXem; set => luotXem = value; }
        public string Anh { get => anh; set => anh = value; }
        public string MoTa { get => moTa; set => moTa = value; }
        public string TenTinTuc { get => tenTinTuc; set => tenTinTuc = value; }
        public string ChiTiet { get => chiTiet; set => chiTiet = value; }
        public string NguoiDang { get => nguoiDang; set => nguoiDang = value; }
        public bool Status { get => status; set => status = value; }
        public string Created_at { get => created_at; set => created_at = value; }
    }
}

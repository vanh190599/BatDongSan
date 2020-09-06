using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class NoiNgoaiThat
    {
        public int Id, DanhMucNoiNgoaiThat_Id;
        public string TenNoiNgoaiThat, Anh, MoTa, ChiTiet;
        public bool status;
        public DateTime created_at;

        public int Id1 { get => Id; set => Id = value; }
        public int DanhMucNoiNgoaiThat_Id1 { get => DanhMucNoiNgoaiThat_Id; set => DanhMucNoiNgoaiThat_Id = value; }
        public string TenNoiNgoaiThat1 { get => TenNoiNgoaiThat; set => TenNoiNgoaiThat = value; }
        public string Anh1 { get => Anh; set => Anh = value; }
        public string MoTa1 { get => MoTa; set => MoTa = value; }
        public string ChiTiet1 { get => ChiTiet; set => ChiTiet = value; }
        public bool Status { get => status; set => status = value; }
        public DateTime Created_at { get => created_at; set => created_at = value; }
    }
}

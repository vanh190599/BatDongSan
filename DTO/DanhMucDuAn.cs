using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DanhMucDuAn
    {
        public string id { get; set; }
        public string TenDanhMuc { get; set; }
        public string MoTa { get; set; }
        public Boolean status { get; set; }
        public DateTime created_at { get; set; }
    }
}

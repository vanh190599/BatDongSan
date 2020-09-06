using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DTO;
using System.Data;
using DAL;

namespace BUS.FRONTEND.DuAn
{
    public class DuAn_View
    {
        ConnectionAccess obj = new ConnectionAccess();
        public DataTable danhmuc_header()
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_DanhMucDuAn where status = 'true' order by id desc";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable list_danhmuc(string id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_DuAn inner join tbl_DanhMucDuAn on tbl_DuAn.DanhMucDuAn_Id = tbl_DanhMucDuAn.Id where tbl_DuAn.status = 'true' and tbl_DanhMucDuAn.Id = '" + id + "' order by tbl_DuAn.id desc ";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable chiTietDuAn(string Id)
        {
            DataTable tb = new DataTable();
            string sql = "select *, TenDanhMuc from tbl_DuAn inner join tbl_DanhMucDuAn on tbl_DuAn.DanhMucDuAn_Id = tbl_DanhMucDuAn.Id where tbl_DuAn.status = 'true' and tbl_DuAn.Id = '" + Id + "' ";
            tb = obj.getTable(sql);
            return tb;
        }
    }
}

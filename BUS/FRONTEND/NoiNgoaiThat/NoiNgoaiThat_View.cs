using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DTO;
using System.Data;
using DAL;

namespace BUS.FRONTEND.NoiNgoaiThat
{
    public class NoiNgoaiThat_View
    {
        ConnectionAccess obj = new ConnectionAccess();
        public DataTable danhmuc_header()
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_DanhMucNoiNgoaiThat where status = 'true' order by id desc";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable list_danhmuc(string id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_NoiNgoaiThat inner join tbl_DanhMucNoiNgoaiThat on tbl_NoiNgoaiThat.DanhMucNoiNgoaiThat_Id = tbl_DanhMucNoiNgoaiThat.Id where tbl_NoiNgoaiThat.status = 'true' and tbl_DanhMucNoiNgoaiThat.Id = '" + id + "' order by tbl_NoiNgoaiThat.id desc ";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable chiTietNoiNgoaiThat(string Id)
        {
            DataTable tb = new DataTable();
            string sql = "select *, tenDanhMuc from tbl_NoiNgoaiThat inner join tbl_DanhMucNoiNgoaiThat on tbl_NoiNgoaiThat.DanhMucNoiNgoaiThat_Id = tbl_DanhMucNoiNgoaiThat.Id where tbl_DanhMucNoiNgoaiThat.status = 'true' and tbl_NoiNgoaiThat.Id = '" + Id + "' ";
            tb = obj.getTable(sql);
            return tb;
        }
        public DataTable searchByDanhMuc(string Id)
        {
            DataTable tb = new DataTable();
            string sql = "select *, tenDanhMuc from tbl_NoiNgoaiThat inner join tbl_DanhMucNoiNgoaiThat on tbl_NoiNgoaiThat.DanhMucNoiNgoaiThat_Id = tbl_DanhMucNoiNgoaiThat.Id where tbl_DanhMucNoiNgoaiThat.Id = '" + Id + "' ";
            tb = obj.getTable(sql);
            return tb;
        }
        public DataTable searchByName(string name)
        {
            DataTable tb = new DataTable();
            string sql = "select *, tenDanhMuc from tbl_NoiNgoaiThat inner join tbl_DanhMucNoiNgoaiThat on tbl_NoiNgoaiThat.DanhMucNoiNgoaiThat_Id = tbl_DanhMucNoiNgoaiThat.Id where tenNoiNgoaiThat like N'%" + name + "%'";
            tb = obj.getTable(sql);
            return tb;
        }
        public DataTable searchByNameAndID(string name, string id)
        {
            DataTable tb = new DataTable();
            string sql = "select *, tenDanhMuc from tbl_NoiNgoaiThat inner join tbl_DanhMucNoiNgoaiThat on tbl_NoiNgoaiThat.DanhMucNoiNgoaiThat_Id = tbl_DanhMucNoiNgoaiThat.Id where tenNoiNgoaiThat like N'%" + name + "%' or tbl_DanhMucNoiNgoaiThat.Id = '" + id + "'";
            tb = obj.getTable(sql);
            return tb;
        }
    }
}

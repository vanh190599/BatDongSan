using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DTO;
using System.Data;
using DAL;
using System.Dynamic;

namespace BUS.FRONTEND.TinTuc
{
    public class TinTuc_View
    {
        ConnectionAccess obj = new ConnectionAccess();
        public DataTable getAll()
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_DanhMucTinTuc ";
            tb = obj.getTable(sql);
            return tb;
        }
        public DataTable danhmuc_header()
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_DanhMucTinTuc where status = 'true' order by id desc";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable list_danhmuc(string id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_TinTuc inner join tbl_DanhMucTinTuc on tbl_TinTuc.DanhMucTinTuc_Id = tbl_DanhMucTinTuc.Id where tbl_TinTuc.status = 'true' and tbl_DanhMucTinTuc.Id = '" + id + "' order by tbl_TinTuc.id desc ";
            tb = obj.getTable(sql);
            return tb;
        }
        public DataTable list_TopTin(string id)
        {
            DataTable tb = new DataTable();
            string sql = "select top 4 * from tbl_TinTuc inner join tbl_DanhMucTinTuc on tbl_TinTuc.DanhMucTinTuc_Id = tbl_DanhMucTinTuc.Id where tbl_TinTuc.status = 'true' and tbl_DanhMucTinTuc.Id = '" + id + "' order by tbl_TinTuc.LuotXem desc ";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable chiTietTinTuc(string Id)
        {
            DataTable tb = new DataTable();
            string sql = "select *, TenDanhMuc from tbl_TinTuc inner join tbl_DanhMucTinTuc on tbl_TinTuc.DanhMucTinTuc_Id = tbl_DanhMucTinTuc.Id where tbl_DanhMucTinTuc.status = 'true' and tbl_TinTuc.Id = '" + Id + "' ";
            tb = obj.getTable(sql);
            return tb;
        }
        public DataTable searchByDanhMuc(string Id)
        {
            DataTable tb = new DataTable();
            string sql = "select *, TenDanhMuc from tbl_TinTuc inner join tbl_DanhMucTinTuc on tbl_TinTuc.DanhMucTinTuc_Id = tbl_DanhMucTinTuc.Id where tbl_DanhMucTinTuc.Id = '" + Id + "' ";
            tb = obj.getTable(sql);
            return tb;
        }
        public DataTable searchByName(string name)
        {
            DataTable tb = new DataTable();
            string sql = "select *,TenDanhMuc from tbl_TinTuc inner join tbl_DanhMucTinTuc on tbl_TinTuc.DanhMucTinTuc_Id = tbl_DanhMucTinTuc.Id where TenTinTuc like N'%" + name + "%'";
            tb = obj.getTable(sql);
            return tb;
        }
        public DataTable searchByNameAndID(string name,string id)
        {
            DataTable tb = new DataTable();
            string sql = "select *,TenDanhMuc from tbl_TinTuc inner join tbl_DanhMucTinTuc on tbl_TinTuc.DanhMucTinTuc_Id = tbl_DanhMucTinTuc.Id where TenTinTuc like N'%" + name + "%' or tbl_DanhMucTinTuc.Id = '" + id + "'";
            tb = obj.getTable(sql);
            return tb;
        }
        public void updateLuotXem(int luotxem, string id)
        {
            string sql = "update tbl_TinTuc set  LuotXem = '" + luotxem + "' where Id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }
        public DataTable searchByID(string id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_TinTuc where Id = '" + id + "'";
            tb = obj.getTable(sql);
            return tb;
        }
    }
}

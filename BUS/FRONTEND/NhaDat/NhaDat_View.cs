using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DTO;
using System.Data;
using DAL;

namespace BUS.FRONTEND.NhaDat
{
    public class NhaDat_View
    {
        ConnectionAccess obj = new ConnectionAccess();
        public DataTable danhmuc_header()
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_DanhMucNhaDat where status = 'true' order by id desc";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable list_danhmuc(string id)
        {
            DataTable tb = new DataTable();
            string sql = "select TOP 8 * from tbl_NhaDat inner join tbl_DanhMucNhaDat on tbl_NhaDat.DanhMuc_Id = tbl_DanhMucNhaDat.Id where tbl_NhaDat.status = 'true' and tbl_DanhMucNhaDat.Id = '" + id + "' order by tbl_NhaDat.id desc ";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable top10()
        {
            DataTable tb = new DataTable();
            string sql = "select TOP 10 * from tbl_NhaDat order by LuotXem desc";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable chiTietNhaDat(string Id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_NhaDat where status = 'true' and Id = '" + Id + "' ";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable TimKiem_TheoDanhMuc(string key, string id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_NhaDat inner join tbl_DanhMucNhaDat on tbl_NhaDat.DanhMuc_Id = tbl_DanhMucNhaDat.Id where tbl_NhaDat.status = 'true' and DiaChi like N'%" + key + "%' and tbl_DanhMucNhaDat.id = '" + id + "' order by tbl_NhaDat.id desc";
            tb = obj.getTable(sql);
            return tb;
        }
        public void update_luotxem(string id)
        {
            //lay luot xem cu
            int luotxem_cu = 0;
            DataTable tb = new DataTable();
            tb = obj.getTable("select LuotXem from tbl_NhaDat where id = '" + id + "' ");
            if (tb.Rows.Count > 0)
            {
                luotxem_cu = Convert.ToInt32(tb.Rows[0]["LuotXem"]);
            }
            //cap nhat luot xem
            int luotxem_moi = luotxem_cu + 1;
            string sql_update = "update tbl_NhaDat set LuotXem = '" + luotxem_moi + "' where id = '" + id + "' ";
            obj.ExecuteNonQuery(sql_update);
        }

        public DataTable filter(string from, string to)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_NhaDat where DienTich between '" + from + "' and '" + to + "'  ";
            tb = obj.getTable(sql);
            return tb;
        }
   

        public DataTable TimKiem_DiaDiem(string key)
        {
            DataTable tb = new DataTable();
            string sql = "select TOP 10 * from tbl_NhaDat where DiaChi like N'%" + key + "%' order by id desc";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable next(int from)
        {
            //lay toi da 8 ban ghi tren 1 trang
            string sql = "select TOP 8 * from tbl_NhaDat inner join tbl_DanhMucNhaDat on tbl_NhaDat.DanhMuc_Id = tbl_DanhMucNhaDat.Id where tbl_NhaDat.status = 'true' and tbl_DanhMucNhaDat.Id = 11 and tbl_NhaDat.Id NOT IN(SELECT TOP "+from+" Id FROM tbl_NhaDat)";
            DataTable tb = new DataTable();
            tb = obj.getTable(sql);
            return tb;
        }
    }

}

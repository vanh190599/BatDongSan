using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BUS.TinTuc
{
    public class TinTuc_BUS
    {
        ConnectionAccess obj = new ConnectionAccess();
        DataTable tb = null;
        string sql = null;
        public DataTable searchByID(int id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_TinTuc where Id='" + id + "'";
            tb = obj.getTable(sql);
            return tb;
        }
        public DataTable list()
        {
            sql = "select * from tbl_TinTuc order by id desc";
            tb = obj.getTable(sql);
            return tb;
        }


        public void create(DTO.TinTuc c)
        {
            //
            string sql = "insert tbl_TinTuc values(N'" + c.TenTinTuc + "' , '" + "~/assets/images/TinTucs/" + c.Anh + "', '" + c.DanhMucTinTuc_Id + "', N'" + c.MoTa + "', N'" + c.ChiTiet +
                "','" + c.NguoiDang + "','" + c.LuotXem + "', '" + c.Status + "', '" + c.Created_at + "')";
            obj.ExecuteNonQuery(sql);
        }

        public void delete(int id)
        {
            string sql = "delete from tbl_TinTuc where id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }

        public void update(DTO.TinTuc c, int id)
        {
            string sql = "update tbl_TinTuc set TenTinTuc = N'" + c.TenTinTuc + "' , Anh = '" + "~/assets/images/TinTucs/" + c.Anh + "',DanhMucTinTuc_Id= '" + c.DanhMucTinTuc_Id + "' , MoTa = N'" + c.MoTa + "', ChiTiet = N'" + c.ChiTiet + "', NguoiDang = N'" + c.NguoiDang + "', LuotXem = N'" + c.LuotXem + "', status = '" + c.Status + "',Created_at= '" + c.Created_at + "' where id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }

        //Hàm lấy 1 bản ghi danh mục với tên table và id là đối số
        public string[] firstCategory(String table, int id)
        {
            string[] param = obj.firstCategory(table, id);
            return param;
        }
        public DataTable SearchByName(string name)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_TinTuc where TenDanhMuc LIKE N'%'" + name + "'%'";
            tb = obj.getTable(name);
            return tb;
        }
        public void updateLuotXem(DTO.TinTuc c, int id)
        {
            string sql = "update tbl_TinTuc set LuotXem = N'" + c.LuotXem + "' where id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }
        public DataTable searchByLuotXem()
        {
            DataTable tb = new DataTable();
            string sql = "SELECT * FROM tbl_TinTuc ORDER BY LuotXem";
            tb = obj.getTable(sql);
            return tb;
        }
    }
}
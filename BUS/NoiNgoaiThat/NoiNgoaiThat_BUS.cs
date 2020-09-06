using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BUS.NoiNgoaiThat
{
    public class NoiNgoaiThat_BUS
    {
        ConnectionAccess obj = new ConnectionAccess();
        DataTable tb = null;
        string sql = null;
        public DataTable list()
        {
            sql = "select * from tbl_NoiNgoaiThat order by id desc";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable searching(string key)
        {
            sql = "select * from tbl_NoiNgoaiThat inner join tbl_DanhMucNoiNgoaiThat ON tbl_NoiNgoaiThat.DanhMucNoiNgoaiThat_Id = tbl_DanhMucNoiNgoaiThat.id where " +
                "TenNoiNgoaiThat LIKE N'%"+key+ "%' OR tenDanhMuc LIKE N'%" + key + "%'";
            DataTable dt = new DataTable();
            dt = obj.getTable(sql);
            return dt;
        }

        public void create(DTO.NoiNgoaiThat c)
        {
            string sql = "insert tbl_NoiNgoaiThat values(N'" + c.TenNoiNgoaiThat + "' , '" + "~/assets/images/NoiNgoaiThat/" + c.Anh + "', N'" + c.MoTa 
                + "', N'" + c.ChiTiet + "', '" + c.status + "', '" + c.created_at + "', '" + c.DanhMucNoiNgoaiThat_Id + "')";
            obj.ExecuteNonQuery(sql);
        }

        public void delete(int id)
        {
            string sql = "delete from tbl_NoiNgoaiThat where id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }

        public void update(DTO.NoiNgoaiThat c, int id)
        {
            string sql = "update tbl_NoiNgoaiThat set TenNoiNgoaiThat = N'" + c.TenNoiNgoaiThat + "' , Anh = '~/assets/images/NoiNgoaiThat/" + c.Anh 
                + "', MoTa = N'" + c.MoTa + "', ChiTiet = N'" + c.ChiTiet + "', status = '" + c.status + "',Created_at= '" + c.created_at 
                + "',DanhMucNoiNgoaiThat_Id= '" + c.DanhMucNoiNgoaiThat_Id + "' where id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }

        //Hàm lấy 1 bản ghi danh mục với tên table và id là đối số
        public string[] firstCategory(String table, int id)
        {
            string[] param = obj.firstCategory(table, id);
            return param;
        }

        public DataTable searchById(int id)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT * FROM tbl_NoiNgoaiThat where id ='" + id + "'";
            dt = obj.getTable(sql);
            return dt;
        }
    }
}

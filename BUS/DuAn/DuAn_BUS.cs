using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;

using DAL;
using DTO;

namespace BUS.DuAn
{
    public class DuAn_BUS
    {
        ConnectionAccess obj = new ConnectionAccess();
        DataTable tb = null;
        string sql = null;
        public DataTable list()
        {
            sql = "select TenDuAn,Anh,TenDanhMuc,Gia,DienTich,tbl_DuAn.created_at,tbl_DuAn.status,tbl_DuAn.Id from tbl_DuAn inner join tbl_DanhMucDuAn on tbl_DuAn.DanhMucDuAn_Id = tbl_DanhMucDuAn.Id order by id desc";
            tb = obj.getTable(sql);
            return tb;
        }
        public void create(DTO.DuAn c)
        {
            string sql = "insert tbl_DuAn values(N'" + c.TenDuAn + "' ,N'" + c.Anh + "' ,N'" + c.DanhMucDuAn_Id + "' , N'" + c.MoTa + "',N'" + c.DiaChi+"' ,N'" + c.Gia + "' ,N'" + c.ChuDauTu + "' ,N'" + c.DienTich + "' ,N'" + c.TienDo + "' , '" + c.status + "', '" + c.created_at + "'  )";
            obj.ExecuteNonQuery(sql);
        }
        public void delete(int id)
        {
            string sql = "delete from tbl_DuAn where id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }
        public void update(DTO.DuAn c, int id)
        {
            string sql = "update tbl_DuAn set TenDuAn = N'" + c.TenDuAn + "', Anh =  N'" + c.Anh + "',DanhMucDuAn_Id=N'"+c.DanhMucDuAn_Id+ "',MoTa=N'" + c.MoTa + "',DiaChi=N'" + c.DiaChi + "',Gia=N'" + c.Gia + "',ChuDauTu=N'" + c.ChuDauTu + "',DienTich=N'" + c.DienTich + "',TienDo=N'" + c.TienDo + "', status = '" + c.status + "' where id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }
        //Hàm lấy 1 bản ghi danh mục với tên table và id là đối số
        public string[] firstCategory1(String table, int id)
        {
            string[] param = obj.firstCategory1(table, id);
            return param;
        }

    }
}

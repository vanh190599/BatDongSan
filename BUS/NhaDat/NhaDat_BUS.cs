using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DTO;
using DAL;
namespace BUS.NhaDat
{
    public class NhaDat_BUS
    {
        ConnectionAccess obj = new ConnectionAccess();
        public void create(Nha_Dat n)

        {
            string sql = "insert tbl_NhaDat values( N'"+n.Image1+ "', '" + n.Image2 + "', '" + n.Image3 + "', '" + n.DanhMuc_Id+"', N'"+n.TieuDe+ "', '" + n.Gia + "', '" + n.DienTich + "', N'" + n.MoTa + "', N'" + n.ChiTiet + "', N'" + n.DiaChi + "', N'" + n.LienHe + "',  '" + n.LuotXem + "', '" + n.status + "', '" + n.created_at + "') ";
            obj.ExecuteNonQuery(sql);
        }

        public DataTable list()
        {
            DataTable tb = new DataTable();
            //string sql = "select TOP 6 * from tbl_NhaDat order by id desc";
            string sql = "select tbl_NhaDat.Id, Image1, TieuDe, TenDanhMuc, Gia, DienTich, DiaChi, LuotXem, LienHe, tbl_NhaDat.status from tbl_NhaDat inner join tbl_DanhMucNhaDat on tbl_NhaDat.DanhMuc_Id = tbl_DanhMucNhaDat.Id order by tbl_NhaDat.id desc";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable tim(string key)
        {
            DataTable tb = new DataTable();
            //string sql = "select TOP 6 * from tbl_NhaDat order by id desc";
            string sql = "select tbl_NhaDat.Id, Image1, TieuDe, TenDanhMuc, Gia, DienTich, DiaChi, LuotXem, LienHe, tbl_NhaDat.status from tbl_NhaDat inner join tbl_DanhMucNhaDat on tbl_NhaDat.DanhMuc_Id = tbl_DanhMucNhaDat.Id  where TieuDe like N'%"+key+"%' order by tbl_NhaDat.id desc";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable first(string id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_NhaDat where id = '"+id+"' ";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable getCategory()
        {
            string sql = "select  * from tbl_DanhMucNhaDat order by id desc";
            DataTable tb = new DataTable(); ;
            tb = obj.getTable(sql);
            return tb;
        }

        public void update(Nha_Dat n, string id)
        {
            string sql = " update tbl_NhaDat set Image1 = '"+n.Image1+ "', Image2 = '" + n.Image2 + "', Image3 = '" + n.Image3 + "', DanhMuc_Id = '" + n.DanhMuc_Id + "', TieuDe = N'" + n.TieuDe + "', Gia = '" + n.Gia + "', DienTich = '" + n.DienTich + "', MoTa = N'" + n.MoTa + "', ChiTiet = N'" + n.ChiTiet + "', DiaChi = N'" + n.DiaChi + "',  LienHe = N'"+n.LienHe+"', status = '" + n.status + "' where id = '"+id+"' ";
            obj.ExecuteNonQuery(sql);
        }

        public void delete(int id)
        {
            string sql = "delete tbl_NhaDat where id = '"+id+"'";
            obj.ExecuteNonQuery(sql);
        }

        public DataTable next(int from)
        {
            //lay toi da 8 ban ghi tren 1 trang
            string sql = "select TOP 8 tbl_NhaDat.Id, Image1, TieuDe, TenDanhMuc, Gia, DienTich, DiaChi, LuotXem, LienHe, tbl_NhaDat.status from tbl_NhaDat inner join tbl_DanhMucNhaDat on tbl_NhaDat.DanhMuc_Id = tbl_DanhMucNhaDat.Id WHERE tbl_NhaDat.Id NOT IN(SELECT TOP "+from+" Id FROM tbl_NhaDat)";
            DataTable tb = new DataTable();
            tb = obj.getTable(sql);
            return tb;
        }
    }
}

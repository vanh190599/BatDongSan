using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DTO;
using BUS.FRONTEND.DuAn;
using System.Data;
namespace GiaoDien.FRONTEND
{
    public partial class ChiTietDuAn : System.Web.UI.Page
    {
        DuAn_View obj = new DuAn_View();

        public string TenDuAn;
        public string Anh;
        public string MoTa;
        public string DiaChi;
        public string Gia;
        public string ChuDauTu;
        public string DienTich;
        public string TienDo;
        public string created_at;
        public string TenDanhMuc;
        public string ChiTiet;


        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        public void load()
        {
            string id = Request.QueryString["Id"];
            DataTable tb = new DataTable();
            tb = obj.chiTietDuAn(id);

            if (tb.Rows.Count > 0)
            {
                TenDuAn = tb.Rows[0]["TenDuAn"].ToString();
                Anh = tb.Rows[0]["Anh"].ToString().Trim();
                MoTa = tb.Rows[0]["MoTa"].ToString();
                DiaChi = tb.Rows[0]["DiaChi"].ToString();
                Gia = tb.Rows[0]["Gia"].ToString();
                ChuDauTu = tb.Rows[0]["ChuDauTu"].ToString();
                DienTich = tb.Rows[0]["DienTich"].ToString();
                DienTich = tb.Rows[0]["TienDo"].ToString();
                created_at = tb.Rows[0]["created_at"].ToString();

            }
        }
    }
}
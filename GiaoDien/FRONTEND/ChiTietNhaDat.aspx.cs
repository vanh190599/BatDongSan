using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DTO;
using BUS.FRONTEND.NhaDat;
using System.Data;

namespace GiaoDien.FRONTEND
{
    public partial class ChiTietNhaDat : System.Web.UI.Page
    {
        NhaDat_View obj = new NhaDat_View();

        public string TieuDe;
        public string DiaChi;
        public string Gia;
        public string DienTich;
        public string LienHe;
        public string MoTa;
        public string LuotXem;
        public string image1;
        public string image2;
        public string image3;
        public string ChiTiet;
        public string created_at;

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        public void load()
        {
            string id = Request.QueryString["Id"];
            DataTable tb = new DataTable();
            tb = obj.chiTietNhaDat(id);

            if (tb.Rows.Count > 0)
            {
                TieuDe = tb.Rows[0]["TieuDe"].ToString();
                DiaChi = tb.Rows[0]["DiaChi"].ToString();
                Gia = tb.Rows[0]["Gia"].ToString();
                DienTich = tb.Rows[0]["DienTich"].ToString();
                MoTa = tb.Rows[0]["MoTa"].ToString();
                image1 = tb.Rows[0]["Image1"].ToString().Trim();
                image2 = tb.Rows[0]["Image2"].ToString().Trim();
                image3 = tb.Rows[0]["image3"].ToString().Trim();
                ChiTiet = tb.Rows[0]["ChiTiet"].ToString();
                created_at = tb.Rows[0]["created_at"].ToString();
                LienHe = tb.Rows[0]["LienHe"].ToString();
                LuotXem = tb.Rows[0]["LuotXem"].ToString();

                Image111.ImageUrl = image1;
                Image222.ImageUrl = image2;
                Image333.ImageUrl = image3;

                imgModal1.ImageUrl = image1;
                imgModal2.ImageUrl = image2;
                imgModal3.ImageUrl = image3;

                //cap nhat so luot xem
                string id_NhaDat = tb.Rows[0]["Id"].ToString();
                obj.update_luotxem(id_NhaDat);
            }
        }

    }
}
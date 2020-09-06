using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DTO;
using BUS.FRONTEND.TinTuc;
using System.Data;


namespace GiaoDien.FRONTEND
{
    public partial class ChiTietTinTuc : System.Web.UI.Page
    {
        TinTuc_View obj = new TinTuc_View();

        public string TenTinTuc;
        public string Anh;
        public string MoTa;
        public string ChiTiet;
        public string created_at;
        public string TenDanhMuc;


        protected void Page_Load(object sender, EventArgs e)
        {
            load();
            string id = Request.QueryString["Id"];
            DTO.TinTuc tint = new DTO.TinTuc();
            DataTable tb = new DataTable();
            tb = obj.searchByID(id);
            string luotxem = "";
            if (tb.Rows.Count > 0)
            {
                 luotxem = tb.Rows[0]["LuotXem"].ToString();
                
            }
            tint.LuotXem = Int32.Parse(luotxem) + 1;
            obj.updateLuotXem(tint.LuotXem, id);
        }

        public void load()
        {
            string id = Request.QueryString["Id"];
            DataTable tb = new DataTable();
            tb = obj.chiTietTinTuc(id);

            if (tb.Rows.Count > 0)
            {
                TenTinTuc = tb.Rows[0]["TenTinTuc"].ToString();
                MoTa = tb.Rows[0]["MoTa"].ToString();
                ChiTiet = tb.Rows[0]["ChiTiet"].ToString();
                Anh = tb.Rows[0]["Anh"].ToString().Trim();
                created_at = tb.Rows[0]["created_at"].ToString();
                TenDanhMuc = tb.Rows[0]["TenDanhMuc"].ToString();
                //Image1.ImageUrl = Anh;

            }
        }
    }
}
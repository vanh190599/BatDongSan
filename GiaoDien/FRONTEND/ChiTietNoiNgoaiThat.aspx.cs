using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DTO;
using BUS.FRONTEND.NoiNgoaiThat;
using System.Data;

namespace GiaoDien.FRONTEND
{
    public partial class ChiTietNoiNgoaiThat : System.Web.UI.Page
    {
        NoiNgoaiThat_View obj = new NoiNgoaiThat_View();

        public string tenNoiNgoaiThat;
        public string Anh;
        public string MoTa;
        public string ChiTiet;
        public string created_at;
        public string tenDanhMuc;


        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }

        public void load()
        {
            string id = Request.QueryString["Id"];
            DataTable tb = new DataTable();
            tb = obj.chiTietNoiNgoaiThat(id);

            if (tb.Rows.Count > 0)
            {
                tenNoiNgoaiThat = tb.Rows[0]["tenNoiNgoaiThat"].ToString();
                MoTa = tb.Rows[0]["MoTa"].ToString();
                ChiTiet = tb.Rows[0]["ChiTiet"].ToString();
                Anh = tb.Rows[0]["Anh"].ToString().Trim();
                created_at = tb.Rows[0]["created_at"].ToString();
                tenDanhMuc = tb.Rows[0]["tenDanhMuc"].ToString();
                //Image1.ImageUrl = Anh;

            }
        }
    }
}
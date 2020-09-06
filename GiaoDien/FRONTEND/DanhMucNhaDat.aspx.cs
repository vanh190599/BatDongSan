using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTO;
using BUS.FRONTEND.NhaDat;


namespace GiaoDien.FRONTEND
{
    public partial class DanhMucNhaDat : System.Web.UI.Page
    {
        NhaDat_View obj = new NhaDat_View();
        public string tendanhmuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            loadList();
            //if (!IsPostBack)
            //{
            //    loadList();
            //}
        }
        
        public void loadList()
        {
            string id = Request.QueryString["Id"];
            DataTable tb = obj.list_danhmuc(id);
            list_DanhMucNhaDat.DataSource = tb;
            list_DanhMucNhaDat.DataBind();
            if(tb.Rows.Count > 0)
            {
                tendanhmuc = tb.Rows[0]["TenDanhMuc"].ToString();
            }
        }

        //tim kiem
        protected void Tim_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];
            string keysearch = key.Text;
            DataTable tb = obj.TimKiem_TheoDanhMuc(keysearch, id);
            list_DanhMucNhaDat.DataSource = tb;
            list_DanhMucNhaDat.DataBind();
            if (tb.Rows.Count > 0)
            {
                tendanhmuc = tb.Rows[0]["TenDanhMuc"].ToString();
            }
            if (!IsPostBack)
            {
                loadList();
            }
        }

        public int stt = 1;
        public static int from = 0;
        public static int current_page = 1;

        protected void next_Click(object sender, EventArgs e)
        {
            current_page++;
            from += 8; // bắt đầu
            list_DanhMucNhaDat.DataSource = obj.next(from);
            list_DanhMucNhaDat.DataBind();
        }

        protected void after_Click(object sender, EventArgs e)
        {
            current_page = current_page - 1;
            if(current_page <= 1)
            {
                current_page = 1;
            }

            from -= 8; // bắt đầu
            if(from <= 0)
            {
                from = 0;
            }
            list_DanhMucNhaDat.DataSource = obj.next(from);
            list_DanhMucNhaDat.DataBind();

        }
    }
}
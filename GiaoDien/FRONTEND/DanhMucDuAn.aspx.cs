using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTO;
using BUS.FRONTEND.DuAn;

namespace GiaoDien.FRONTEND
{
    public partial class DanhMucDuAnn : System.Web.UI.Page
    {
        DuAn_View obj = new DuAn_View();
        public string tendanhmuc;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                loadList();
            }
        }
        public void loadList()
        {
            string id = Request.QueryString["Id"];
            DataTable tb = obj.list_danhmuc(id);
            list_DanhMucDuAn.DataSource = tb;
            list_DanhMucDuAn.DataBind();
            if (tb.Rows.Count > 0)
            {
                tendanhmuc = tb.Rows[0]["TenDanhMuc"].ToString();
            }

        }
    }
}
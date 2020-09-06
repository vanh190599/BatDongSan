using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTO;
using BUS.FRONTEND.TinTuc;

namespace GiaoDien.FRONTEND
{
    public partial class DanhMucTinTuc : System.Web.UI.Page
    {
        TinTuc_View obj = new TinTuc_View();
        public string TenDanhMuc;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                loadList();
            }
            string id = Request.QueryString["Id"];
            DataTable tb1 = obj.list_TopTin(id);
            list_TOPLX.DataSource = tb1;
            list_TOPLX.DataBind();
            if (tb1.Rows.Count > 0)
            {
                TenDanhMuc = tb1.Rows[0]["TenDanhMuc"].ToString();
            }
        }
        public void loadList()
        {
            string id = Request.QueryString["Id"];
            DataTable tb = obj.list_danhmuc(id);
            list_DanhMucTinTuc.DataSource = tb;
            list_DanhMucTinTuc.DataBind();
            if (tb.Rows.Count > 0)
            {
                TenDanhMuc = tb.Rows[0]["TenDanhMuc"].ToString();
            }
            
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];
            string DanhMucTinTuc_Id = list_DanhMucSearch.SelectedValue;
            string name = txtTenSearch.Text;
            string sql;
            if (name == "")
            {
                DataTable tb = obj.searchByDanhMuc(DanhMucTinTuc_Id);
                list_DanhMucTinTuc.DataSource = tb;
                list_DanhMucTinTuc.DataBind();
                if (tb.Rows.Count > 0)
                {
                    TenDanhMuc = tb.Rows[0]["TenDanhMuc"].ToString();
                }
            }
            else
            {
                if (id == "-1")
                {
                    DataTable tb = obj.searchByName(name);
                    list_DanhMucTinTuc.DataSource = tb;
                    list_DanhMucTinTuc.DataBind();
                    if (tb.Rows.Count > 0)
                    {
                        TenDanhMuc = tb.Rows[0]["TenDanhMuc"].ToString();
                    }
                }
                else
                {
                    DataTable tb = obj.searchByNameAndID(name, DanhMucTinTuc_Id);
                    list_DanhMucTinTuc.DataSource = tb;
                    list_DanhMucTinTuc.DataBind();
                    if (tb.Rows.Count > 0)
                    {
                        TenDanhMuc = tb.Rows[0]["TenDanhMuc"].ToString();
                    }
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTO;
using BUS.FRONTEND.NoiNgoaiThat;

namespace GiaoDien.FRONTEND
{
    public partial class DanhMucNoiNgoaiThat : System.Web.UI.Page
    {
        NoiNgoaiThat_View obj = new NoiNgoaiThat_View();
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
            list_DanhMucNNT.DataSource = tb;
            list_DanhMucNNT.DataBind();
            if (tb.Rows.Count > 0)
            {
                tendanhmuc = tb.Rows[0]["tenDanhMuc"].ToString();
            }

        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];
            string DanhMucTinTuc_Id = list_DanhMuc.SelectedValue;
            string name = txtTenSearch.Text;
            string sql;
            if (name == "")
            {
                DataTable tb = obj.searchByDanhMuc(DanhMucTinTuc_Id);
                list_DanhMucNNT.DataSource = tb;
                list_DanhMucNNT.DataBind();
                if (tb.Rows.Count > 0)
                {
                    tendanhmuc = tb.Rows[0]["TenDanhMuc"].ToString();
                }
            }
            else
            {
                if (id == "-1")
                {
                    DataTable tb = obj.searchByName(name);
                    list_DanhMucNNT.DataSource = tb;
                    list_DanhMucNNT.DataBind();
                    if (tb.Rows.Count > 0)
                    {
                        tendanhmuc = tb.Rows[0]["TenDanhMuc"].ToString();
                    }
                }
                else
                {
                    DataTable tb = obj.searchByNameAndID(name, DanhMucTinTuc_Id);
                    list_DanhMucNNT.DataSource = tb;
                    list_DanhMucNNT.DataBind();
                    if (tb.Rows.Count > 0)
                    {
                        tendanhmuc = tb.Rows[0]["TenDanhMuc"].ToString();
                    }
                }
            }
        }
    }
}
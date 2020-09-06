using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;


namespace GiaoDien.FRONTEND
{
    public partial class Layout_2 : System.Web.UI.MasterPage
    {
        BUS.FRONTEND.NhaDat.NhaDat_View  obj_NhaDat = new BUS.FRONTEND.NhaDat.NhaDat_View();
        BUS.FRONTEND.NoiNgoaiThat.NoiNgoaiThat_View obj_NoiNgoaiThat = new BUS.FRONTEND.NoiNgoaiThat.NoiNgoaiThat_View();
        BUS.FRONTEND.DuAn.DuAn_View obj_DuAn = new BUS.FRONTEND.DuAn.DuAn_View();
        BUS.FRONTEND.TinTuc.TinTuc_View obj_TinTuc = new BUS.FRONTEND.TinTuc.TinTuc_View();


        public string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            username = Session["user_name"].ToString();
            
            
            

            //---------------------------
            loadCategory_NhaDat();
            loadCategory_NoiNgoaiThat();
            loadCategory_DuAn();
            loadCategory_TinTuc();
        }

        public void loadCategory_NhaDat()
        {
            DanhMucNhaDat.DataSource = obj_NhaDat.danhmuc_header();
            DanhMucNhaDat.DataBind();
        }
        public void loadCategory_NoiNgoaiThat()
        {
            DanhMucNoiNgoaiThat.DataSource = obj_NoiNgoaiThat.danhmuc_header();
            DanhMucNoiNgoaiThat.DataBind();
        }
        public void loadCategory_DuAn()
        {
            DanhMucDuAn.DataSource = obj_DuAn.danhmuc_header();
            DanhMucDuAn.DataBind();
        }
        public void loadCategory_TinTuc()
        {
            DanhMucTinTuc.DataSource = obj_TinTuc.danhmuc_header();
            DanhMucTinTuc.DataBind();
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnDangKi_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void btnDangTin_Click(object sender, EventArgs e)
        {
            if (Session["user_id"] != "")
            {
                Response.Redirect("DangTin.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
        }

        protected void DangXuat_Click(object sender, EventArgs e)
        {
            Session["user_id"] = "";
            Session["user_name"] = "";
            Session["user_phone"] = "";

            Response.Redirect("Login.aspx");
        }
    }
}
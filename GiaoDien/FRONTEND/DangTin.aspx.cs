using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS.NhaDat;

namespace GiaoDien.FRONTEND
{
    public partial class DangTin : System.Web.UI.Page
    {
        NhaDat_BUS obj = new NhaDat_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == "")
            {
                Response.Redirect("login.aspx");
            }

            txtNguoiDang.Text = "";
            if (Session["user_name"] != "")
            {
                txtNguoiDang.Text = Session["user_name"].ToString() + " - " + Session["user_phone"].ToString();
                txtLienHe.Text = Session["user_name"].ToString() + " - " + Session["user_phone"].ToString();
            }
            if (!IsPostBack)
            {
                loadDropdown();
            }
        }

        public void loadDropdown()
        {
            listCategory.DataSource = obj.getCategory();
            listCategory.DataTextField = "TenDanhMuc";
            listCategory.DataValueField = "id";
            listCategory.DataBind();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Nha_Dat n = new Nha_Dat();

            n.DanhMuc_Id = listCategory.SelectedValue;
            n.TieuDe = txtTieuDe.Text;
            n.DienTich = txtDienTich.Text;
            n.MoTa = txtMoTa.Text;
            n.ChiTiet = txtChiTiet.Text;
            n.DiaChi = txtDiachi.Text;
            n.Gia = txtGia.Text;
            n.LienHe = txtNguoiDang.Text;


            n.Image1 = "";
            n.Image2 = "";
            n.Image3 = "";
            n.LuotXem = 0;
            n.status = false;
            n.created_at = DateTime.Now;

            // begin: get image
            // Image1 --------------------------------------------------------------------------
            if (upload_image_1.HasFile)
            {
                string tenFile_1 = upload_image_1.FileName;
                // lấy kiểu dữ liệu ảnh
                string extension = System.IO.Path.GetExtension(tenFile_1);
                // kiểm tra đuôi file
                if (extension == ".jpg" || extension == ".png" || extension == ".gif")
                {
                    // url folder lưu ảnh
                    string path = Server.MapPath("~/assets/upload/NhaDat//");
                    // Lưu trong folder
                    upload_image_1.SaveAs(path + tenFile_1);
                    string url_img_1 = "~/assets/upload/NhaDat/" + tenFile_1;  //luu trong db
                    // gán đường dẫn để lưu vào DB
                    n.Image1 = url_img_1;
                }
            }

            // Image2 --------------------------------------------------------------------------
            if (upload_image_2.HasFile)
            {
                string tenFile_2 = upload_image_2.FileName;
                string extension = System.IO.Path.GetExtension(tenFile_2);

                if (extension == ".jpg" || extension == ".png" || extension == ".gif")
                {
                    string path = Server.MapPath("~/assets/upload/NhaDat//");
                    upload_image_2.SaveAs(path + tenFile_2);
                    string url_img_2 = "~/assets/upload/NhaDat/" + tenFile_2;
                    n.Image2 = url_img_2;
                }
            }

            // Image3 --------------------------------------------------------------------------
            if (upload_image_3.HasFile)
            {
                string tenFile_3 = upload_image_3.FileName;
                string extension = System.IO.Path.GetExtension(tenFile_3);

                if (extension == ".jpg" || extension == ".png" || extension == ".gif")
                {
                    string path = Server.MapPath("~/assets/upload/NhaDat//");
                    upload_image_3.SaveAs(path + tenFile_3);
                    string url_img_3 = "~/assets/upload/NhaDat/" + tenFile_3;
                    n.Image3 = url_img_3;
                }
            }
            // end: get image

            // CREATE
            obj.create(n);

            Response.Redirect("AfterDangTin.aspx");
            ClientScript.RegisterStartupScript(this.GetType(), "adasd", "a()", true);
        }
    }
}
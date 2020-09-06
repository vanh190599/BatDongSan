using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS.NhaDat;
using System.Data;

namespace GiaoDien.BACKEND
{
    public partial class SuaNhaDat : System.Web.UI.Page
    {
        NhaDat_BUS obj = new NhaDat_BUS();
        //static: mỗi lần load lại không bị mất link ảnh cũ
        public static string anh1;
        public static string anh2;
        public static string anh3;

        protected void Page_Load(object sender, EventArgs e)
        {
            //check Auth
            if (Session["admin_id"] == "")
            {
                Response.Redirect("login-2.aspx");
            }
            if (!IsPostBack)
            {
                loadDropdown();
                show();
            }
        }

        public void show()
        {
            string Id = Request.QueryString["Id"];
            DataTable tb = new DataTable();
            tb = obj.first(Id);

            if (tb.Rows.Count > 0)
            {
                Image1.ImageUrl  = tb.Rows[0]["Image1"].ToString();
                Image2.ImageUrl  = tb.Rows[0]["Image2"].ToString();
                Image3.ImageUrl  = tb.Rows[0]["Image3"].ToString();
                txtTieuDe.Text   = tb.Rows[0]["TieuDe"].ToString();
                txtMoTa.Text     = tb.Rows[0]["MoTa"].ToString();
                txtGia.Text      = tb.Rows[0]["Gia"].ToString();
                txtDienTich.Text = tb.Rows[0]["DienTich"].ToString();
                txtLienHe.Text = tb.Rows[0]["LienHe"].ToString();
                txtChiTiet.Text  = tb.Rows[0]["ChiTiet"].ToString();
                txtDiachi.Text   = tb.Rows[0]["DiaChi"].ToString();
                checkStatus.Checked = Convert.ToBoolean(tb.Rows[0]["status"].ToString());
                listCategory.SelectedValue = tb.Rows[0]["DanhMuc_Id"].ToString();

                anh1 = tb.Rows[0]["Image1"].ToString();
                anh2 = tb.Rows[0]["Image2"].ToString();
                anh3 = tb.Rows[0]["Image3"].ToString();
            }  
        }
        public void loadDropdown()
        {
            listCategory.DataSource = obj.getCategory();
            listCategory.DataTextField = "TenDanhMuc";
            listCategory.DataValueField = "id";
            listCategory.DataBind();
        }
        //submit
        protected void Submit_Click(object sender, EventArgs e)
        {
            Nha_Dat n = new Nha_Dat();
            n.TieuDe = txtTieuDe.Text;
            n.ChiTiet = txtChiTiet.Text;
            n.Gia = txtGia.Text;
            n.DienTich = txtDienTich.Text;
            n.DiaChi = txtDiachi.Text;
            n.LienHe = txtLienHe.Text;
            n.MoTa = txtMoTa.Text;
            n.status = checkStatus.Checked;
            n.DanhMuc_Id = listCategory.SelectedValue;

            n.Image1 = anh1;
            n.Image2 = anh2;
            n.Image3 = anh3;

            // Nếu có ảnh mới thì update, không thì giữ nguyên ảnh cũ
            // Image1 --------------------------------------------------------------------------
            if (upload_image_1.HasFile)
            {
                //xoa anh cu
                /*string directoryimg = Server.MapPath(anh1);
                System.IO.File.Delete(directoryimg);*/

                //them anh moi
                string tenFile_1 = upload_image_1.FileName;
                string extension = System.IO.Path.GetExtension(tenFile_1);
                if (extension == ".jpg" || extension == ".png" || extension == ".gif")
                {
                    string path = Server.MapPath("~/assets/upload/NhaDat//");
                    upload_image_1.SaveAs(path + tenFile_1);
                    string url_img_1 = "~/assets/upload/NhaDat/" + tenFile_1;  //luu trong db
                    n.Image1 = url_img_1;
                }  
            }
            // Image2 --------------------------------------------------------------------------
            if (upload_image_2.HasFile)
            {
                //xoa anh cu
                /*string directoryimg = Server.MapPath(anh2);
                System.IO.File.Delete(directoryimg);*/

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
                //xoa anh cu
                /*string directoryimg = Server.MapPath(anh3);
                System.IO.File.Delete(directoryimg);*/

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

            string Id = Request.QueryString["Id"];
            obj.update(n, Id);
            Response.Redirect("DanhSach_NhaDat.aspx");
        }
    }
}
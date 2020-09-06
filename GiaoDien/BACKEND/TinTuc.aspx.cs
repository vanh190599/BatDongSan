using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS.TinTuc;
using System.Data;
using System.Web.Services.Description;
using System.Data.SqlClient;

namespace GiaoDien.BACKEND
{
    public partial class TinTuc : System.Web.UI.Page
    {
        TinTuc_BUS obj = new TinTuc_BUS();
        string strCon = @"Data Source=DESKTOP-L18J255\SQLEXPRESS;Initial Catalog=BatDongSan;Integrated Security=True";
        SqlConnection conn = null;
        SqlDataAdapter da = null;
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(strCon);
            conn.Open();
        }
        public void LoadList()
        {
        }


        //them
        protected void submit_create_Click(object sender, EventArgs e)
        {
            //kiem tra trong
            if (txtTenTinTuc.Text == "" || txtMoTaNgan.Text == "" || txtChiTiet.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "vanh", "blank()", true);
                return;
            }
            //them
            DTO.TinTuc tint = new DTO.TinTuc();
            tint.TenTinTuc = txtTenTinTuc.Text;
            tint.MoTa = txtMoTaNgan.Text;
            tint.ChiTiet = txtChiTiet.Text;
            tint.NguoiDang = txtNguoiDang.Text;
            tint.LuotXem = Int32.Parse(txtLuotXem.Text);
            tint.Status = checkStatus_create.Checked;
            tint.Created_at = Convert.ToString(DateTime.Now);
            string path = Server.MapPath("../assets/images/TinTucs/");
            FileUploadImage.SaveAs(path + FileUploadImage.FileName);
            tint.Anh = FileUploadImage.FileName;
            tint.DanhMucTinTuc_Id = Int32.Parse(ddrDanhMuc.SelectedValue);
            obj.create(tint);
            //load list
            Response.Redirect(Request.Url.ToString());
        }
        protected void back_edit_Click(object sender, EventArgs e)
        {
            multi.ActiveViewIndex = 0;
        }

        protected void back_create_Click(object sender, EventArgs e)
        {
            multi.ActiveViewIndex = 0;
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            multi.ActiveViewIndex = 1;
        }

        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.ToString());
        }
    }
}
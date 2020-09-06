using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BUS.TinTuc;
using DTO;

namespace GiaoDien.BACKEND
{
    public partial class SuaTinTuc : System.Web.UI.Page
    {
        TinTuc_BUS obj = new TinTuc_BUS();
        string imageName = "";
        DTO.TinTuc tint = new DTO.TinTuc();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show();
            }

        }
        public void show()
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            DataTable tb = new DataTable();
            tb = obj.searchByID(id);

            if (tb.Rows.Count > 0)
            {
                txtTen.Text = tb.Rows[0]["TenTinTuc"].ToString();
                txtMoTa.Text = tb.Rows[0]["MoTa"].ToString();
                CKEditorControl1.Text = tb.Rows[0]["ChiTiet"].ToString();
                txtNguoiDang.Text = tb.Rows[0]["NguoiDang"].ToString();
                txtLuotXem.Text = tb.Rows[0]["LuotXem"].ToString();
                CheckBox1.Checked = Convert.ToBoolean(tb.Rows[0]["Status"].ToString());
                imgSua.ImageUrl = tb.Rows[0]["Anh"].ToString();
                string strAnh = tb.Rows[0]["Anh"].ToString();
                txtlink.Value = strAnh.Substring(23, strAnh.Length - 23);



                DropDownList1.SelectedValue = tb.Rows[0]["DanhMucTinTuc_Id"].ToString();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("TinTuc.aspx");
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            DTO.TinTuc tint = new DTO.TinTuc();
            tint.TenTinTuc = txtTen.Text;
            //tint.Anh = FileUploadAnhSua.FileName;
           //string path = Server.MapPath("../assets/images/TinTucs/");
            //FileUploadAnhSua.SaveAs(path + FileUploadAnhSua.FileName);
            tint.Anh = FileUploadAnhSua.FileName;

            if (FileUploadAnhSua.HasFile)
            {
                string path = Server.MapPath("../assets/images/TinTucs/");
                FileUploadAnhSua.SaveAs(path + FileUploadAnhSua.FileName);
                tint.Anh = FileUploadAnhSua.FileName;

                string fileName = "~/assets/images/TinTucs/" + FileUploadAnhSua.FileName;
                imgSua.ImageUrl = fileName;

            }
            else
            {
                tint.Anh = txtlink.Value;
            }



            tint.MoTa = txtMoTa.Text;
            tint.ChiTiet = CKEditorControl1.Text;
            tint.NguoiDang = txtNguoiDang.Text;
            tint.LuotXem = Int32.Parse(txtLuotXem.Text) + 1;
            tint.Status = CheckBox1.Checked;
            tint.DanhMucTinTuc_Id = Int32.Parse(DropDownList1.SelectedValue);
            tint.Created_at = Convert.ToString(DateTime.Now);
            obj.update(tint, id);
            Response.Redirect("TinTuc.aspx");
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //ko code gi ca
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS.DuAn;
using System.Data;

namespace GiaoDien.BACKEND
{
    public partial class ChiTietDuAn : System.Web.UI.Page
    {
        DuAn_BUS obj = new DuAn_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            //check Auth
            if (Session["admin_id"] == "")
            {
                Response.Redirect("login-2.aspx");
            }

            if (!IsPostBack)
            {
                LoadList();
            }
        }
        public void LoadList()
        {

            list.DataSource = obj.list();
            list.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            multi.ActiveViewIndex = 1;
        }

        protected void submit_create_Click(object sender, EventArgs e)
        {
            //kiem tra trong
           
            //them
            DuAn cate = new DuAn();
            cate.TenDuAn = txtTenDuAn_create.Text;
            cate.MoTa = txtMoTa.Text;
            cate.DanhMucDuAn_Id = drDuAN.SelectedValue;
            cate.DiaChi = txtDiaChi.Text;
            cate.Gia = txtGia.Text;
            cate.ChuDauTu = txtChuDauTu.Text;
            cate.DienTich = txtDienTich.Text;
            cate.TienDo = txtTienDo.Text;
            string path = Server.MapPath("~/assets/upload/DuAn//");
            flAnh.SaveAs(path + flAnh.FileName);
            cate.Anh = "~/assets/upload/DuAn/" + flAnh.FileName;
   
            cate.status = checkStatus_create.Checked;
            cate.created_at = DateTime.Now;

            obj.create(cate);
            //load list
            Response.Redirect(Request.Url.ToString());
        }

        protected void list_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            hidden_id.Value = id.ToString();
            //delete
            if (e.CommandName.ToString() == "delete")
            {
                obj.delete(id);
                ClientScript.RegisterStartupScript(this.GetType(), "vanh", "alertDelSucess()", true);
                LoadList();
            }
            //update
            else
            {
                //hien view update
                multi.ActiveViewIndex = 2;
                //lay thong tin cua dong hien tai
                string[] param = obj.firstCategory1("tbl_DuAn", id);
                txtTenDanhMuc_edit.Text = param[0];

                linkanh.Value = param[1];
                txtDiaCHi_edit.Text = param[4];
                txtGia_edit.Text = param[5];
                txtChuDauTu_edit.Text = param[6];
                txtDienTich_edit.Text = param[7];
                txtTienDo_edit.Text = param[8];
                txtMoTa_edit.Text = param[3];
                checkStatus_edit.Checked = Convert.ToBoolean(param[9]);
            }

        }

        protected void back_edit_Click(object sender, EventArgs e)
        {
            multi.ActiveViewIndex = 0;
        }

        protected void back_create_Click(object sender, EventArgs e)
        {
            multi.ActiveViewIndex = 0;
        }

        protected void submit_edit_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(hidden_id.Value);
            DuAn cate = new DuAn();
            cate.TenDuAn = txtTenDanhMuc_edit.Text;
            cate.MoTa = txtMoTa_edit.Text;
            cate.DanhMucDuAn_Id = drDuAn1.SelectedValue;
            cate.DiaChi = txtDiaCHi_edit.Text;
            cate.Gia = txtGia_edit.Text;
            cate.ChuDauTu = txtChuDauTu_edit.Text;
            cate.DienTich = txtDienTich_edit.Text;
            cate.TienDo = txtTienDo_edit.Text;
            cate.status = checkStatus_edit.Checked;

            if (flAnh1.HasFile)
            {
                string path = Server.MapPath("~/assets/upload/DuAn//");
                flAnh1.SaveAs(path + flAnh1.FileName);
                cate.Anh = "~/assets/upload/DuAn/" + flAnh1.FileName;
            }
            else
            {
                cate.Anh = linkanh.Value;
            }

            //string path = Server.MapPath("~/uploads/DuAn//");
            //flAnh1.SaveAs(path + flAnh1.FileName);
            //cate.Anh = "~/uploads/DuAn/" + flAnh1.FileName;
            obj.update(cate, id);
            //load list
            Response.Redirect(Request.Url.ToString());
        }

        protected void drDuAn1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
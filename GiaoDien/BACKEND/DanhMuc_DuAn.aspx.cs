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
    public partial class DanhMuc_DuAn : System.Web.UI.Page
    {
        DanhMucDuAn_BUS obj = new DanhMucDuAn_BUS();
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
            if (txtMoTa_create.Text == "" || txtTenDanhMuc_create.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "vanh", "blank()", true);
                return;
            }
            //them
            DanhMucDuAn cate = new DanhMucDuAn();
            cate.TenDanhMuc = txtTenDanhMuc_create.Text;
            cate.MoTa = txtMoTa_create.Text;
            /*cate.status = true;
            if (!checkStatus_create.Checked) cate.status = false;*/
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
                string[] param = obj.firstCategory("tbl_DanhMucDuAn", id);
                txtTenDanhMuc_edit.Text = param[0];
                txtMoTa_edit.Text = param[1];
                checkStatus_edit.Checked = Convert.ToBoolean(param[2]);
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
            DanhMucDuAn cate = new DanhMucDuAn();
            cate.TenDanhMuc = txtTenDanhMuc_edit.Text;
            cate.MoTa = txtMoTa_edit.Text;
            cate.status = checkStatus_edit.Checked; ;
            obj.update(cate, id);
            //load list
            Response.Redirect(Request.Url.ToString());
        }
    }
}
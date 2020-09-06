using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS.NoiNgoaiThat;
using System.Data;



namespace GiaoDien.BACKEND
{
    public partial class NoiNgoaiThat : System.Web.UI.Page
    {
        NoiNgoaiThat_BUS obj = new NoiNgoaiThat_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //check Auth
                if (Session["admin_id"] == "")
                {
                    Response.Redirect("login-2.aspx");
                }
                //LoadList();
            }
        }
        public void LoadList()
        {
            //list.DataSource = obj.list();
            //list.DataBind();
        }
    

        //them
        protected void submit_create_Click(object sender, EventArgs e)
        {
            //kiem tra trong
            if (txtTenNoiNgoaiThat.Text == "" || txtMoTaNgan.Text == "" || txtChiTiet.Text == "")
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "vanh", "blank()", true);
                Response.Write("<script>Tất cả các trường các trường cần điền đầy đủ!</script>");
                return;
            }
            //them
            DTO.NoiNgoaiThat nnt = new DTO.NoiNgoaiThat();
            nnt.TenNoiNgoaiThat = txtTenNoiNgoaiThat.Text;
            nnt.MoTa = txtMoTaNgan.Text;
            nnt.ChiTiet = txtChiTiet.Text;
            nnt.status = checkStatus_create.Checked;
            nnt.created_at = DateTime.Now;
            nnt.DanhMucNoiNgoaiThat_Id = Int32.Parse(ddrDanhMuc.SelectedValue);

            string path = Server.MapPath("../assets/images/NoiNgoaiThat/");
            FileUploadImage.SaveAs(path + FileUploadImage.FileName);
            nnt.Anh = FileUploadImage.FileName;
            Image2.ImageUrl = path;


            obj.create(nnt);
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

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            //grListTimKiem.DataSource = obj.searching(txtTimKiem.Text);
            //grListTimKiem.DataBind();

        }

        protected void tim_Click(object sender, EventArgs e)
        {
            multi.ActiveViewIndex = 2;
        }
    }
}
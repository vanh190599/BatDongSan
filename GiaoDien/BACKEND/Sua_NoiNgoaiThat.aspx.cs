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
    public partial class Sua_NoiNgoaiThat : System.Web.UI.Page
    {
        NoiNgoaiThat_BUS obj = new NoiNgoaiThat_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            //check Auth
            if (Session["admin_id"] == "")
            {
                Response.Redirect("login-2.aspx");
            }
            if (!IsPostBack)
            {
                show();
            }
        }

        public void show()
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            DataTable tb = new DataTable();
            tb = obj.searchById(id);

            if (tb.Rows.Count > 0)
            {
                txtSuaTenNoiThat.Text = tb.Rows[0]["TenNoiNgoaiThat"].ToString();
                txtSuaTenNoiThat.Text = tb.Rows[0]["TenNoiNgoaiThat"].ToString();
                drSuaDanhMuc.SelectedValue = tb.Rows[0]["DanhMucNoiNgoaiThat_Id"].ToString();
                txtSuaMoTa.Text = tb.Rows[0]["MoTa"].ToString();
                txtSuaChiTiet.Text = tb.Rows[0]["ChiTiet"].ToString();
                ckSuaTrangThai.Checked = Convert.ToBoolean(tb.Rows[0]["Status"].ToString());
                //SuaFileUpload.FileName = da.Rows[0]["Anh"].ToString();

                Image1.ImageUrl = tb.Rows[0]["Anh"].ToString();

                string str = tb.Rows[0]["Anh"].ToString();

                txtlink.Value = str.Substring(29, str.Length - 29);
            }
        }

        protected void submit_edit_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            DTO.NoiNgoaiThat nnt = new DTO.NoiNgoaiThat();

            nnt.TenNoiNgoaiThat = txtSuaTenNoiThat.Text;
            nnt.MoTa = txtSuaMoTa.Text;
            nnt.ChiTiet = txtSuaChiTiet.Text;
            nnt.status = ckSuaTrangThai.Checked;
            nnt.created_at = DateTime.Now;
            nnt.DanhMucNoiNgoaiThat_Id1 = Int32.Parse(drSuaDanhMuc.SelectedValue);

            //string path = Server.MapPath("../assets/images/NoiNgoaiThat/");
            //SuaFileUpload.SaveAs(path + SuaFileUpload.FileName);
            //nnt.Anh = SuaFileUpload.FileName;

            if (SuaFileUpload.HasFile)
            {
                string path = Server.MapPath("../assets/images/NoiNgoaiThat/");
                SuaFileUpload.SaveAs(path + SuaFileUpload.FileName);
                nnt.Anh = SuaFileUpload.FileName;

                string fileName = "~/assets/images/NoiNgoaiThat/" + SuaFileUpload.FileName;
                Image1.ImageUrl = fileName;

            }
            else
            {
                nnt.Anh = txtlink.Value;
            }


            obj.update(nnt, id);
            Response.Redirect("NoiNgoaiThat.aspx");
        }
    }
}
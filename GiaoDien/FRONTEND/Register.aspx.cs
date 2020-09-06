using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using System.Data;
using System.Web.Services.Description;
using System.Data.SqlClient;

namespace GiaoDien.FRONTEND
{
    public partial class Register : System.Web.UI.Page
    {
        Register_BUS obj = new Register_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            DTO.Users use = new DTO.Users();
            use.name = txtTen.Text;
            use.email = txtemail.Text;
            use.phone = txtPhone.Text;
            use.password = txtpassword.Text;
            use.created_at = Convert.ToString(DateTime.Now);

            string repass = txtRePass.Text;
            if (use.password == repass)
            {
                obj.create(use);
                Response.Write("<script>alert('Đăng ký thành công!')</script>");
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Đăng ký không thành công!')</script>");
            }
        }
    }
}
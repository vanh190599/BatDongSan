using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BUS.Admin;
using DTO;

namespace GiaoDien.BACKEND
{
    public partial class ThemAdmin : System.Web.UI.Page
    {
        Admin_BUS obj = new Admin_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            //check Auth
            if (Session["admin_id"] == "")
            {
                Response.Redirect("login-2.aspx");
            }
        }


        protected void them()
        {
            Admins admin = new Admins();
            admin.name = txtTen.Text;
            admin.email = txtEmail.Text;
            admin.phone = txtPhone.Text;
            admin.password = txtPassword.Text.Trim();
            admin.role = role.SelectedValue.ToString().Trim();
            string cf_password = txtConfirmPassword.Text;
            //check blank textbox
            if(txtTen.Text == "" || txtEmail.Text == "" || txtPhone.Text == "" || txtPassword.Text == "" || txtConfirmPassword.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "vanh", "blank()", true);
                return;
            }
            //check trung email
            if (!check(txtEmail.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "vanh", "trung()", true);
                return;
            }
            //check confirm password
            if (admin.password == cf_password)
            {
                obj.Insert(admin);
                Response.Redirect("Admin.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "vanh", "conf()", true);
                return;
            }
        }
        protected void submit_Click(object sender, EventArgs e)
        {
            them();
        }

        //kiem tra trung ma
        public Boolean check(string email)
        {
            DataTable tb = new DataTable();
            tb = obj.getAdmin(email);
            if (tb.Rows.Count > 0)
            {
                return false;
            }
            return true;
        }
    }
}
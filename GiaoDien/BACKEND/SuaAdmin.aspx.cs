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
    public partial class sua : System.Web.UI.Page
    {
        Admin_BUS obj = new Admin_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            //check Auth
            if (Session["admin_id"] == "")
            {
                Response.Redirect("login-2.aspx");
            }
            if (!IsPostBack){
                show();  
            }  
        }

        public void show()
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            DataTable tb = new DataTable();
            tb = obj.first(id);

            if (tb.Rows.Count > 0)
            {
                txtTen.Text = tb.Rows[0]["name"].ToString();
                txtPhone.Text = tb.Rows[0]["phone"].ToString();
                txtEmail.Text = tb.Rows[0]["email"].ToString();
                txtPassword.Text = tb.Rows[0]["password"].ToString();
                string position = tb.Rows[0]["role"].ToString().Trim();
                if (position == "manage")
                {
                    role.SelectedIndex = 0;
                }
                else
                {
                    role.SelectedIndex = 1;
                }
            }
        }

        //update
        protected void submit_create_Click(object sender, EventArgs e)
        {
            //check blank textbox
            if (txtTen.Text == "" || txtEmail.Text == "" || txtPhone.Text == "" || txtPassword.Text == "")
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

            int id = Convert.ToInt32(Request.QueryString["Id"]);
            Admins admin = new Admins();
            admin.name = txtTen.Text;
            admin.email = txtEmail.Text;
            admin.phone = txtPhone.Text;
            admin.password = txtPassword.Text;
            admin.role = role.SelectedItem.Value.Trim();
            obj.update(admin, id);  
            Response.Redirect("Admin.aspx");
        }

        //kiem tra trung email
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTO;
using BUS;

namespace GiaoDien.BACKEND
{
    public partial class Login_2 : System.Web.UI.Page
    {
        Login_BUS obj = new Login_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*//check Auth
            if (Session["admin_id"] == "")
            {
                Response.Redirect("login-2.aspx");
            }*/
        }

        //code login
        protected void submit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string pass = txtPassword.Text;
            List<Admins> list = obj.Auth_login(email, pass);
            if (list.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "vanh", "fail()", true);
                return;
            }
            else
            {
                //day len session
                foreach(Admins ad in list)
                {
                    Session["admin_id"] = ad.ID;
                    Session["admin_name"] = ad.name;
                }
                Response.Redirect("Dashboard.aspx");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using GiaoDien.BACKEND;
using DTO;


namespace GiaoDien.FRONTEND
{
    public partial class Login : System.Web.UI.Page
    {
        Login_BUS obj = new Login_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string email = txtemail.Text;
            string pass = txtpassword.Text;
            List<DTO.Users> list = obj.Auth_loginUser(email, pass);
            if (list.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "vanh", "a()", true);
                return;
            }
            else
            {
                //day len session
                foreach (DTO.Users ad in list)
                {
                    Session["user_id"] = ad.ID;
                    Session["user_name"] = ad.name;
                    Session["user_phone"] = ad.phone;
                }
                Response.Redirect("Home.aspx");
            }
        }
    }
}
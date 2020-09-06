using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GiaoDien.BACKEND
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check Auth
            if (Session["admin_id"] == "")
            {
                Response.Redirect("login-2.aspx");
            }
        }
    }
}
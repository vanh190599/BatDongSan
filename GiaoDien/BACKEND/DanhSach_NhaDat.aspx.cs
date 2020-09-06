using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS.NhaDat;
using DTO;
using System.Data;

namespace GiaoDien.BACKEND
{
    public partial class DanhSach_NhaDat : System.Web.UI.Page
    {
        NhaDat_BUS obj = new NhaDat_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            //check Auth
            if (Session["admin_id"] == "")
            {
                Response.Redirect("login-2.aspx");
            }

            if (!IsPostBack)
            {
                loadList();
            }
        }

        public void loadList()
        {
            list.DataSource = obj.list();
            list.DataBind();
        }

        protected void list_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());  
            //delete
            if (e.CommandName.ToString() == "delete")
            {
                obj.delete(id);
                //ClientScript.RegisterStartupScript(this.GetType(), "vanh", "alertDelSucess()", false);
                loadList();
            }
            //update
            else
            {
                Response.Redirect("SuaNhaDat.aspx?Id=" + id);
            }
        }

        public int stt = 1;
        public static int from = 0;
        protected void next_Click(object sender, EventArgs e)
        {
            //from += 8; // bắt đầu
            //list.DataSource = obj.next(from);
            //list.DataBind();
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            string key = txtKey.Text;
            list.DataSource = obj.tim(key);
            list.DataBind();
        }
    }
}
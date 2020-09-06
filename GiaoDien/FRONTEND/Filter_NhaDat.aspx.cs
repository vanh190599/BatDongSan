using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTO;
using BUS.FRONTEND.NhaDat;


namespace GiaoDien.FRONTEND
{
    public partial class Filter_NhaDat : System.Web.UI.Page
    {
        NhaDat_View obj = new NhaDat_View();
        public string from;
        public string to;
        protected void Page_Load(object sender, EventArgs e)
        {
            loadList();
        }
        public void loadList()
        {
            from = Request.QueryString["from"];
            to = Request.QueryString["to"];

            string id = Request.QueryString["Id"];
            DataTable tb = obj.filter(from, to);
            list_DanhMucNhaDat.DataSource = tb;
            list_DanhMucNhaDat.DataBind();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DTO;
using System.Data;
using BUS.FRONTEND.NhaDat;

namespace GiaoDien.FRONTEND
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        NhaDat_View obj = new NhaDat_View();
        protected void Page_Load(object sender, EventArgs e)
        {
            list_top10();
        }

        public void list_top10()
        {
            Datalist_top10.DataSource = obj.top10();
            Datalist_top10.DataBind();  
        }

        protected void tim_Click(object sender, EventArgs e)
        {
            string key = txtSearch.Text;
        
            DataTable tb = obj.TimKiem_DiaDiem(key);
            Datalist_top10.DataSource = tb;
            Datalist_top10.DataBind();
            
            if (!IsPostBack)
            {
                list_top10();
            }
        }
    }
}
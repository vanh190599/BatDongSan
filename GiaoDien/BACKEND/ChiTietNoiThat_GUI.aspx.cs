using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using DAL;
using DTO;

namespace GiaoDien.BACKEND
{
    public partial class ChiTietNoiThat_GUI : System.Web.UI.Page
    {
        ChiTietNoiThat obj = new ChiTietNoiThat();
        ChiTietNoiThat_BUS bus = new ChiTietNoiThat_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            obj.id_chitietnoithat = (txtIdchitietnt.Text);
            obj.tieude = txttieude.Text;
            obj.motangan = txtmota.Text;
            obj.noidung = txtnoidung.Text;
            obj.id_noithat = drnoithat.SelectedValue;

            bus.InsertChiTietNgoaiThat(obj.id_chitietnoithat, obj.tieude, obj.motangan, obj.noidung, obj.id_chitietnoithat);
        }
    }
}
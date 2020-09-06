<%@ Page Title="Chi tiết nội ngoại thất" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="ChiTietNoiNgoaiThat.aspx.cs" Inherits="GiaoDien.FRONTEND.ChiTietNoiNgoaiThat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="../assets/FrontEndCSS/DanhMucNoiNgoaiThat.css" rel="stylesheet" />
    
        <script src="../assets/frontend/front/js/bootstrap.min.js"></script>
        <script src="../assets/frontend/front/js/jquery.bootstrap-growl.min.js"></script>
        <script src="../assets/frontend/front/js/js.js"></script>
        <script src="../assets/frontend/front/js/jquery.js"></script>
        <script src="../assets/frontend/front/js/owl.carousel.min.js"></script>
<style>
    .chitiet p {
        /*text-align: center;*/
        padding: 15px 0 20px 0;
    }
    .chitiet p img{
        width: 700px;
    }
    .chitiet p img:hover{
        transition:0.3s;
        opacity:0.8;
    }
    .chitiet img, em{
        width: 700px;
        padding-top: 30px;
        text-align:center;
    }
</style>

<div class="row">
    <div class="col-lg-2">
            <br />
            <img style="margin-left: 50px" src="../assets/frontend/adv2.jpg" />
    </div>

    <div class="col-lg-8">

        <br />
        <div style="color: gray;">
            Chi tiết Nội-Ngoại thất /<%= tenDanhMuc %>  /<%= tenNoiNgoaiThat %>
        </div>
        <br />

        <div style="color: #055699; font-size: 17px;">
            <%= tenNoiNgoaiThat %>
        </div>
        <div style="color: gray;font-size: 12px;">
             <%= created_at %>
        </div>
        <hr />
        <div style="color: black;font-size: 14px; font-weight:bolder">
            <%= MoTa %>
        </div>
        <br />
        <!-- chi tiet -->
        <div style="margin-top: 20px;" class="chitiet">
            <%= ChiTiet %>
        </div>
    </div>

    <div class="col-lg-2">
        <br />
        <img src="../assets/frontend/adv3.jpg" />
    </div>
</div>
</asp:Content>

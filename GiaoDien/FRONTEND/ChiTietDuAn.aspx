<%@ Page Title="Chi tiết dự án" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="ChiTietDuAn.aspx.cs" Inherits="GiaoDien.FRONTEND.ChiTietDuAn" %>
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
        text-align: center;
        padding: 15px 0 20px 0;
    }
    .chitiet p img{
        width: 700px;
    }
    .chitiet p img:hover{
        transition:0.3s;
        opacity:0.8;
    }
</style>

<div class="row">
    <div class="col-lg-2">
            <img src="../assets/frontend/adv3.jpg" />
    </div>

    <div class="col-lg-8">

        <br />
        <div style="color: gray;margin-bottom:30px;">
            Chi Tiết Dự Án / <%= TenDanhMuc %>  / <%= TenDuAn %>
        </div>
        <hr />

        <br />
        <div class="inf"  style="color: black; font-size: 19px;font-weight:bolder;margin-bottom:20px;">THÔNG TIN DỰ ÁN</div>
        <div style="color: #055699; font-size: 17px;  font-weight:bolder">
            <%= TenDuAn %>
        </div>
        <div style="color: gray;font-size: 12px; margin-bottom:20px;">
             <%= created_at %>
        </div>
        
        <div style="color: black;font-size: 14px;">
            <%= MoTa %>
        </div>
        <br />
    </div>

    <div class="col-lg-2">
        <br />
            <img style="margin-left: 50px" src="../assets/frontend/adv2.jpg" />
    </div>
</div>

</asp:Content>

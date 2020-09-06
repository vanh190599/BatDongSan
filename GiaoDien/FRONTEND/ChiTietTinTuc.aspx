<%@ Page Title="" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="ChiTietTinTuc.aspx.cs" Inherits="GiaoDien.FRONTEND.ChiTietTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="../assets/FrontEndCSS/DanhMucNoiNgoaiThat.css" rel="stylesheet" />
<style>
    td img {
    width: 700px;
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
            Chi tiết tin tức /<%= TenDanhMuc %>  /<%= TenTinTuc %>
        </div>
        <br />

        <div style="color: #055699; font-size: 17px;">
            <%= TenTinTuc %>
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

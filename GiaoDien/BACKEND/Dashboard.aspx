<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GiaoDien.BACKEND.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12 text-center text-primary">
            <br />
            <h1>DASHBOARD</h1>
            <br />
        </div>
        <div class="col-lg-12 text-center text-primary">
            <br />
            <h1>Xin chào <%= Session["admin_name"] %> </h1>
            <br />
        </div>
        <div class="col-lg-12 text-center text-primary">
            <br />
            <div>
                Tổng số: 
                <asp:Label ID="Label1" runat="server" Text=""><%= Application["Access"].ToString()%></asp:Label> lượt truy cập
            </div>
            <div>
                Đang Online: 
                <asp:Label ID="lblCount" runat="server" Text=""><%= Application["Online"].ToString()%></asp:Label> đang online
            </div>
            <br />
        </div>


    </div>
</asp:Content>

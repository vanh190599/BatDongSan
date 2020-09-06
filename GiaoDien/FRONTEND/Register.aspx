<%@ Page Title="" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GiaoDien.FRONTEND.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Đăng nhập</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="../assets/frontend/front/css/bootstrap.min.css" rel="stylesheet" />
    
    <div style="margin-top: 100px; padding: 20px 0 20px 0; background: #dddddd" class="card">
    <div style=" font-size: 30px" class="text-center text-primary" >
       NHẬP THÔNG TIN
    </div>
    <br />
    <table style="width: 600px; margin: auto; " cellpadding="8">
        <tr>
            <td>
                <b>Tên người dùng: </b>
            </td>
            <td>
                <asp:TextBox ID="txtTen" required="" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Email:</b>
            </td>
            <td>
                <asp:TextBox ID="txtemail" type ="Email" required="" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Phone:</b>
            </td>
            <td>
                <asp:TextBox ID="txtPhone" required="" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td><b>Mật khẩu</b></td>
            <td>
                <asp:TextBox ID="txtpassword" type="password" required="" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Nhập lại mật khẩu:</b>
            </td>
            <td>
                <asp:TextBox ID="txtRePass" type="password" required="" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button Text="Đăng ký" CssClass="btn btn-primary text-white"  runat="server" OnClick="Unnamed1_Click" />
            </td>
        </tr>
    </table>
    </div>
   
    <br />                          
    <br />
    <br />                          
    <br />                          
    <br />                          
    <br />                          
    <br />                          
    <br />                          
    <br />                          
    <br />                          
    <br />                          
    <br />                          
    <br />                          
    <br />                          
    <br />                          
                    
</asp:Content>

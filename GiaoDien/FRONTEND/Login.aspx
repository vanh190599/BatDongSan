<%@ Page Title="" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GiaoDien.FRONTEND.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Đăng nhập</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="../assets/frontend/front/css/bootstrap.min.css" rel="stylesheet" />
    
    <div style="margin-top: 100px; padding: 20px 0 20px 0; background: #dddddd" class="card">
    <div style=" font-size: 30px" class="text-center text-primary" >
        MỜI BẠN ĐĂNG NHẬP
    </div>
    <br />
    <table style="width: 600px; margin: auto; " cellpadding="8">
        <tr>
            <td>
                <b>Tài khoản</b>
            </td>
            <td>
                <asp:TextBox ID="txtemail" required="" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td><b>Mật khẩu</b></td>
            <td>
                <asp:TextBox ID="txtpassword" type="password" required="" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button Text="Đăng nhập" CssClass="btn btn-primary text-white"  runat="server" OnClick="Unnamed1_Click" />
            </td>
        </tr>
    </table>
    </div>
    <script src="../assets/sweetalert.js"></script>
    <script>
     
        function a() {
            Swal.fire({
                title: 'Tài khoản hoặc mật khẩu không đúng!',
                icon: 'error',
            }).then(function () {

            });
        }
     
    </script>

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

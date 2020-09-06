<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login-2.aspx.cs" Inherits="GiaoDien.BACKEND.Login_2" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <title>Đăng nhập</title>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <link href="../assets/login-2/css/style.css" rel="stylesheet" />
      <link href="../assets/login-2/css/font-awesome.css" rel="stylesheet" />
   </head>

   <body>
      <style>
         .btn{
             width: 100px;
             height: 40px;
             margin: auto;
             background: #17a2b8;
             border: #17a2b8;
             color: #fff;
             cursor: pointer;
         }
      </style>
      <form id="form1" runat="server">
         <div>
             <div class="login-form w3_form">
             <div class="login-title w3_title">
             </div>
             <div class="login w3_login">
             <h2 class="login-header w3_header">Mời bạn đăng nhập</h2>
             <div class="w3l_grid">
                
                <asp:TextBox ID="txtEmail" type="email" style="color: black" placeholder="Email" required="" runat="server" value="anhVccrop@email.com"></asp:TextBox>
                <asp:TextBox  ID="txtPassword"  type="password" style="color: black" placeholder="Password" Name="password" required="" runat="server"></asp:TextBox>

                <div style="text-align:center">
                    <asp:Button ID="submit" CssClass="btn" runat="server" Text="Đăng nhập" OnClick="submit_Click" />
                </div>
                <div class="footer-w3l"></div>
            </div>
         </div>
        <script src="../assets/sweetalert.js"></script>
        <script>
            function fail() {
                Swal.fire('Tài khoản hoặc mật khẩu không chính xác!');
                return false;
            }
        </script>
         </div>
             </div>
      </form>
   </body>
    
</html>
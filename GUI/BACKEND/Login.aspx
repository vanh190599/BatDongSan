<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GUI.BACKEND.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <style type="text/css">
        .auto-style1 {
            height: 117px;
        }
        .auto-style2 {
            margin-left: 31px;
			border-radius: 5px;
			border-color: #dddddd;
        }
        .auto-style3 {
            margin-left: 59px;
            border-radius: 5px;
			border-color: #dddddd;
        }
        .btn{
            background: #0074e4;
            color: white;
            font-weight: bold;
            border-radius:5px;
        }
    </style>
</head>
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Dancing+Script|Itim|Lobster|Montserrat:500|Noto+Serif|Nunito|Patrick+Hand|Roboto+Mono:100,100i,300,300i,400,400i,500,500i,700,700i|Roboto+Slab|Saira" rel="stylesheet">
    <link href="../asset/admin_login/css/style.css" rel="stylesheet" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<body>
    <form id="form1" runat="server">
        <div class="wrapper">
			<div class="header">
				<img src="../asset/admin_login/images/logo.gif" alt="">
			</div>
			<br>
			<br>
			<div class="box">
				<div class="title">
					MỜI BẠN ĐĂNG NHẬP
				</div>
				<div style="border: 1px solid #dddddd">
				</div>
                <br />
                <br />
                <br />
				<div style="text-align: center" class="auto-style1">
                    <span>Email</span>
				    <asp:TextBox ID="TextBox1" runat="server" Width="460px" Height="34px" CssClass="auto-style3"></asp:TextBox>
                    <br />
                    <br />
					Mật khẩu
				    <asp:TextBox ID="TextBox2" runat="server" Width="460px" Height="34px" CssClass="auto-style2"></asp:TextBox>
				</div>
                <br />
                <br />
                <div style="text-align: center">
                    <asp:Button ID="btnDangNhap" runat="server" CssClass="btn" Text="Đăng nhập" Height="45px" Width="111px" />
                </div>
			</div>
		</div>
    </form>
</body>
</html>

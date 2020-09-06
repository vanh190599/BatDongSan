<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="SuaAdmin.aspx.cs" Inherits="GiaoDien.BACKEND.sua" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../assets/sweetalert.js"></script>
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <br />
            <div class="text-center">
                <h2>SỬA ADMIN</h2>      
            </div>
            <br />
            <div style="margin-bottom: 10px">
                <a href="Admin.aspx" class="btn btn-primary btn-sm">Quay lại</a>
            </div>
            <div class="panel panel-primary" style="border: 1px solid #dddddd; background: white; border-radius: 10px; padding: 30px 10px 30px 10px;">
				<div class="panel-body">
					<div class="row" style="margin-top:5px;">
						<div class="col-md-2">Tên Quản trị viên<span class="text-danger">*</span></div>
						<div class="col-md-10">
							<asp:TextBox ID="txtTen" CssClass="form-control" runat="server"></asp:TextBox>
						</div>
					</div>

					<div class="row" style="margin-top:5px;">
						<div class="col-md-2">Email<span class="text-danger">*</span></div>
						<div class="col-md-10">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
						</div>
					</div>

                    <div class="row" style="margin-top:5px;">
						<div class="col-md-2">Phone<span class="text-danger">*</span></div>
						<div class="col-md-10">
                            <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
						</div>
					</div>

					<div class="row" style="margin-top:5px;">
						<div class="col-md-2">Password<span class="text-danger">*</span></div>
						<div class="col-md-10">
                            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
						</div>
					</div>

					<div class="row" style="margin-top:5px;">
						<div class="col-md-2">Vị trí<span class="text-danger">*</span></div>
						<div class="col-md-10">
                            <asp:DropDownList ID="role" runat="server">
                                <asp:ListItem Text="Quản lý" Value="manage" />
                                <asp:ListItem Text="Nhân viên" Value="employee"  />
                            </asp:DropDownList>
						</div>
					</div>
				
					<div class="row" style="margin-top:10px;">
						<div class="col-md-2"></div>
						<div class="col-md-10">
                            <asp:Button ID="submit_create" Text="Thực hiện" CssClass="btn btn-primary btn-sm" runat="server" OnClick="submit_create_Click"  />
						</div>
					</div>
				</div>
			</div>
        </div>
        <div class="col-lg-1"></div>
    </div>
    <script>
        function trung() {
            Swal.fire({
                title: 'Email đã tồn tại!',
                icon: 'warning',
            }).then(function () {

            });
        }

        function blank() {
            Swal.fire({
                title: 'Vui lòng nhập đầy đủ thông tin!',
                icon: 'info',
            }).then(function () {

            });
        }
    </script>
</asp:Content>

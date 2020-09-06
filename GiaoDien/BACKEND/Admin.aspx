<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="GiaoDien.BACKEND.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 800px;
            height: 407px;
        }
        .abc{
            margin:auto;
            font-size: 16px;
            color: #212529;
            font-family: "Source Sans Pro",-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <br />
            <div class="text-center text-primary">
                <h3>DANH SÁCH QUẢN TRỊ VIÊN</h3>
            </div>
            <br />
            <div>
                <a class="btn btn-primary btn-sm" style="margin-left: 125px; margin-bottom:10px;" href="ThemAdmin.aspx">Thêm Amin</a>
            </div>
            <div style="margin: auto" class="auto-style1" style="border: 1px solid red;">
                <asp:GridView ID="list" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="abc" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="8" ForeColor="#333333" GridLines="None" Width="800px" PageSize="8">
                    <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Mã NS" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="name" HeaderText="Họ tên " SortExpression="name" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="password" HeaderText="Mật khẩu" SortExpression="password" />
                    <asp:BoundField DataField="phone" HeaderText="Liên hệ" SortExpression="phone" />
                    <asp:BoundField DataField="role" HeaderText="Vị trí" SortExpression="role" />
                    <asp:CommandField CancelText="Hủy" DeleteText="Xóa"  EditText="Sửa" HeaderText="Action" ShowDeleteButton="True" UpdateText="Lưu" />
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString ="SuaAdmin.aspx?Id={0}"  HeaderText="Sửa" Text="Sửa" />
                </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString4 %>" DeleteCommand="DELETE FROM [tbl_Admin] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tbl_Admin] ([name], [email], [password], [phone], [role]) VALUES (@name, @email, @password, @phone, @role)" SelectCommand="SELECT *, 'sua.aspx' as 'sua' FROM [tbl_Admin] order by id desc" UpdateCommand="UPDATE [tbl_Admin] SET [name] = @name, [email] = @email, [password] = @password, [phone] = @phone, [role] = @role WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="role" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="role" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>
</asp:Content>

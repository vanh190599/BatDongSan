<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="GiaoDien.BACKEND.User" %>
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
                <h3>DANH SÁCH NGƯỜI DÙNG</h3>
            </div>
            <br />
            <div style="margin: auto" class="auto-style1" style="border: 1px solid red;">
                <asp:GridView ID="list" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="abc" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="8" ForeColor="#333333" GridLines="None" Width="800px" PageSize="8">
                    <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:BoundField DataField="created_at" HeaderText="created_at" SortExpression="created_at" />
                     <asp:TemplateField>
	                    <ItemTemplate>
                                <asp:LinkButton ID="deleteButton" OnClientClick="return confirm('Bạn có chắc muốn xóa bản ghi ?');" CommandArgument='<%#:Eval("Id") %>' runat="server" CommandName="delete"> 
                                <i class="fas fa-trash-alt"></i>
                            </asp:LinkButton> 
	                    </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString5 %>" SelectCommand="SELECT * FROM [tbl_User]" DeleteCommand="DELETE FROM [tbl_User] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tbl_User] ([Name], [Email], [Phone], [password], [created_at]) VALUES (@Name, @Email, @Phone, @password, @created_at)" UpdateCommand="UPDATE [tbl_User] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone, [password] = @password, [created_at] = @created_at WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="created_at" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="created_at" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>
    <script src="../assets/sweetalert.js"></script>
    <script>
        function alertDelete() {
            Swal.fire({
                title: 'Bạn chắc chắn xóa có muốn xóa?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText:
                    '<i class="btn btn-danger">Xóa</i>',
                cancelButtonText:
                    '<i class="btn btn-light">Hủy</i>',
            });
        }
        function alertSucess() {
            Swal.fire({
                title: 'Thêm thành công',
                icon: 'success',
            }).then(function () {
            });
        }
        function alertDelSucess() {
            Swal.fire({
                title: 'Xóa thành công',
                icon: 'success',
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
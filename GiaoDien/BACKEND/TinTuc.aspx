<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="TinTuc.aspx.cs" Inherits="GiaoDien.BACKEND.TinTuc" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .check{
            width: 30px;
            height: 30px;
        }
         .auto-style1 {
             width: 431px;
         }
         .dsnnt div .grViewNoiNgoaiThat img{
   width:100px;
}
.dsnnt div .grViewNoiNgoaiThat{
    width:100%;
}
.dsnnt div .grViewNoiNgoaiThat tr th{
    background-color: #007bff;
    color: #fff;
    font-size: 18px;
}
.dsnnt div .grViewNoiNgoaiThat tr td:nth-child(1){
    width: 13%;
}
.dsnnt div .grViewNoiNgoaiThat tr td:nth-child(2){
    width: 15%;
}
.dsnnt div .grViewNoiNgoaiThat tr td:nth-child(3){
    width: 12%;
}
.dsnnt div .grViewNoiNgoaiThat tr td:nth-child(4){
    width: 35%;
}
.dsnnt div .grViewNoiNgoaiThat tr td:nth-child(5){
    width: 10%;
}
.dsnnt div .grViewNoiNgoaiThat tr td:nth-child(6){
    width: 5%;
}
.dsnnt div .grViewNoiNgoaiThat tr td:nth-child(7){
    width: 5%;
}
.dsnnt div .grViewNoiNgoaiThat tr td:nth-child(8){
    width: 5%;
}
    </style>
    <script runat="server">
        protected int stt = 1;
    </script>

    <div class="row">
        <div class="col-lg-1"></div>
            <div class="col-lg-10" >        
                <asp:MultiView ID="multi" ActiveViewIndex="0" runat="server">
                    <%--danhsach--%>
                    <asp:View runat="server"> 
                        <br />
                        <div class="text-center" style="margin:auto;">
                            <h2>DANH SÁCH TIN TỨC</h2>      
                            <div class="dsnnt" style="  ">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" CssClass="grViewNoiNgoaiThat" AllowPaging="True" PageSize="4">
                                    <Columns>
                                        <asp:boundfield datafield="TenTinTuc" headertext="Tên tin tức" sortexpression="TenTinTuc" />
                                        <asp:ImageField DataImageUrlField="Anh" HeaderText="Hình ảnh">
                                        </asp:ImageField>
                                        <asp:BoundField DataField="TenDanhMuc" HeaderText="Tên danh mục" SortExpression="DanhMucTinTuc_Id" />
                                        <asp:boundfield datafield="MoTa" headertext="Mô tả" sortexpression="MoTa" />
                                        <asp:BoundField DataField="NguoiDang" HeaderText="Người đăng" SortExpression="NguoiDang" />
                                        <asp:BoundField DataField="LuotXem" HeaderText="Lượt xem" SortExpression="LuotXem" />
                                        <asp:TemplateField>
	                                        <ItemTemplate>
                                                 <asp:LinkButton ID="deleteButton" OnClientClick="return confirm('Bạn có chắc muốn xóa bản ghi ?');" CommandArgument='<%#:Eval("Id") %>' runat="server" CommandName="delete"> 
                                                    <i class="fas fa-trash-alt"></i>
                                                </asp:LinkButton> 
	                                        </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString ="SuaTinTuc.aspx?Id={0}"  ControlStyle-CssClass="fas fa-edit" >
                                        
                                        <ControlStyle CssClass="fas fa-edit" />
                                        </asp:HyperLinkField>
                                        
                                        <%--<asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString ="SuaTinTuc.aspx?Id={0}" Text="Sửa" />--%>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString5 %>" DeleteCommand="DELETE FROM [tbl_TinTuc] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tbl_TinTuc] ([TenTinTuc], [Anh], [DanhMucTinTuc_Id], [MoTa], [ChiTiet], [NguoiDang], [LuotXem], [status], [created_at]) VALUES (@TenTinTuc, @Anh, @DanhMucTinTuc_Id, @MoTa, @ChiTiet, @NguoiDang, @LuotXem, @status, @created_at)" SelectCommand="SELECT *,TenDanhMuc FROM [tbl_TinTuc] inner join tbl_DanhMucTinTuc on tbl_TinTuc.DanhMucTinTuc_Id = tbl_DanhMucTinTuc.Id" UpdateCommand="UPDATE [tbl_TinTuc] SET [TenTinTuc] = @TenTinTuc, [Anh] = @Anh, [DanhMucTinTuc_Id] = @DanhMucTinTuc_Id, [MoTa] = @MoTa, [ChiTiet] = @ChiTiet, [NguoiDang] = @NguoiDang, [LuotXem] = @LuotXem, [status] = @status, [created_at] = @created_at WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="TenTinTuc" Type="String" />
                                <asp:Parameter Name="Anh" Type="String" />
                                <asp:Parameter Name="DanhMucTinTuc_Id" Type="Int32" />
                                <asp:Parameter Name="MoTa" Type="String" />
                                <asp:Parameter Name="ChiTiet" Type="String" />
                                <asp:Parameter Name="NguoiDang" Type="String" />
                                <asp:Parameter Name="LuotXem" Type="Int32" />
                                <asp:Parameter Name="status" Type="Boolean" />
                                <asp:Parameter Name="created_at" Type="DateTime" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="TenTinTuc" Type="String" />
                                <asp:Parameter Name="Anh" Type="String" />
                                <asp:Parameter Name="DanhMucTinTuc_Id" Type="Int32" />
                                <asp:Parameter Name="MoTa" Type="String" />
                                <asp:Parameter Name="ChiTiet" Type="String" />
                                <asp:Parameter Name="NguoiDang" Type="String" />
                                <asp:Parameter Name="LuotXem" Type="Int32" />
                                <asp:Parameter Name="status" Type="Boolean" />
                                <asp:Parameter Name="created_at" Type="DateTime" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                        <div style="margin-bottom: 10px;margin-right: 10px">
                            <asp:Button ID="btnThem" CssClass="btn btn-primary" runat="server" Text="Thêm mới" OnClick="btnThem_Click" />
                        </div>
                    </asp:View>
                    <%--View tim kiem--%>
                   
                    <%--view them--%>
                    <asp:View runat="server">
                        <div class="row">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-10">
                                <br />
                                <div class="text-center">
                                    <h2>THÊM TIN TỨC</h2>      
                                </div>
                                <asp:Button ID="back_create" CssClass="btn btn-primary" runat="server" Text="Quay lại" OnClick="back_create_Click" />
                                <table class="w-100">
                                    <tr>
                                        <td class="auto-style1">Tên tin tức:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenTinTuc" runat="server" Width="503px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Mô tả ngắn:</td>
                                        <td>
                                            <asp:TextBox ID="txtMoTaNgan" runat="server" Height="65px" Width="508px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Chi tiết:</td>
                                        <td>
                                            <CKEditor:CKEditorControl ID ="txtChiTiet" runat="server"></CKEditor:CKEditorControl>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Người đăng:</td>
                                        <td>
                                            <asp:TextBox ID="txtNguoiDang" runat="server" Height="65px" Width="508px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Lượt xem:</td>
                                        <td>
                                            <asp:TextBox ID="txtLuotXem" runat="server" Height="65px" Width="508px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Ảnh:</td>
                                        <td>
                                            <asp:FileUpload ID="FileUploadImage" runat="server" Height="25px" Width="515px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Danh mục:</td>
                                        <td>
                                            <asp:DropDownList ID="ddrDanhMuc" runat="server" Height="46px" Width="341px" DataSourceID="SqlDataSource1" DataTextField="tenDanhMuc" DataValueField="Id">
                                            </asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString5 %>" SelectCommand="SELECT * FROM [tbl_DanhMucTinTuc]"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Trạng thái:</td>
                                        <td>
                                            <asp:CheckBox ID="checkStatus_create" Checked="true" class="check" Text="" runat="server" /> &nbsp;&nbsp;Hiển thị
                                        </td>
                                    </tr>
                                </table>
                                
                                <br />
                                <div style="margin-bottom: 10px">
                                    <div class="panel-body">
                                        <div class="row" style="margin-top:10px;">
                                            <div class="col-md-2">
                                            </div>
                                            <div class="col-md-10">
                                                <asp:Button ID="submit_create" runat="server" CssClass="btn btn-primary" OnClick="submit_create_Click" Text="Thực hiện" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-1"></div>
                        </div>
                    </asp:View>

                </asp:MultiView>
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
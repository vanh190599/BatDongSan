<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="NoiNgoaiThat.aspx.cs" Inherits="GiaoDien.BACKEND.NoiNgoaiThat" %>
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
            width: 13%;
        }
        .dsnnt div .grViewNoiNgoaiThat tr td:nth-child(3){
            width: 13%;
        }
        .dsnnt div .grViewNoiNgoaiThat tr td:nth-child(4){
            width: 40%;
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
        .tb-them tr {
            width: 100%;
            height: 70px;
        }

        .tb-them {
            border: solid 1px gray;
            margin-top: 20px;
        }

        .tb-them tr td:nth-child(1) {
            width: 30%;
            text-align: center;
            font-size: 22px;
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
                            <h2>DANH SÁCH NỘI NGOẠI THẤT</h2>  
                            <div class="dsnnt">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" CssClass="grViewNoiNgoaiThat"  AllowPaging="True" AllowSorting="True" PageSize="5">
                                    <Columns>
                                        <asp:BoundField DataField="tennoingoaithat" HeaderText="Tên "   ShowHeader="True"/>
                                        <asp:BoundField DataField="tendanhmuc" HeaderText="Danh Mục" />
                                        <asp:ImageField DataImageUrlField="anh" HeaderText="Hình Ảnh">
                                        </asp:ImageField>
                                        <asp:BoundField DataField="mota" HeaderText="Mô Tả"  />
                                        <asp:BoundField DataField="created_at" HeaderText="Ngày Tạo/Sửa"  />  
                                        <asp:TemplateField HeaderText="Xóa"  >
	                                        <ItemTemplate>
                                                 <asp:LinkButton ID="deleteButton" OnClientClick="return confirm('Bạn có chắc muốn xóa bản ghi ?');" CommandArgument='<%#:Eval("Id") %>' runat="server" CommandName="delete"> 
                                                    <i class="fas fa-trash-alt"></i>
                                                </asp:LinkButton> 
	                                        </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:HyperLinkField NavigateUrl="~/BACKEND/Sua_NoiNgoaiThat.aspx" DataNavigateUrlFields="Id" DataNavigateUrlFormatString ="Sua_NoiNgoaiThat.aspx?Id={0}"  HeaderText="Sửa"  ControlStyle-CssClass="fas fa-edit" />

                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString5 %>" DeleteCommand="DELETE FROM [tbl_NoiNgoaiThat] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tbl_NoiNgoaiThat] ([TenNoiNgoaiThat], [Anh], [MoTa], [ChiTiet], [status], [created_at], [DanhMucNoiNgoaiThat_Id]) VALUES (@TenNoiNgoaiThat, @Anh, @MoTa, @ChiTiet, @status, @created_at, @DanhMucNoiNgoaiThat_Id)" SelectCommand="SELECT *, TenDanhMuc FROM [tbl_NoiNgoaiThat] INNER JOIN [tbl_DanhMucNoiNgoaiThat] ON tbl_NoiNgoaiThat.DanhMucNoiNgoaiThat_Id = tbl_DanhMucNoiNgoaiThat.Id" UpdateCommand="UPDATE [tbl_NoiNgoaiThat] SET [TenNoiNgoaiThat] = @TenNoiNgoaiThat, [Anh] = @Anh, [MoTa] = @MoTa, [ChiTiet] = @ChiTiet, [status] = @status, [created_at] = @created_at, [DanhMucNoiNgoaiThat_Id] = @DanhMucNoiNgoaiThat_Id WHERE [Id] = @Id">
                                    
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <br />
                        <div style="margin-bottom: 10px">
                            <asp:Button ID="btnThem" CssClass="btn btn-primary" runat="server" Text="Thêm mới" OnClick="btnThem_Click" />
                           <%-- <asp:Button ID="tim" CssClass="btn btn-primary" runat="server" Text="Tìm kiếm" OnClick="tim_Click" />--%>
                            
                        </div>
                    </asp:View>

                    <%--view them--%>
                    <asp:View runat="server">
                        <div class="row">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-10">
                                <br />
                                <div class="text-center">
                                    <h2>THÊM NỘI NGOẠI THẤT</h2>      
                                </div>
                                <asp:Button ID="back_create" CssClass="btn btn-primary" runat="server" Text="Quay lại" OnClick="back_create_Click" />
                                <table class="w-100 tb-them">
                                    <tr>
                                        <td class="auto-style1">Tên nội thất:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenNoiNgoaiThat" runat="server" Width="503px" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Mô tả ngắn:</td>
                                        <td>
                                            <asp:TextBox ID="txtMoTaNgan" runat="server" Height="65px" Width="508px" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Chi tiết:</td>
                                        <td>
                                            <CKEditor:CKEditorControl ID ="txtChiTiet" runat="server"></CKEditor:CKEditorControl>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Ảnh:</td>
                                        <td>
                                            <asp:FileUpload ID="FileUploadImage" runat="server" Height="25px" Width="515px" />
                                            <asp:Image ID="Image2" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Danh mục:</td>
                                        <td>
                                            <asp:DropDownList ID="ddrDanhMuc" runat="server" Height="46px" Width="341px" DataSourceID="SqlDataSource1" DataTextField="tenDanhMuc" DataValueField="Id">
                                            </asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString4 %>" SelectCommand="SELECT * FROM [tbl_DanhMucNoiNgoaiThat]"></asp:SqlDataSource>
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

                    <%--view Tìm kiếm--%>
                   <%--<asp:View runat="server"> 
                        <br />
                        <div class="text-center" style="margin:auto;">
                            <div class="text-center">
                                <h2>TÌM KIẾM NỘI NGOẠI THẤT</h2>      
                            </div>
                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Quay lại" OnClick="back_create_Click" />
                            <div>
                                <asp:TextBox runat="server" placeholder="Nhập từ khóa tìm kiếm..." CssClass="offset-sm-0" Width="443px" ID="TextBox1"/>
                                <asp:Button ID="txtTimKiem" CssClass="btn btn-primary" runat="server" Text="Tìm kiếm" OnClick="btnTimKiem_Click"  />
                            </div>
                            <asp:GridView ID="grListTimKiem" runat="server" AutoGenerateColumns="False" Width="687px">
                                <Columns>
                                    <asp:BoundField DataField="TenNoiNgoaiThat" HeaderText="Tên" />
                                    <asp:BoundField DataField="tenDanhMuc" HeaderText="Danh Mục" />
                                    <asp:ImageField DataImageUrlField="Anh" HeaderText="Hình Ảnh">
                                    </asp:ImageField>
                                    <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" />
                                    <asp:BoundField DataField="created_at" HeaderText="Ngày Tạo/Sửa" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>--%>

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
            }).then(function () {1
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

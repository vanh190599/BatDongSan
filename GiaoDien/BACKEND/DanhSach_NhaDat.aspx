<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="DanhSach_NhaDat.aspx.cs" Inherits="GiaoDien.BACKEND.DanhSach_NhaDat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script runat="server">
        protected int stt = 1;
    </script>
    <style>
        .imgshow{
            width: 90px; 
            height: 70px; 
            border: 1px solid #dddddd;
            border-radius: 4px;
        }
    </style>
    <div class="row">
        <%--<div class="col-lg-1"></div>--%>
        <div class="col-lg-12 p-4">
            <div class="text-center text-primary">
                <h3><i class="fas fa-home"></i>&nbsp;DANH SÁCH NHÀ ĐẤT</h3> 
            </div>
            <br />
            <div class="row">
                <div class="col-lg-6">
                     <div style="margin-bottom: 8px;">
                        <a href="ThemNhaDat.aspx" class="btn btn-primary btn-sm">Thêm nhà đất bán</a>
                    </div>
                </div>
                <div class="col-lg-6 t">
                    <div class="row" style="margin-bottom: 5px">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-7"><span><asp:TextBox ID="txtKey" CssClass="form-control" placeholder="Nhập từ khóa" runat="server"></asp:TextBox></span></div>
                        <div class="col-lg-1"><span><asp:Button Text="Tìm" ID="btnTim" CssClass="btn btn-primary" runat="server" OnClick="btnTim_Click" /></span>   </div>
                    </div>
                    
                                         
                </div>
                
            </div>
            
            <div>
                <asp:MultiView ID="mul" ActiveViewIndex="0" runat="server">
                    <%--view danh sách--%>
                    <asp:View ID="v1" runat="server">
                        <asp:Repeater ID="list" runat="server" OnItemCommand="list_ItemCommand">
                            <HeaderTemplate>
                                <div class="table-responsive">
                                    <table class="table table-striped b-t b-light" border="1" style="border-color: #dddddd; font-size: 14px;">
                                        <thead>
                                        <tr style="background: #6e7bd9; color: white">
                                            <th class="text-center" style="color: white; border: 1px solid white; width: 30px;">#</th>
                                            <th class="text-center" style="color: white; border: 1px solid white; width: 100px;" >Ảnh</th>
                                            <th class="text-center" style="color: white; border: 1px solid white;" >Tiêu đề</th>
                                            <th class="text-center" style="color: white; border: 1px solid white; width: 110px; " >Danh mục</th>
                                            <th class="text-center" style="color: white; border: 1px solid white" >Giá</th>
                                            <th class="text-center" style="color: white; border: 1px solid white; width: 80px;" >Diện tích</th>
                                            <th class="text-center" style="color: white; border: 1px solid white" >Địa chỉ</th>
                                            <th class="text-center" style="color: white; border: 1px solid white; width: 70px;" ><i class="fas fa-eye"></i></th>
                                            <th class="text-center" style="color: white; border: 1px solid white; width: 80px;" >status</th>
                                            <th class="text-center" style="color: white; border: 1px solid white; width: 70px;">action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <tr style="background: white;">
                                    <td style="color: black;"> <%= stt++ %> </td>
                                    <td> 
                                        <asp:Image CssClass="imgshow" runat="server" ID="Image1" ImageUrl='<%#:Eval("image1") %>'   />
                                    </td>
                                    <td style="color: black;"><%# Eval("TieuDe") %></td>
                                    <td style="color: black;"><%# Eval("TenDanhMuc") %></td>
                                    <td style="color: black;"><%# Eval("Gia") %></td>
                                    <td style="color: black;"><%# Eval("DienTich") %></td>
                                    <td style="color: black;"><%# Eval("DiaChi") %></td>
                                    <td style="color: black;"><%# Eval("LuotXem") %></td>
                                    <td style="color: black;"><%# Convert.ToBoolean(Eval("status")) == true ? "<span class='text-primary'>Đã duyệt</span>" : "<i style='color: gray'>chờ Duyệt</i>" %></td>
                                    <td style="color: black;">
                                        <asp:LinkButton ID="LinkButton1" CommandArgument='<%#:Eval("Id") %>' runat="server" CommandName="update">
                                            <i class="far fa-edit"></i>
                                            <%--Sửa--%>
                                        </asp:LinkButton>
                                        &nbsp; 
                                        <asp:LinkButton ID="LinkButton2" OnClientClick="return confirm('Are you sure?');" CommandArgument='<%#:Eval("Id") %>' runat="server" CommandName="delete"> 
                                            <i class="fas fa-trash-alt"></i>
                                            <%--Xóa--%>
                                        </asp:LinkButton> 
                                    </td>
                                </tr>
                            </ItemTemplate>

                            <FooterTemplate>
                                        </tbody>
                                    </table>
                                </div>
                                <footer class="panel-footer">
                                    <div class="row">
                                    </div>
                                </footer>
                            </FooterTemplate>
                        </asp:Repeater>
                        <br />
                        <asp:Button ID="next" CssClass="btn btn-primary" Text="Tiếp theo..." runat="server" OnClick="next_Click" />
                    </asp:View>
                    <%--end view danh sách--%>

                    <%--view sửa--%>
                    <asp:View runat="server">
                        view 2
                    </asp:View>
                    <%--End view sửa--%>
                </asp:MultiView>
            </div>
        </div>
        <%--<div class="col-lg-1"></div>--%>
    </div>
    <script src="../assets/sweetalert.js"></script>
    <script>
        function a() {
            Swal.fire('Xin chào Nguyễn Văn Anh');
            return false;
        }

        function a1() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!',
            }).then(function () {
                if (!result.value) {
                    return false;
                }
            });
        }

        function alertDelSucess() {
            Swal.fire({
                title: 'Xóa thành công',
                icon: 'success',
            }).then(function () {
                
            });
        }
    </script>
</asp:Content>

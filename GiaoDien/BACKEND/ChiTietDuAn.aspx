<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="ChiTietDuAn.aspx.cs" Inherits="GiaoDien.BACKEND.ChiTietDuAn" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset=utf-8>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .check{
            width: 30px;
            height: 30px;
        }
    </style>
    <script runat="server">
        protected int stt = 1;
    </script>

    <div class="row">
        <div class="col-lg-1"></div>
            <div class="col-lg-10" >        
                <asp:MultiView ID="multi" ActiveViewIndex="0" runat="server">
                    <asp:View runat="server">
                        <br />
                        <div class="text-center">
                            <h2>DANH MỤC DỰ ÁN</h2>      
                        </div>
                        <br />
                        <div style="margin-bottom: 10px">
                            <asp:Button ID="btnThem" CssClass="btn btn-primary" runat="server" Text="Thêm mới" OnClick="btnThem_Click" />
                        </div>
                        <asp:Repeater ID="list" runat="server" OnItemCommand="list_ItemCommand">
                            <HeaderTemplate>
                               <div class="table-responsive" style="background: white">
                                    <table class="table table-head-custom table-vertical-center" id="kt_advance_table_widget_4">
                                        <thead>
                                        <tr class="text-left">
                                            <th class="text-center" style="width: 30px">#</th>
                                            <th>Tên dự Án</th>
                                            <th>Ảnh</th>
                                            <th>DanhMucDuAN</th>
                                            <th>Giá</th>
                                            <th>Diện Tích(M2)</th>
                                            <th>Ngày tạo</th>
                                            <th >Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%= stt++ %></td>
                                    <td><%# Eval("TenDuAn") %></td>
                                    <td><asp:Image ID="Image1"  runat="server" ImageUrl='<%#:Eval("Anh") %>' Width="75px" Height="75px" /></td>
                                    <td><%# Eval("TenDanhMuc") %></td>
                                    <td><%# Eval("Gia") %></td>
                                    <td><%# Eval("DienTich") %></td>
                                    <td><%# Convert.ToBoolean(Eval("status")) == true ? "Hiện" : "<span style='color: grey'>Ẩn</span>" %></td>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" CommandArgument='<%#:Eval("Id") %>' runat="server" CommandName="update">
                                            <i class="far fa-edit"></i>
                                            Sửa
                                        </asp:LinkButton>
                                        &nbsp; &nbsp; &nbsp;
                                        <asp:LinkButton ID="LinkButton2" OnClientClick="return confirm('Are you sure?');" CommandArgument='<%#:Eval("Id") %>' runat="server" CommandName="delete"> 
                                            <i class="fas fa-trash-alt"></i>
                                            Xóa
                                        </asp:LinkButton> 
                                    </td>
                                </tr>
                        
                            </ItemTemplate>
                            <FooterTemplate>
                                        </tbody>
                                    </table>
                                </div>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:View>

                    <%--view them--%>
                    <asp:View runat="server">
                        <div class="row">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-10">
                                <br />
                                <div class="text-center">
                                    <h2>THÊM DANH MỤC DỰ ÁN</h2>      
                                </div>
                                <br />
                                <div style="margin-bottom: 10px">
                                    <asp:Button ID="back_create" CssClass="btn btn-primary" runat="server" Text="Quay lại" OnClick="back_create_Click" />
                                </div>
                                <div class="panel panel-primary" style="border: 1px solid #dddddd; background: white; border-radius: 10px; padding: 30px 10px 30px 10px;">
				                    <div class="panel-body">
					                    <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Tên Dự Án <span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtTenDuAn_create" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>

					                    <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Ảnh<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
                                                <div>
                <div>
                    <asp:HiddenField ID="hdtenAnh" runat="server" />
                    <asp:Literal ID="lrtAnh" runat="server"></asp:Literal>

                </div>
                <asp:FileUpload ID="flAnh" required="" runat="server" />
            </div>
						                    </div>
					                    </div>
                                         <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Danh Mục Dự Án<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                      <asp:DropDownList ID="drDuAN" runat="server" DataSourceID="SqlDataSource1" DataTextField="TenDanhMuc" DataValueField="Id" Width="240px" Height="60px"></asp:DropDownList>
							                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString4 %>" SelectCommand="SELECT * FROM [tbl_DanhMucDuAn]"></asp:SqlDataSource>
							                    
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Mô tả<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <CKEditor:CKEditorControl ID="txtMoTa" runat="server"></CKEditor:CKEditorControl>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Địa Chỉ<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtDiaChi" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Giá<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtGia" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Chủ Đầu Tư<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtChuDauTu" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Diện tích(m2)<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtDienTich" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Tiến Độ<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtTienDo" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2"></div>
						                    <div class="col-md-10" style="font-size: 18px;">
                                                <asp:CheckBox ID="checkStatus_create" Checked="true" class="check" Text="" runat="server" /> &nbsp;&nbsp;Hiển thị
						                    </div>
					                    </div>
				
					                    <div class="row" style="margin-top:10px;">
						                    <div class="col-md-2"></div>
						                    <div class="col-md-10">
                                                <asp:Button ID="submit_create" Text="Thực hiện" CssClass="btn btn-primary" runat="server" OnClick="submit_create_Click" />
						                    </div>
					                    </div>
				                    </div>
			                    </div>
                            </div>
                            <div class="col-lg-1"></div>
                        </div>
                    </asp:View>

                    <%--view sua--%>
                    <asp:View runat="server">
                        <div class="row">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-10">
                                <br />
                                <div class="text-center">
                                    <h2>CẬP NHẬT CHI TIẾT DỰ ÁN</h2>      
                                </div>
                                <br />
                                <div style="margin-bottom: 10px">
                                    <asp:Button ID="back_edit"  CssClass="btn btn-primary" runat="server" Text="Quay lại" OnClick="back_edit_Click" />
                                </div>
                                <div class="panel panel-primary" style="border: 1px solid #dddddd; background: white; border-radius: 10px; padding: 30px 10px 30px 10px;">
				                    <div class="panel-body">
					                    <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Tên dự án<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtTenDanhMuc_edit" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        
					                    <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Ảnh<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
                                                <div>
                <div>
                    <asp:HiddenField ID="HdfTen1" runat="server" />
                    <asp:Literal ID="lrlanh1" runat="server"></asp:Literal>

                </div>
                <asp:FileUpload ID="flAnh1" runat="server" />
                <asp:HiddenField ID="linkanh" runat="server" />
            </div>
						                    </div>
					                    </div>
                                         <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Danh Mục Dự Án<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
                                              
                                                  <asp:DropDownList ID="drDuAn1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenDanhMuc" DataValueField="Id" Width="240px" Height="60px" OnSelectedIndexChanged="drDuAn1_SelectedIndexChanged"></asp:DropDownList>
							                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString4 %>" SelectCommand="SELECT * FROM [tbl_DanhMucDuAn]"></asp:SqlDataSource>
							                    

						                    </div>
					                    </div>
                                        
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Địa Chỉ<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtDiaCHi_edit" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Giá<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtGia_edit" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Chủ Đầu Tư<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtChuDauTu_edit" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Diện tích(m2)<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtDienTich_edit" type="number" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>
                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Tiến Độ<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
							                    <asp:TextBox ID="txtTienDo_edit" CssClass="form-control" runat="server"></asp:TextBox>
						                    </div>
					                    </div>


                                        <asp:HiddenField ID="hidden_id" runat="server" />

					                    <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2">Mô tả<span class="text-danger">*</span></div>
						                    <div class="col-md-10">
                                                <CKEditor:CKEditorControl ID="txtMoTa_edit" runat="server"></CKEditor:CKEditorControl>

						                    </div>
					                    </div>

                                        <div class="row" style="margin-top:5px;">
						                    <div class="col-md-2"></div>
						                    <div class="col-md-10" style="font-size: 18px;">
                                                <asp:CheckBox ID="checkStatus_edit" class="check" Text="" runat="server" /> &nbsp;&nbsp;Hiển thị
						                    </div>
					                    </div>
				
					                    <div class="row" style="margin-top:10px;">
						                    <div class="col-md-2"></div>
						                    <div class="col-md-10">
                                                <asp:Button ID="submit_edit" Text="Thực hiện" CssClass="btn btn-primary" runat="server" OnClick="submit_edit_Click"  />
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

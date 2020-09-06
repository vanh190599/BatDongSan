<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="ThemNhaDat.aspx.cs" Inherits="GiaoDien.BACKEND.ThemNhaDat" %> 
<%@ Register Namespace="CKEditor.NET" Assembly="CKEditor.NET"
TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .Duyet {
            font-size: 20px;
        }
    </style>

    <script src="../assets/sweetalert.js"></script>

    <div class="row">
        <div class="card-body d-flex justify-content-center">
            <div class="col-lg-9">
                <div class="text-center text-primary">
                    <h3> <i class="fas fa-home"></i>&nbsp; THÊM NHÀ ĐẤT BÁN</h3>
                </div>
                <div style="margin-bottom: 8px;">
                    <a href="DanhSach_NhaDat.aspx" class="btn btn-primary btn-sm">Quay lại</a>
                </div>

                <div style="border: 1px solid #dddddd; background: white; padding: 18px; border-radius: 5px; font-size: 14px;">
                    <div class="form-group">
                        <label>
                            Tiêu đề
                            <span class="text-danger">*</span>
                        </label>
                        <asp:TextBox ID="txtTieuDe" CssClass="form-control" value="" runat="server"></asp:TextBox>
                    </div>

                    <div class="row">
                        <%--Anh 1--%>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>
                                    Ảnh 1
                                    <span class="text-danger">*</span>
                                </label>
                                <br />
                                <asp:FileUpload onchange="Preview1()" ID="upload_image_1" runat="server" />
                                <br />

                                <div style="margin-top: 5px;">
                                    <img src="#" id="output1" style="width: 140px; height: 100px; border-radius: 5px; margin-bottom: 5px;" />
                                </div>

                                <script>
                                    function Preview1() {
                                        var out = document.getElementById("output1");
                                        out.src = URL.createObjectURL(event.target.files[0]);
                                        out.onload = function () {
                                            URL.revokeObjectURL(out.src);
                                        };
                                    }
                                </script>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>
                                    Ảnh 2
                                    <span class="text-danger">*</span>
                                </label>
                                <br />
                                <asp:FileUpload onchange="Preview2()" ID="upload_image_2" runat="server" />
                                <br />

                                <div style="margin-top: 5px;">
                                    <img src="#" id="output2" style="width: 140px; height: 100px; border-radius: 5px; margin-bottom: 5px;" />
                                </div>

                                <script>
                                    function Preview2() {
                                        var out = document.getElementById("output2");
                                        out.src = URL.createObjectURL(event.target.files[0]);
                                        out.onload = function () {
                                            URL.revokeObjectURL(out.src);
                                        };
                                    }
                                </script>
                            </div>
                        </div>

                        <%--image 3--%>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>
                                    Ảnh 3
                                    <span class="text-danger">*</span>
                                </label>
                                <br />
                                <asp:FileUpload onchange="Preview3()" ID="upload_image_3" runat="server" />
                                <br />

                                <div style="margin-top: 5px;">
                                    <img src="#" id="output3" style="width: 140px; height: 100px; border-radius: 5px; margin-bottom: 5px;" />
                                </div>

                                <script>
                                    function Preview3() {
                                        var out = document.getElementById("output3");
                                        out.src = URL.createObjectURL(event.target.files[0]);
                                        out.onload = function () {
                                            URL.revokeObjectURL(out.src);
                                        };
                                    }
                                </script>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>
                            Thuộc danh mục
                            <span class="text-danger">*</span>
                        </label>
                        <asp:DropDownList ID="listCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label>
                            Diện tích
                            <span class="text-danger">*</span>
                        </label>
                        <asp:TextBox ID="txtDienTich" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>
                            Giá bán
                            <span class="text-danger">*</span>
                        </label>
                        <asp:TextBox ID="txtGia" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>
                            Địa chỉ
                            <span class="text-danger">*</span>
                        </label>
                        <asp:TextBox ID="txtDiachi" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>
                            Liên hệ
                            <span class="text-danger">*</span>
                        </label>
                        <asp:TextBox ID="txtLienHe" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>
                            Mô tả
                            <span class="text-danger">*</span>
                        </label>
                        <CKEditor:CKEditorControl CssClass="ck" ID="txtMoTa" runat="server"> </CKEditor:CKEditorControl>
                    </div>

                    <div class="form-group">
                        <label>
                            Chi tiết
                            <span class="text-danger">*</span>
                        </label>
                        <CKEditor:CKEditorControl CssClass="ck" ID="txtChiTiet" runat="server"> </CKEditor:CKEditorControl>
                    </div>
                    <div class="form-group">
                        <asp:CheckBox ID="checkStatus" Checked="true" CssClass="Duyet" runat="server"  />
                        <span class="text-danger font-weight-bold" style="font-size: 20px;"><i>&nbsp;  Duyệt bài đăng</i></span>
                    </div>

                    <div class="text-center">
                        <asp:Button ID="Submit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="submit_click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function alertIMG() {
            Swal.fire({
                title: "vui lòng chọn ảnh!",
                icon: "info",
            });
        }

        var loadFile_1 = function (event) {
            var output = document.getElementById("image_1");
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function () {
                URL.revokeObjectURL(output.src);
            };
        };
    </script>
</asp:Content>

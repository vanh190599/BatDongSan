<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="SuaTinTuc.aspx.cs" Inherits="GiaoDien.BACKEND.SuaTinTuc" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <br />
            <div class="text-center">
                <h2>SỬA TIN TỨC</h2>      
            </div>
            <br />
            <div style="margin-bottom: 10px">
                <%--<asp:Button ID="back_edit"  CssClass="btn btn-primary" runat="server" Text="Quay lại" OnClick="back_edit_Click" />--%>
                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Quay lại" OnClick="btnBack_Click" />
                <table class="w-100">
                <tr>
                    <td class="auto-style1">Tên tin tức:</td>
                    <td>
                        <asp:TextBox ID="txtTen" runat="server" Width="503px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Mô tả ngắn:</td>
                    <td>
                        <asp:TextBox ID="txtMoTa" runat="server" Height="65px" Width="508px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Chi tiết:</td>
                    <td>
                        <CKEditor:CKEditorControl ID ="CKEditorControl1" runat="server"></CKEditor:CKEditorControl>
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
                        <asp:Image ImageUrl="imageurl" ID="imgSua" runat="server" Width="100px" />
                        <asp:FileUpload ID="FileUploadAnhSua" runat="server" Height="25px" Width="515px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Danh mục:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="46px" Width="341px" DataSourceID="SqlDataSource1" DataTextField="TenDanhMuc" DataValueField="Id">
                            
                        </asp:DropDownList>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString5 %>" SelectCommand="SELECT * FROM [tbl_DanhMucTinTuc]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Trạng thái:</td>
                    <td>
                        <asp:CheckBox ID="CheckBox1" Checked="true" class="check" Text="" runat="server" /> &nbsp;&nbsp;Hiển thị
                    </td>
                </tr>
                <asp:HiddenField ID="txtlink" runat="server" />
            </table>
                <div class="panel-body">
                    <div class="row" style="margin-top:10px;">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-10">
                            <%--<asp:Button ID="submit_edit" runat="server" CssClass="btn btn-primary" OnClick="submit_edit_Click" Text="Thực hiện" />--%>
                            <asp:Button ID="btnSua" CssClass="btn btn-primary" runat="server" Text="Thực hiện" OnClick="btnSua_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="Sua_NoiNgoaiThat.aspx.cs" Inherits="GiaoDien.BACKEND.Sua_NoiNgoaiThat" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .tb-sua tr {
            width: 100%;
            height: 70px;
        }

        .tb-sua {
            border: solid 1px gray;
            margin-top: 20px;
        }

        .tb-sua tr td:nth-child(1) {
            width: 30%;
            text-align: center;
            font-size: 22px;
        }

    </style>
     <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <br />
            <div class="text-center">
                <h2>SỬA NỘI NGOẠI THẤT</h2> 
                </div>
                <%-- <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Quay lại"/>--%>
                <a href="NoiNgoaiThat.aspx" class="btn btn-primary">Quay lại</a>
            <table class="w-100 tb-sua">
                <tr>
                    <td class="auto-style1">Tên nội thất:</td>
                    <td>
                        <asp:TextBox ID="txtSuaTenNoiThat" runat="server" Width="503px"></asp:TextBox>
                    </td>
                </tr>

                <asp:HiddenField ID="txtID" runat="server" />
                <asp:HiddenField ID="txtlink" runat="server" />
                <tr>
                    <td class="auto-style1">Mô tả ngắn:</td>
                    <td>
                        <asp:TextBox ID="txtSuaMoTa" runat="server" Height="65px" Width="508px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Chi tiết:</td>
                    <td>
                        <CKEditor:CKEditorControl ID ="txtSuaChiTiet" runat="server"></CKEditor:CKEditorControl>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Ảnh:</td>
                    <td>
                        <asp:FileUpload ID="SuaFileUpload" runat="server" Height="25px" Width="515px" />
                        <asp:Image ID="Image1" runat="server" Width="150px"/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Danh mục:</td>
                    <td>
                        <asp:DropDownList ID="drSuaDanhMuc" runat="server" Height="46px" Width="341px" DataSourceID="SqlDataSource1" DataTextField="tenDanhMuc" DataValueField="Id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString4 %>" SelectCommand="SELECT * FROM [tbl_DanhMucNoiNgoaiThat]"></asp:SqlDataSource>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Trạng thái:</td>
                    <td>
                        <asp:CheckBox ID="ckSuaTrangThai" Checked="true" class="check" Text="" runat="server" /> &nbsp;&nbsp;Hiển thị
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
                            <asp:Button ID="submit_edit" runat="server" CssClass="btn btn-primary" OnClick="submit_edit_Click" Text="Thực hiện" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="ChiTietNoiThat_GUI.aspx.cs" Inherits="GiaoDien.BACKEND.ChiTietNoiThat_GUI" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Thêm chi tiết nội thất</h1>
    <div id="main" style="margin:30px;">
        <h4>Chọn loại nội thất:</h4>
        <asp:DropDownList ID="drnoithat" runat="server" DataSourceID="SqlDataSource1" DataTextField="ten_noithat" DataValueField="id_noithat" Width="340px" Height="104px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString %>" SelectCommand="SELECT * FROM [tbl_NoiThat]"></asp:SqlDataSource>
        <h4>Id chi tiết nội thất:</h4>
        <asp:TextBox ID="txtIdchitietnt" runat="server" Width="573px"></asp:TextBox>
        <h4>Tiêu đề:</h4>
        <asp:TextBox ID="txttieude" runat="server" Width="571px"></asp:TextBox>
        <h4>Mô tả ngắn:</h4>
        <asp:TextBox ID="txtmota" runat="server" Height="113px" Width="568px"></asp:TextBox>
        <h4>Nội dung:</h4>
        <CKEditor:CKEditorControl ID="txtnoidung" runat="server"></CKEditor:CKEditorControl>

        
        <asp:Button  ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
        <asp:Button ID="Button1" runat="server" Text="Nhập lại" />
     </div>
    

</asp:Content>

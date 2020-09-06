<%@ Page Title="" Language="C#" MasterPageFile="~/BACKEND/Layout.Master" AutoEventWireup="true" CodeBehind="DsChiTietNoiThat.aspx.cs" Inherits="GiaoDien.BACKEND.DsChiTietNoiThat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString2 %>" DeleteCommand="DELETE FROM [tbl_chitietnoithat] WHERE [id_chitiet] = @id_chitiet" InsertCommand="INSERT INTO [tbl_chitietnoithat] ([id_chitiet], [tieude], [motangan], [noidung], [id_noithat]) VALUES (@id_chitiet, @tieude, @motangan, @noidung, @id_noithat)" SelectCommand="SELECT * FROM [tbl_chitietnoithat]" UpdateCommand="UPDATE [tbl_chitietnoithat] SET [tieude] = @tieude, [motangan] = @motangan, [noidung] = @noidung, [id_noithat] = @id_noithat WHERE [id_chitiet] = @id_chitiet">
        <DeleteParameters>
            <asp:Parameter Name="id_chitiet" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_chitiet" Type="String" />
            <asp:Parameter Name="tieude" Type="String" />
            <asp:Parameter Name="motangan" Type="String" />
            <asp:Parameter Name="noidung" Type="String" />
            <asp:Parameter Name="id_noithat" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tieude" Type="String" />
            <asp:Parameter Name="motangan" Type="String" />
            <asp:Parameter Name="noidung" Type="String" />
            <asp:Parameter Name="id_noithat" Type="String" />
            <asp:Parameter Name="id_chitiet" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id_chitiet" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            id_chitiet:
            <asp:Label ID="id_chitietLabel" runat="server" Text='<%# Eval("id_chitiet") %>' />
            <br />
            tieude:
            <asp:Label ID="tieudeLabel" runat="server" Text='<%# Eval("tieude") %>' />
            <br />
            motangan:
            <asp:Label ID="motanganLabel" runat="server" Text='<%# Eval("motangan") %>' />
            <br />
            noidung:
            <asp:Label ID="noidungLabel" runat="server" Text='<%# Eval("noidung") %>' />
            <br />
            id_noithat:
            <asp:Label ID="id_noithatLabel" runat="server" Text='<%# Eval("id_noithat") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>


</asp:Content>

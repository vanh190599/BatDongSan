<%@ Page Title="Danh mục - Nội ngoại thất" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="DanhMucNoiNgoaiThat.aspx.cs" Inherits="GiaoDien.FRONTEND.DanhMucNoiNgoaiThat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../assets/FrontEndCSS/DanhMucNoiNgoaiThat.css" rel="stylesheet" />

    
        <script src="../assets/frontend/front/js/bootstrap.min.js"></script>
        <script src="../assets/frontend/front/js/jquery.bootstrap-growl.min.js"></script>
        <script src="../assets/frontend/front/js/js.js"></script>
        <script src="../assets/frontend/front/js/jquery.js"></script>
        <script src="../assets/frontend/front/js/owl.carousel.min.js"></script>
    <style>
        .row.boxx:hover {
            box-shadow: 5px 10px 10px #dddddd;
            transition: 0.2s;
        }
    </style>
   <div class="row">
      <div class="col-lg-2">
          <img src="../assets/images/NoiNgoaiThat/quangcao-trai.jpg" />
      </div>
      <div class="col-lg-8">
          <%--Tim kiem--%>
          <br />
          <div class="row">
              <div class="col-lg-6">       
                    <asp:TextBox ID="txtTenSearch" CssClass="form-control" placeholder="Tìm kiếm tin tức..." runat="server"></asp:TextBox>
              </div>

              <div class="col-lg-3">
                    <asp:DropDownList ID="list_DanhMuc" runat="server" CssClass="form-control" Width="150px" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="TenDanhMuc" DataValueField="Id">
                        <asp:ListItem Selected="True" Value="-1">Chọn danh mục</asp:ListItem>
                    </asp:DropDownList>
                    <br/>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString5 %>" SelectCommand="SELECT * FROM [tbl_DanhMucNoiNgoaiThat]"></asp:SqlDataSource>
                   
              </div>
              <div class="col-lg-3"> <asp:Button ID="Button1" CssClass="btn btn-primary text-white" runat="server" Text="Tìm kiếm" OnClick="btnTimKiem_Click"/></div>           
         </div>
         <%--Tim kiem--%>


         <div style="color: gray; margin-top: 25px; margin-bottom: 25px" class="tieude-danhmuc">
            NỘI NGOẠI THẤT  / <%= tendanhmuc %>
             <hr />
         </div>
         <div class="block">
               <asp:DataList ID ="list_DanhMucNNT" runat="server">
                  <ItemTemplate>
                      <div class="row boxx">
                          <div class="col-4">
                              <div>
                                   <asp:HyperLink  NavigateUrl='<%# "ChiTietNoiNgoaiThat.aspx?Id=" + Eval("Id").ToString() %>' runat="server" >
                                      <asp:image imageurl='<%# Eval("Anh") %>' runat="server" Width="80%" CssClass="img" />
                                   </asp:HyperLink>
                              </div>
                          </div>
                          <div class="col-8">
                              <div class="content">
                           <div style="padding: 5px">
                              <span><img src="sao.jpg" alt=""></span>
                              <img style="width: 25px; height: 25px;margin-bottom: 10px; " src="../assets/images/NoiNgoaiThat/icon1.png" />
                              <span style="font-size: 20px; " class="text1">
                              <a href="ChiTietNoiNgoaiThat.aspx?Id=<%# Eval("Id") %>" style="font-size: 14px;color: #088A4B; text-decoration: none;"><%# Eval("TenNoiNgoaiThat") %></span></a>
                               <div style="color: #747c87; font-display:initial; font-size:12px" >
                                 <%# Eval("created_at") %>
                                </div>
                              <br />
                              <div style="color: #747c87; display: -webkit-box; font-size:12px;">
                                 <%# Eval("MoTa") %>
                              </div>
                              <asp:HyperLink  NavigateUrl='<%# "ChiTietNoiNgoaiThat.aspx?Id=" + Eval("Id").ToString() %>' runat="server" >
                                    <p style="color: green; display: -webkit-box; font-size:12px; font-display:inherit;">Xem chi tiết</p>
                              </asp:HyperLink>
                              
                           </div>
                        </div>
                          </div>
                      </div>
                      <hr />
                  </ItemTemplate>
               </asp:DataList>
              
         </div>
      </div>
      <div class="col-lg-2">
          <img src="../assets/images/NoiNgoaiThat/quangcao_phai.jpg" />
      </div>
   </div>
    <%--<div class="row">
        <asp:Label ID="Label1" runat="server" Text="Tìm kiếm nội ngoại thất"></asp:Label>
        <asp:TextBox ID="" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Tìm kiếm theo danh mục"></asp:Label>
        <asp:DropDownList ID="" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="tenDanhMuc" DataValueField="Id" Width="200px">
            <asp:ListItem Selected="True" Value="-1">Mời bạn chọn...</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnTimKiem" runat="server" Text="Tìm kiếm"  />
        <asp:SqlDataSource ID="" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString5 %>" SelectCommand="SELECT * FROM [tbl_DanhMucNoiNgoaiThat]"></asp:SqlDataSource>
    </div>--%>
</asp:Content>
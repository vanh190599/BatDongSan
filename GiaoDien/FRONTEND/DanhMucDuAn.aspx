<%@ Page Title="Danh mục - Dự án" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="DanhMucDuAn.aspx.cs" Inherits="GiaoDien.FRONTEND.DanhMucDuAnn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <script src="../assets/frontend/front/js/bootstrap.min.js"></script>
        <script src="../assets/frontend/front/js/jquery.bootstrap-growl.min.js"></script>
        <script src="../assets/frontend/front/js/js.js"></script>
        <script src="../assets/frontend/front/js/jquery.js"></script>
        <script src="../assets/frontend/front/js/owl.carousel.min.js"></script>

    <div class="row">
      <div class="col-lg-2">
          <img src="../assets/images/NoiNgoaiThat/quangcao-trai.jpg" />
      </div>
      <div class="col-lg-8">
         <div style="color: gray; margin-top: 25px; margin-bottom: 25px" class="tieude-danhmuc">
            NỘI NGOẠI THẤT  / <%= tendanhmuc %>
             <hr />
         </div>
         <div class="block">
               <asp:DataList ID ="list_DanhMucDuAn" runat="server">
                  <ItemTemplate>
                      <div class="row boxx">
                          <div class="col-4">
                              <div>
                                   <asp:HyperLink  NavigateUrl='<%# "ChiTietDuAn.aspx?Id=" + Eval("Id").ToString() %>' runat="server" >
                                      <asp:image imageurl='<%# Eval("Anh") %>' runat="server" Width="80%" CssClass="img" />
                                   </asp:HyperLink>
                              </div>
                          </div>
                          <div class="col-8">
                              <div class="content">
                                  <div>
                                      <a href="ChiTietDuAn.aspx?Id=<%# Eval("Id") %>" style="font-size: 14px;color: #055699; text-decoration: none; font-weight:bolder"><%# Eval("TenDuAn") %></span></a>
                                  </div>
                                  <div style="color: #747c87; font-display:initial; font-size:12px" >
                                     <%# Eval("DiaChi") %>
                                   </div>
                                  <div style="color: #747c87; display: -webkit-box; font-size:12px;">
                                     Giá từ: <%# Eval("Gia") %>
                                  </div>
                                  <div style="color: #747c87; display: -webkit-box; font-size:12px;">
                                     Chủ đầu tư: <%# Eval("ChuDauTu") %>
                                  </div>
                                  <div style="color: #747c87; display: -webkit-box; font-size:12px;">
                                     Diện tích: <%# Eval("Gia") %> m2
                                  </div>
                                  <div style="color: #747c87; display: -webkit-box; font-size:12px;">
                                     Tiến độ: <%# Eval("TienDo") %>
                                  </div>
                                  <asp:HyperLink  NavigateUrl='<%# "ChiTietDuAn.aspx?Id=" + Eval("Id").ToString() %>' runat="server" >
                                        <p style="color: green; display: -webkit-box; font-size:12px; font-display:inherit;">Xem chi tiết</p>
                                  </asp:HyperLink>
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
</asp:Content>

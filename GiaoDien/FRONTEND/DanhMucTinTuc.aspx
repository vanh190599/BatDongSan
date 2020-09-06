<%@ Page Title="" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="DanhMucTinTuc.aspx.cs" Inherits="GiaoDien.FRONTEND.DanhMucTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../assets/FrontEndCSS/DanhMucNoiNgoaiThat.css" rel="stylesheet" />
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
      <div class="col-lg-6">
          <br />
          <div class="row">
              <div class="col-lg-6">       
                    <asp:TextBox ID="txtTenSearch" CssClass="form-control" placeholder="Tìm kiếm tin tức..." runat="server"></asp:TextBox>
              </div>

              <div class="col-lg-3">
                    <asp:DropDownList ID="list_DanhMucSearch" runat="server" CssClass="form-control" Width="150px" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="TenDanhMuc" DataValueField="Id">
                        <asp:ListItem Selected="True" Value="-1">Chọn danh mục</asp:ListItem>
                    </asp:DropDownList>
                    <br/>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BatDongSanConnectionString5 %>" SelectCommand="SELECT * FROM [tbl_DanhMucTinTuc]"></asp:SqlDataSource>
                   
              </div>
              <div class="col-lg-3"> <asp:Button ID="btnTimKiem" CssClass="btn btn-primary text-white" runat="server" Text="Tìm kiếm" OnClick="btnTimKiem_Click" /></div>           
         </div>

         <div style="color: gray; margin-top: 25px; margin-bottom: 25px" class="tieude-danhmuc">
            TIN TỨC  / <%= TenDanhMuc %>
             <hr />
         </div>
         <div class="block">
               <asp:DataList ID ="list_DanhMucTinTuc" runat="server">
                  <ItemTemplate>
                      <div class="row boxx">
                          <div class="col-4">
                              <div>
                                   <asp:HyperLink  NavigateUrl='<%# "ChiTietTinTuc.aspx?Id=" + Eval("Id").ToString() %>' runat="server" >
                                      <asp:image imageurl='<%# Eval("Anh") %>' runat="server" Width="80%" CssClass="img" />
                                   </asp:HyperLink>
                              </div>
                          </div>
                          <div class="col-8">
                              <div class="content">
                           <div style="padding: 5px">
                              <span><img src="sao.jpg" alt=""></span>
                              <span style="font-size: 20px; " class="text1">
                              <a href="ChiTietTinTuc.aspx?Id=<%# Eval("Id") %>" style="font-size: 14px;color: #088A4B; text-decoration: none;"><%# Eval("TenTinTuc") %></span></a>
                               <div style="color: #747c87; font-display:initial; font-size:12px" >
                                 <%# Eval("created_at") %>
                                </div>
                              <br />
                              <div style="color: #747c87; display: -webkit-box; font-size:12px;">
                                 <%# Eval("MoTa") %>
                              </div>
                              <asp:HyperLink  NavigateUrl='<%# "ChiTietTinTuc.aspx?Id=" + Eval("Id").ToString() %>' runat="server" >
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
       <%--Top Luot Xem--%>
       <div class="col-lg-2">
           <br/>
           <br/>
           <br />
           <br />
           <br />
           <br />
           <br />

           <div class="row">
               <div class="card">
                   <div style="color: gray;  margin-top: 17px; font-weight: bold" class="tieude-danhmuc text-center">
                    TIN TỨC ĐƯỢC QUAN TÂM
                     <hr />
               </div>
        
               <div class="block">
               <asp:DataList ID ="list_TOPLX" runat="server">
                  <ItemTemplate>
                      <div class="row boxx">
                          <div class="col-4">
                              <div>
                                   <asp:HyperLink  NavigateUrl='<%# "ChiTietTinTuc.aspx?Id=" + Eval("Id").ToString() %>' runat="server" >
                                      <asp:image imageurl='<%# Eval("Anh") %>' runat="server" Width="80%" CssClass="img" />
                                   </asp:HyperLink>
                              </div>
                          </div>

                          <div class="col-8">
                                  <div class="content">
                                   <div style="padding: 5px">
                                      <span style="font-size: 20px; " class="text1">
                                      <a href="ChiTietTinTuc.aspx?Id=<%# Eval("Id") %>" style="font-size: 14px;color: #088A4B; text-decoration: none;"><%# Eval("TenTinTuc") %></span></a>      

                                   </div>
                            </div>
                          </div>
                      </div>
                      <hr />
                  </ItemTemplate>
               </asp:DataList>
              
          </div>
               </div>
            </div>
      </div>
      <div class="col-lg-2">
          <img src="../assets/images/NoiNgoaiThat/quangcao_phai.jpg" />
      </div>
   </div>
    
</asp:Content>

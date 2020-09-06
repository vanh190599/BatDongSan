<%@ Page Title="" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="ChiTietNhaDat.aspx.cs" Inherits="GiaoDien.FRONTEND.ChiTietNhaDat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Chi tiết nhà đất - <%= TieuDe %> </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <script src="../assets/frontend/front/js/bootstrap.min.js"></script>
   <script src="../assets/frontend/front/js/jquery.js"></script>
   <link href="../assets/frontend/front/css/bootstrap.min.css" rel="stylesheet" />
<%--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>
   <style type="text/css">
      .box{
          width: 300px; height: 240px; margin: 10px;
      }
      .box img{
          width: 300px; height: 240px;
      }
      .anh_modal{
          width: 600px; height: 400px;
          border: 2px solid #dddddd;
      }
      .modal1, .modal2, .modal3{
          width: 600px; 
          height: 400px;
          position: absolute;
          position: fixed;
          z-index: 100000;
          margin-left: 17%;
      }
   </style>

     <div class="row">
        <div class="col-lg-2">
            <br />
            <img style="margin-left: 50px" src="../assets/frontend/adv2.jpg" />
        </div>
        <div class="col-lg-8">

   <!-- Modal -->
   <div class="modal1" style="display: none;">
      <a href="#" style="position: absolute; right:10px; top: 10px; background: white; color: red; padding: 2px 4px 4px 4px; border-radius: 5px" class="close" ><b>ĐÓNG</b></a>
      <asp:Image CssClass="anh_modal" ID="imgModal1" runat="server" />
   </div>
   <div class="modal2" style="display: none;">
      <a href="#" style="position: absolute; right:10px; top: 10px; background: white; color: red; padding: 2px 4px 4px 4px; border-radius: 5px" class="close" ><b>ĐÓNG</b></a>
      <asp:Image CssClass="anh_modal" ID="imgModal2" runat="server" />
   </div>
   <div class="modal3" style="display: none;">
      <a href="#" style="position: absolute; right:10px; top: 10px; background: white; color: red; padding: 2px 4px 4px 4px; border-radius: 5px" class="close" ><b>ĐÓNG</b></a>
      <asp:Image CssClass="anh_modal" ID="imgModal3" runat="server" />
   </div>
   <br />
   <div style="color: gray;">
      Chi tiết đất bán / <%= TieuDe %>
   </div>
   <br />
   <div style="color: #2c2f36; text-transform: uppercase; font-size: 25px;">
      <%= TieuDe %>
   </div>
   <div style="color: gray;">
      <%= MoTa %>
   </div>
   <hr />
   <div style="display: flex;">
      <div style="width: 50px;"></div>
      <div style="width: 100px;">
         Mức giá:<br />
         <span class="font-weight-bold">
         <%= Gia %>
         </span>
      </div>
      <div style="width: 100px;"></div>
      <div style="width: 100px;">
         Diện tích:<br />
         <span class="font-weight-bold"> <%= DienTich %> m<sup>2</sup> </span>
      </div>
       <div style="width: 100px;"></div>
      <div style="width: 180px;">
         Liên hệ:<br />
         <span class="font-weight-bold"> <%= LienHe %> </sup> </span>
      </div>
       <div style="width: 100px;"></div>
      <div style="width: 100px;">
         Lượt xem:<br />
         <span class="font-weight-bold"> <%= LuotXem %> </sup> </span>
      </div>
   </div>
   <hr />
   <div style="color: gray; font-size: 14px;">
      <%= MoTa %>
   </div>
   <br />
   <!-- slide -->
   <div style="display: flex; justify-content: center;">
      <div class="box" style=" ">
         <div  style="border: 1px solid white; cursor: pointer;" ID="click-1">
            <asp:Image ID="Image111" runat="server" />
         </div>
      </div>
      <div class="box">
         <div  style="border: 1px solid white; cursor: pointer;" ID="click-2">
            <asp:Image ID="Image222" runat="server" />
         </div>
      </div>
      <div class="box"  >
         <div  style="border: 1px solid white; cursor: pointer;" ID="click-3">
            <asp:Image ID="Image333" runat="server" />
         </div>
      </div>
   </div>
   <!-- slide -->
   <br />
   <!-- chi tiet -->
   <div style="margin-top: 20px;">
      <%= ChiTiet %>
   </div>
   <script>
       $("#click-1").click(function () {
           $(".modal1").show();
       });

       $("#click-2").click(function () {
           $(".modal2").show();
       });

       $("#click-3").click(function () {
           $(".modal3").show();
       });

       $(".close").click(function () {
           $(".modal1").hide();
           $(".modal2").hide();
           $(".modal3").hide();
       });
   </script>

     </div>
        <div class="col-lg-2">
            <br />
            <img src="../assets/frontend/adv3.jpg" />
        </div>
    </div>
</asp:Content>
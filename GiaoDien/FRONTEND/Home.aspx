<%@ Page Title="" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GiaoDien.FRONTEND.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang chủ</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style>
	 .box:hover{
		box-shadow: 5px 10px 10px #dddddd;
	 }
     
     .box{
		border: 1px solid #dddddd; 
		width: 790px; 
		height: 250px; 
	}
	.anh1{
		width: 240px; 
		height: 160px; 
		border: 1px solid #dddddd;
		/*float: left;*/
		margin: 5px 0 5px 5px;
	}

	.content{
		float: left;
		width: 530px;
		height: 190px; 
		margin: 5px;
		padding: 0px 0px 0 5px
	}

	.text1{
		color: #c12f25;
		text-indent: 20px;
		text-transform: uppercase;
		font-weight: bold;
	}
	.anh2{
		margin-left: 5px;
		margin-right: 3px;
	}
	.anh2, .anh3{
         width: 115px;
         height: 70px;
     }
     .nut{
		 padding: 7px;
     }
	</style>

   <%--banner--%>
   <div class="home-center">
      <link href="../assets/login-2/css/font-awesome.css" rel="stylesheet" />
      <link href="../assets/frontend/bootstrap4/css/bootstrap.min.css" rel="stylesheet" />
      <script src="../assets/frontend/bootstrap4/js/bootstrap.min.js"></script>
       <script src="../assets/frontend/front/js/jquery.js"></script>
    
      <div class="banner-home-slide" style="background-image: url('../assets/frontend/front/images/banner1.png'); background-size: cover ">
         <div class="home-search">
            <div class="home-search-tool">
               <div class="home-search-content">
                  <div class="home-search-control">
                     <div class="search-input">
                        <asp:TextBox ID="txtSearch" runat="server" class="ui-autocomplete-input" placeholder="Tìm kiếm địa điểm, khu vực"></asp:TextBox>
                        <input type="hidden" id="keyWord" name="KeyWord" />
                     </div>
                     <div class="search-button">
                         <asp:Button ID="tim" Text="Tìm kiếm" class="btn-home-search" runat="server" OnClick="tim_Click" />
                        <%--<input type="button"  value="Tìm kiếm" id="btnSearch" />--%>
                     </div>
                     <div class="clear"></div>
                  </div>
               </div>
            </div>
         </div> 
         <div class="banner-cover" style="display: none;"></div>
      </div>
       
   </div>
   <%--banner--%>


    <div class="row">
        <div class="col-lg-2">
            <br />
            <img style="margin-left: 50px" src="../assets/frontend/adv2.jpg" />
        </div>
        <div class="col-lg-8">
            <hr />
    <div class="row">
        <div class="col-lg-12" style="color: #2d373f; margin-left: 0px; font-size: 28px">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
              <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
            </svg>
            TOP 10 NHÀ ĐẤT CÓ LƯỢT XEM NHIỀU NHẤT
        </div>
        
        <div class="col-lg-12">
             <div class="row">
                <div style="float: left; ">
                    <div style="width: 790px"></div>
                    <asp:DataList ID ="Datalist_top10" runat="server">
						<ItemTemplate>
					<div class="box" style="margin-top: 20px" >
						<div style="float: left">
                            <div>
								<asp:HyperLink CssClass="anh" NavigateUrl='<%# "ChiTietNhaDat.aspx?Id=" + Eval("Id").ToString() %>' runat="server" >
								<asp:image imageurl='<%# Eval("Image1") %>' CssClass="anh1 anh" runat="server" />
								</asp:HyperLink>
                            </div>
                            <div style="clear: both"></div>
                            <div>
                                <asp:image imageurl='<%# Eval("Image2") %>' CssClass="anh2 " runat="server" />
                                <asp:image imageurl='<%# Eval("Image3") %>' CssClass="anh3 " runat="server" />
                            </div>
						</div>

						<div class="content" style="float: left">
							<div style="padding: 5px">
								<span><img src="sao.jpg" alt=""></span>
								<img style="width: 20px; height: 20px;margin-bottom: 5px; " src="../assets/frontend/sao.JPG" />
								<span style="font-size: 14px; " class="text1">
                                    <a href="ChiTietNhaDat.aspx?Id=<%# Eval("Id") %>" style="font-size: 17px;color: #c12f25; text-decoration: none"><%# Eval("TieuDe") %></span></a>		
								<br />
								<p>
									<span style=""><b>Giá: <%# Eval("Gia") %></b></span>
									<span style="margin-left: 20px"><b><%# Eval("DienTich") %> m²</b></span>
									<span style="margin-left: 20px"><b><%# Eval("DiaChi") %></b></span>
								</p>
								<div style="color: #747c87; display: -webkit-box">
									<%# Eval("MoTa") %>
								</div>
								<div style="color: #747c87;" class="row" >
                                    <div class="col-lg-4"><%# Eval("created_at") %></div>   
                                    <div class="col-lg-3 text-right">Lượt xem: <%# Eval("LuotXem") %></div>
                                    <div class="col-lg-5 text-center" style="background: #004e7f; color: white; padding: 3px 0 3px 0; border-radius: 3px">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-telephone-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                          <path fill-rule="evenodd" d="M2.267.98a1.636 1.636 0 0 1 2.448.152l1.681 2.162c.309.396.418.913.296 1.4l-.513 2.053a.636.636 0 0 0 .167.604L8.65 9.654a.636.636 0 0 0 .604.167l2.052-.513a1.636 1.636 0 0 1 1.401.296l2.162 1.681c.777.604.849 1.753.153 2.448l-.97.97c-.693.693-1.73.998-2.697.658a17.47 17.47 0 0 1-6.571-4.144A17.47 17.47 0 0 1 .639 4.646c-.34-.967-.035-2.004.658-2.698l.97-.969z"/>
                                        </svg>

                                        &nbsp;<%# Eval("LienHe") %></div>
								</div>
							</div>
						</div>
					</div>
				</ItemTemplate>
						</asp:DataList>
                </div>
                <div style="float: left" >
                    <div style="border: 1px solid #dddddd; height: 300px; width: 210px; margin-left: 10px; margin-top: 20px ">
                        <p style="padding-top: 12px;" class="text primary font-weight-bold text-center text-primary" >Lọc theo diện tích</p>
                        <hr />
                        <ul style="margin-left: 50px; line-height: 30px; margin-top: 2px ">
                            <li><a href="Filter_NhaDat.aspx?from=0&to=30" style="color: #474d57; "><= 30 m<sup>2</sup></a></li>
                            <li><a href="Filter_NhaDat.aspx?from=30&to=50" style="color: #474d57; ">30 - 50 m<sup>2</sup></a></li>
                            <li><a href="Filter_NhaDat.aspx?from=50&to=80" style="color: #474d57; ">50 - 80 m<sup>2</sup></a></li>
                            <li><a href="Filter_NhaDat.aspx?from=80&to=100" style="color: #474d57; ">80 - 100 m<sup>2</sup></a></li> 
                            <li><a href="Filter_NhaDat.aspx?from=100&to=150" style="color: #474d57; ">100 - 150 m<sup>2</sup></a></li>  
                            <li><a href="Filter_NhaDat.aspx?from=150&to=9999999999999" style="color: #474d57; "> >150 m<sup>2</sup></a></li>  
                        </ul>
                    </div>

					<div style="border: 1px solid #dddddd; height: 300px; width: 210px; margin-left: 10px; margin-top: 10px ">
                        <p style="padding-top: 12px;" class="text primary font-weight-bold text-center text-primary" >Lọc theo giá</p>
                        <hr />
                        <ul style="margin-left: 50px; line-height: 30px; margin-top: 2px ">
                            <li><a href="#" style="color: #474d57; "><= 30 m2</a></li>
                            <li><a href="#" style="color: #474d57; ">30 - 50 m2</a></li>
                            <li><a href="#" style="color: #474d57; ">30 - 50 m2</a></li>
                            <li><a href="#" style="color: #474d57; ">30 - 50 m2</a></li>
                            <li><a href="#" style="color: #474d57; ">50 - 100 m2</a></li>
                            <li><a href="#" style="color: #474d57; ">100 - 150 m2</a></li>  
                            <li><a href="#" style="color: #474d57; ">150 - 200 m2</a></li>  
                        </ul>
                    </div>
                </div>   
            </div> 
        </div>
    </div>
    <hr />
        </div>
        <div class="col-lg-2">
            <br />
            <img src="../assets/frontend/adv3.jpg" />
        </div>
    </div>

    
    <script>

    </script>
    <br />

</asp:Content>
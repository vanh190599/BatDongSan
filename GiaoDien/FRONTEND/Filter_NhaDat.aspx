<%@ Page Title="" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="Filter_NhaDat.aspx.cs" Inherits="GiaoDien.FRONTEND.Filter_NhaDat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Lọc</title>
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

	<div class="row">
        <div class="col-lg-2">
            <br />
            <img style="margin-left: 50px" src="../assets/frontend/adv2.jpg" />
        </div>
        <div class="col-lg-8">

    <link href="../assets/login-2/css/font-awesome.css" rel="stylesheet" />
	<link href="../assets/frontend/bootstrap4/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../assets/frontend/bootstrap4/js/bootstrap.min.js"></script>

            <div style="color: gray; margin-top: 15px; margin-bottom: ">
				<%--Diện tích từ <%= from %> đến <%= to %>--%>
            </div>
            <div class="row">
                <div style="float: left; ">
                    <div style="width: 790px"></div>
                    <asp:DataList ID ="list_DanhMucNhaDat" runat="server">
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
								<div style="color: #747c87;" >
									<%# Eval("created_at") %>
								</div>
							</div>
						</div>
					</div>
				</ItemTemplate>
						</asp:DataList>
                </div>
                <div style="float: left" >
                    <div style="border: 1px solid #dddddd; height: 300px; width: 210px; margin-left: 10px; margin-top: 20px ">
                        <p style="padding-top: 12px;" class="text primary font-weight-bold text-center text-primary" >Lọc theo giá</p>
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
                        <p style="padding-top: 12px;" class="text primary font-weight-bold text-center text-primary" >Diện tích</p>
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
        <div class="col-lg-2">
            <br />
            <img src="../assets/frontend/adv3.jpg" />
        </div>
    </div>
    <br />
    <br />
</asp:Content>

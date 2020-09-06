<%@ Page Title="" Language="C#" MasterPageFile="~/FRONTEND/Layout-2.Master" AutoEventWireup="true" CodeBehind="covid19.aspx.cs" Inherits="GiaoDien.FRONTEND.covid19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
           /* body{
            font-size: 150%;
            }*/
            th {
                text-align: center;
            }
            .global{
                width: 30px;
                height: 30px;
            }
            .vietnam{
                width: 30px;
                margin-bottom: 3px;
            }
                .cases, .death, .recovered{
                width: 17px;
            }
         </style>
   <div class="row">
      <div class="col-lg-2"></div>
      <div class="col-lg-8">
         <script src="../assets/frontend/front/js/jquery.js"></script>
          <div class="row">
              <div class="col-lg-3"></div>
              <div class="col-lg-6" style="border: 1px solid #dddddd; margin-top: 20px; background: white; box-shadow: 0px 3px 3px 0px #888888;">
                       <h2 class="text-danger text-center p-2" style="font-size: 1.5rem">Covid-19</h2>
                       <br />
                       <p>Cập nhật số ca mắc covid-19</p>
                      <br />
                       <p style="font-size: 80%;">Cập nhật lúc: &nbsp; &nbsp; &nbsp;<span class="updated_at"></span></p>

                       <table class="table table-condensed" >
                          <thead>
                             <tr class="bg-info">
                                <th ></th>
                                <th class="text-light">Total</th>
                             </tr>
                          </thead>
                          <tbody>
                             <tr>
                                <td> <img src="images/3.png" class="" alt=""> Nhiễm</td>
                                <td class="text-center">
                                   <span class="total_cases"></span>
                                </td>
                             </tr>
                             <tr>
                                <td> <img src="images/recovered.png" class="cases" alt=""> Bình phục</td>
                                <td class="text-center">
                                   <span class="total_recovered"></span>
                                </td>
                             </tr>
                             <tr>
                                <td> <img src="images/recovered.png" class="cases" alt=""> Đang điều trị</td>
                                <td class="text-center">
                                   <span class="active_cases"></span>
                                </td>
                             </tr>
                             <tr>
                                <td> <img src="images/recovered.png" class="cases" alt=""> Ca mắc mới</td>
                                <td class="text-center">
                                   <span class="new_cases"></span>
                                </td>
                             </tr>
                             <tr>
                                <td><img src="images/death.png" class="death" alt=""> Tử vong</td>
                                <td class="text-center">
                                   <span class="total_deaths"></span>
                                </td>
                             </tr>
                          </tbody>
                       </table>
                  </div>
              <div class="col-lg-3"></div>
          </div>
      </div>
      <div class="col-lg-2"></div>
   </div>
        <script type="text/javascript">
            var url = "https://ncovi.huynhhieu.com/api.php?code=external-vn";
            $.getJSON(url, { name: 'Steve' }, function (data, textStatus, jqXHR) {
            })
                .done(function (data) {
                    $.each(data.data, function () {
                        $(".total_cases").html(this.total_cases);
                        $(".total_recovered").html(this.total_recovered);
                        $(".new_cases").html(this.new_cases);
                        $(".active_cases").html(this.active_cases);
                        $(".total_deaths").html(this.total_deaths);
                    });
                    $(".updated_at").html(data.updated_at);
                })
                .fail(function (jqxhr, settings, ex) { alert('failed, ' + ex); });
        </script>
       <div style="margin-bottom: 130px"></div>
</asp:Content>
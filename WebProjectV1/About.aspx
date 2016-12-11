<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebProjectV1.About" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
     .Team{
         text-align: justify;
     }
      .TeamImg {
          display: inline-block;
          width:350px;
          height: 420px;
     }
      #map {
        width: 100%;
        height: 400px;
        background-color: grey;
      }
      /*.Team:after{
          content:'';
          display: inline-block;
          width: 100%;
      }*/
 </style>
    <div>
      <h1 style="text-align:center; border-bottom:double; padding-bottom:20px">About Us</h1>
 </div>

 <div style="margin-left:70px">
     <asp:Image ID="ImgEntertainment" CssClass="ImgEntertainment img-responsive" ImageUrl="~/Images/sligo.jpg" runat="server" />
     <div style="padding-top:20px">
         <p>The antecedents of Sligo Entertainments began in the 1890s at the dawn of the disc gramophone. By 1902 it had become the beginnings of the Gramophone Company. 
             In February 1907 they commenced the building of a new dedicated record factory at Hayes, Middlesex. Disc records were sold in music shops and independent retailers at this time. 
             In 1921 the Gramophone Company opened the first dedicated Sligo Entertainments shop in O'Connel Street, Sligo, the composer Edward Elgar participated in the opening ceremonies.
             In March 1931 the Gramophone Company merged with Columbia Graphophone Company to form Electric and Musical Industries Ltd.</p>
     </div>
   <div style="padding-bottom:50px">
      <h1 style="text-align:center; border-bottom:double; border-top:double; padding-bottom:20px; padding-top:15px">Our Team</h1>
 </div>
     <div class="row">
         <div class="col-md-4 col-xs-12">
             <img class="img-circle" src="Images/img1.jpg" width="250" height="250" />
             <p>CEO</p>
             <p>Vanessa Foley</p>
         </div>
         <div class="col-md-4 col-xs-12">
             <img class="img-circle" src="Images/img2.jpg" width="250" height="250" />
             <p>Vice Chairperson</p>
             <p>Gary Reynolds</p>
         </div>
         <div class="col-md-4 col-xs-12">
             <img class="img-circle" src="Images/img3.jpg" width="250" height="250" />
             <p>Co-Manager</p>
             <p>Darragh McGowan</p>
         </div>
     </div>
     
      <div id="map" class="embed-responsive"></div>
     <!--<div class="Team">
         <asp:Image ID="ImgTeam1" ImageUrl="~/Images/img1.jpg"  CssClass="TeamImg img-responsive img-circle" runat="server" />
         <asp:Image ID="ImgTeam2" ImageUrl="~/Images/img2.jpg"  CssClass="TeamImg img-responsive img-circle" runat="server" />
         <asp:Image ID="ImgTeam3" ImageUrl="~/Images/img3.jpg"  CssClass="TeamImg img-responsive img-circle" runat="server" />
     </div>-->
    </div>
    <script>
      function initMap() {
          var lnglat = { lat: 54.271728, lng: -8.476311 }; //setting co-ordinates
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 10,
          center: lnglat
        });
        var marker = new google.maps.Marker({
          position: lnglat, //applys position to map
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC18iUwB1wQka_RXQfRDNqURoZclDz_P6Q&callback=initMap"> <%--API key --%>
    </script>
</asp:Content>

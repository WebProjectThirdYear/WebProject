<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebProjectV1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="jumbotron">
        <p class="text-center">TOP RATED MOVIES</p>
    </header>
    <div id="owl-demo">
        <div class="thumbnail text-center item">
            <img class="productImage img-responsive" src="Images/Products/no_image.png" alt="Owl Image">
            <div class="caption">
                <h3 class="productTitle">Title</h3>
                <p class="productPrice">€0.00</p>              
            </div>
            <button type="button" class="btn btn-default">BUY NOW</button>
        </div>
        <div class="thumbnail text-center item">
            <img class="productImage img-responsive" src="Images/Products/no_image.png" alt="Owl Image">
            <div class="caption">
                <h3 class="productTitle">Title</h3>
                <p class="productPrice">€0.00</p>              
            </div>
            <button type="button" class="btn btn-default">BUY NOW</button>
        </div>  
        <div class="thumbnail text-center item">
            <img class="productImage img-responsive" src="Images/Products/no_image.png" alt="Owl Image">
            <div class="caption">
                <h3 class="productTitle">Title</h3>
                <p class="productPrice">€0.00</p>              
            </div>
            <button type="button" class="btn btn-default">BUY NOW</button>
        </div>  
        <div class="thumbnail text-center item">
            <img class="productImage img-responsive" src="Images/Products/no_image.png" alt="Owl Image">
            <div class="caption">
                <h3 class="productTitle">Title</h3>
                <p class="productPrice">€0.00</p>
                <button type="button" class="btn btn-default">BUY NOW</button>
            </div>
        </div>
        <div class="thumbnail text-center item">
            <img class="productImage img-responsive" src="Images/Products/no_image.png" alt="Owl Image">
            <div class="caption">
                <h3 class="productTitle">Title</h3>
                <p class="productPrice">€0.00</p>
                <button type="button" class="btn btn-default">BUY NOW</button>
            </div>
        </div>
        <div class="thumbnail text-center item">
            <img class="productImage img-responsive" src="Images/Products/no_image.png" alt="Owl Image">
            <div class="caption">
                <h3 class="productTitle">Title</h3>
                <p class="productPrice">€0.00</p>
                <button type="button" class="btn btn-default">BUY NOW</button>
            </div>
        </div>
        <div class="thumbnail text-center item">
            <img class="productImage img-responsive" src="Images/Products/no_image.png" alt="Owl Image">
            <div class="caption">
                <h3 class="productTitle">Title</h3>
                <p class="productPrice">€0.00</p>
            </div>
            <button type="button" class="btn btn-default">BUY NOW</button>
        </div>
        <div class="thumbnail text-center item">
            <img class="productImage img-responsive" src="Images/Products/no_image.png" alt="Owl Image">
            <div class="caption">
                <h3 class="productTitle">Title</h3>
                <p class="productPrice">€0.00</p>
                <button type="button" class="btn btn-default">BUY NOW</button>
            </div>
        </div>
    </div>
    <script src="Scripts/owl.carousel.js"></script>
    <script>
        var randomMovieArray = ['Star Wars', 'Game of Thrones', 'Harry Potter', 'Lord of the Rings', 'Indiana Jones', 'Meet The Fockers', 'Dumb and Dumber'];

        $("#owl-demo").owlCarousel({
            autoPlay: 3000,
            items: 4,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3]
        });

        // pull down data from OMDb API
        function apiCall() {
            $("div.item").each(function (i) {
                var randomNumber = Math.floor((Math.random() * randomMovieArray.length - 1) + 1);
                var randomMovie = randomMovieArray[randomNumber];
                (function (i) { // protects i in an immediately called function
                    $.getJSON('https://www.omdbapi.com/?t=' + encodeURI(randomMovie), function (response) {
                        image = response.Poster;
                        title = response.Title;
                        
                        $(".productTitle").eq(i).text(title);
                        if (image !== "N/A") {                   
                            $(".productImage").eq(i).attr('src', image);
                        }
                    });
                })(i);
            });
        }
        apiCall();
                      
    </script>
</asp:Content>

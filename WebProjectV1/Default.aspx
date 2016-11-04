<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebProjectV1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="jumbotron">
        <p class="text-center">TOP RATED MOVIES</p>
    </header>
    <div id="owl-demo">
        <div class="item1">
            <img src="Images/Products/no_image.png" alt="Owl Image"></div>
        <div class="item2">
            <img src="Images/Products/no_image.png" alt="Owl Image"></div>
        <div class="item3">
            <img src="Images/Products/no_image.png" alt="Owl Image"></div>
        <div class="item4">
            <img src="Images/Products/no_image.png" alt="Owl Image"></div>
        <div class="item5">
            <img src="Images/Products/no_image.png" alt="Owl Image"></div>
        <div class="item6">
            <img src="Images/Products/no_image.png" alt="Owl Image"></div>
        <div class="item7">
            <img src="Images/Products/no_image.png" alt="Owl Image"></div>
        <div class="item8">
            <img src="Images/Products/no_image.png" alt="Owl Image"></div>
    </div>
    <script src="Scripts/owl.carousel.js"></script>
    <script>
        var randomMovieArray = ['Star Wars', 'Game of Thrones', 'Harry Potter', 'Lord of the Rings'];

        $("#owl-demo").owlCarousel({
            autoPlay: 3000,
            items: 4,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3]
        });

        /*function apiCallCarousel() {
            var image, title, rating;
            $.getJSON('https://www.omdbapi.com/?t=' + encodeURI(randomMovie)).then(function (response) {
                $("img").each(function () {
                    var randomNumber = Math.floor((Math.random() * randomMovieArray.length - 1) + 1);
                    var randomMovie = randomMovieArray[randomNumber];

                    image = response.Poster;
                    title = response.Title;
                    rating = response.imdbRating;

                    if (image !== "N/A") {
                        $(this).attr('src', image);
                    }
                });
            });*/

        function apiCall() {
            $("img").each(function (i) {
                var randomNumber = Math.floor((Math.random() * randomMovieArray.length - 1) + 1);
                var randomMovie = randomMovieArray[randomNumber];
                (function (i) { // protects i in an immediately called function
                    $.getJSON('https://www.omdbapi.com/?t=' + encodeURI(randomMovie), function (response) {
                        image = response.Poster;
                        title = response.Title;
                        rating = response.imdbRating;

                        if (image !== "N/A") {
                            console.log(i);
                            $("img").eq(i).attr('src', image);
                        }
                    });
                })(i);
            });
        }

        apiCall();
                      
    </script>
</asp:Content>

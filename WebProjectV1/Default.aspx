<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebProjectV1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="jumbotron">
        <p class="text-center">TOP RATED MOVIES</p>
    </header>
    <div id="owl-demo">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="thumbnail text-center">
                    <img class="productImage" src='<%# Eval("Poster") %>'
                        alt='<%# Eval("ProductName") %>' />
                    <div class="caption">
                        <h3><%# Eval("ProductName") %></h3>
                        <p><b>Price: <%# Eval("UnitPrice", "{0:c}") %></b>
                    </div>
                    <asp:Button ID="btnAdd" type="button" CssClass="btn btn-default" runat="server" PostBackUrl="~/OrderPage.aspx" Text="BUY NOW"></asp:Button>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Products] ([ProductName], [Genre], [UnitPrice], [Plot], [Rating], [Runtime], [Poster], [Year]) VALUES (@ProductName, @Genre, @UnitPrice, @Plot, @Rating, @Runtime, @Poster, @Year)" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [Genre] = @Genre, [UnitPrice] = @UnitPrice, [Plot] = @Plot, [Rating] = @Rating, [Runtime] = @Runtime, [Poster] = @Poster, [Year] = @Year WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="Genre" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="Plot" Type="String" />
            <asp:Parameter Name="Rating" Type="Decimal" />
            <asp:Parameter Name="Runtime" Type="String" />
            <asp:Parameter Name="Poster" Type="String" />
            <asp:Parameter Name="Year" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="Genre" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="Plot" Type="String" />
            <asp:Parameter Name="Rating" Type="Decimal" />
            <asp:Parameter Name="Runtime" Type="String" />
            <asp:Parameter Name="Poster" Type="String" />
            <asp:Parameter Name="Year" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

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

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebProjectV1.Products" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="jumbotron">
        <p class="text-center">OUR MOVIES</p>
    </header>

    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="col-sm-4">
                    <div class="thumbnail text-center">
                        <a href="#"><img class="productImage" runat="server" src='<%# Eval("Poster") %>' 
                            alt='<%# Eval("ProductName") %>' /></a>
                        <div class="caption">
                            <a href="#"><h3 id="prodName" runat="server"><%# Eval("ProductName") %></h3></a>
                            <p><b>Price: <%# Eval("UnitPrice", "{0:c}") %></b>
                        </div>
                        <asp:Button ID="btnAdd" type="button" CssClass="btn btn-default" runat="server" OnClick="btnAdd_Click" Text="BUY NOW"></asp:Button>
                    </div>
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

</asp:Content>

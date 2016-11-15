<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebProjectV1.Products" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="col-sm-4">
                    <div class="thumbnail">
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Products] ([ProductName], [Genre], [ReleaseDate], [UnitPrice], [Plot], [Rating], [Runtime]) VALUES (@ProductName, @Genre, @ReleaseDate, @UnitPrice, @Plot, @Rating, @Runtime)" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [Genre] = @Genre, [ReleaseDate] = @ReleaseDate, [UnitPrice] = @UnitPrice, [Plot] = @Plot, [Rating] = @Rating, [Runtime] = @Runtime WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="Genre" Type="String" />
            <asp:Parameter DbType="Date" Name="ReleaseDate" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="Plot" Type="String" />
            <asp:Parameter Name="Rating" Type="Int32" />
            <asp:Parameter Name="Runtime" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="Genre" Type="String" />
            <asp:Parameter DbType="Date" Name="ReleaseDate" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="Plot" Type="String" />
            <asp:Parameter Name="Rating" Type="Int32" />
            <asp:Parameter Name="Runtime" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

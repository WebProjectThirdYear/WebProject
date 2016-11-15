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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" SelectCommand="SELECT [Id], [ProductName], [Genre], [ReleaseDate], [UnitPrice], [Description] FROM [Products] ORDER BY [ProductName]"></asp:SqlDataSource>
    </asp:Content>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="WebProjectV1.ProductDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="jumbotron">
        <p class="text-center">MOVIE DETAILS</p>
    </header>

    <div id="productDetails">
        <h3 id="prodName" runat="server"></h3>
        <br />
        <asp:Image ID="imgProduct" runat="server" />
        <br />
        <h4 id="prodPrice"></h4>
        <br />
        <asp:Label ID="lblRuntime" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblYear" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblRating" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblPlot" runat="server"></asp:Label>


 
    </div>

</asp:Content>

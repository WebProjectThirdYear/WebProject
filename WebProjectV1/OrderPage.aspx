<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderPage.aspx.cs" Inherits="WebProjectV1.OrderPage" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="jumbotron">
        <p class="text-center">ORDER PAGE</p>
    </header>

    <div class="row">
        <%-- row 1 --%>
        <div class="col-sm-8">
            <%-- product drop down and info column --%>
            <div class="form-group">
                <label class="col-sm-5">Please select a product:</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True"
                        DataSourceID="SqlDataSource1" DataTextField="ProductName"
                        DataValueField="Id" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString='<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>'
                        SelectCommand="SELECT * FROM [Products] ORDER BY [ProductName]"></asp:SqlDataSource>
                </div>
            </div>
            <div class="col-sm-12">
                <h4>
                    <asp:Label ID="lblName" runat="server"></asp:Label></h4>
            </div>
            <div class="col-sm-12">
                <label class="col-sm-3 lblProduct">Genre:</label>
                <asp:Label CssClass="co-sm-9" ID="lblGenre" runat="server"></asp:Label>
            </div>
            <div class="col-sm-12">
                <label class="col-sm-3 lblProduct">Runtime:</label>
                <asp:Label CssClass="co-sm-9" ID="lblRuntime" runat="server"></asp:Label>
            </div>
            <div class="col-sm-12">
                <label class="col-sm-3 lblProduct">Year:</label>
                <asp:Label CssClass="co-sm-9" ID="lblYear" runat="server"></asp:Label>
            </div>
            <div class="col-sm-12">
                <label class="col-sm-3 lblProduct">Unit Price:</label>
                <asp:Label CssClass="co-sm-9" ID="lblUnitPrice" runat="server"></asp:Label>
            </div>
            <div class="col-sm-12">
                <label class="col-sm-3 lblProduct">Plot:</label>
                <asp:Label CssClass="co-sm-9" ID="lblPlot" runat="server"></asp:Label>
            </div>
        </div>

        <div class="col-sm-4">
            <%-- product image column --%>
            <asp:Image ID="imgProduct" CssClass="imgProduct" runat="server" />
        </div>
    </div>
    <%-- end of row 1 --%>
    <div class="row">
        <%-- row 2 --%>
        <div class="col-sm-12">
            <div class="form-group">
                <label class="col-sm-1">Quantity:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtQuantity" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                        runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                        ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger"
                        ControlToValidate="txtQuantity" Display="Dynamic"
                        ErrorMessage="Quantity must range from 1 to 500."
                        MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                </div>
            </div>
            <br />
            <br />
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart"
                        OnClick="btnAdd_Click" CssClass="btn btn-default" />
                    <asp:Button ID="btnCart" runat="server" Text="Go to Cart"
                        PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn btn-default" OnClick="btnCart_Click" />
                </div>
            </div>
        </div>
    </div>
    <%-- end of row 2 --%>
</asp:Content>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebProjectV1.Products" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="jumbotron">
        <p class="text-center">OUR MOVIES</p>
    </header>
        <div class="form-group">
        <label class="control-label col-sm-2">Filter By</label>
        <div class="col-sm-5">
            <asp:DropDownList ID="DropDownGenreFilter" ForeColor="Black" runat="server" DataSourceID="SqlDataSource2" DataTextField="Genre" DataValueField="Id" OnSelectedIndexChanged="DropDownGenreFilter_SelectedIndexChanged" AutoPostBack="True">

            </asp:DropDownList>
        </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" SelectCommand="SELECT * FROM [Genre]"></asp:SqlDataSource>
    </div>
    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div class="col-sm-4">
                    <div class="thumbnail text-center">
                        <a href="#"><img class="productImage" runat="server" src='<%# Eval("Poster") %>' 
                            alt='<%# Eval("ProductName") %>' /></a>
                        <div class="caption">
                            <a href="#"><h3 id="prodName" runat="server"><%# Eval("ProductName") %></h3></a>
                            <p><b>Price: <%# Eval("UnitPrice", "{0:c}") %></b>
                        </div>
                        <asp:Button ID="btnAdd" type="button" CssClass="btn btn-primary" runat="server" PostBackUrl="~/OrderPage.aspx" Text="BUY NOW"></asp:Button>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([Genre] LIKE '%' + @Genre + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownGenreFilter" Name="Genre" PropertyName="SelectedItem.Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

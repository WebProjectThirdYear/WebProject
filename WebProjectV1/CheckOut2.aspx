<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut2.aspx.cs" Inherits="WebProjectV1.CheckOut2" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h1>Shipping And Payment</h1>

    <h3>Shipping Method</h3>
    <div class="form-group">
        <label class="control-label col-sm-2">Choose one:</label>
        <div class="col-sm-10">
            <asp:RadioButtonList ID="rblShipping" runat="server">
                <asp:ListItem Selected="True">UPS Ground</asp:ListItem>
                <asp:ListItem>UPS Second Day</asp:ListItem>
                <asp:ListItem>Federal Express Overnight</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>

    <h3>Payment Information</h3>
    <div class="form-group">
        <label class="control-label col-sm-2">Card Type:</label>
        <div class="col-sm-5">
            <asp:DropDownList ID="ddlCardType" runat="server" CssClass="form-control">
                <asp:ListItem Selected="True" Value="None">--Select a credit card--</asp:ListItem>
                <asp:ListItem>VISA</asp:ListItem>
                <asp:ListItem Value="MC">MasterCard</asp:ListItem>
                <asp:ListItem Value="AMEX">American Express</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvCardType" runat="server" ControlToValidate="ddlCardType"
                Display="Dynamic" ErrorMessage="Required" InitialValue="None" 
                CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Card number</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtCardNumber"></asp:RequiredFieldValidator> 
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Expiration date:</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtExpiration" runat="server" CssClass="form-control" TextMode="DateTime"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvExpiration" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtExpiration"></asp:RequiredFieldValidator> 
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAccept" runat="server" Text="Accept Order" 
                CssClass="btn" OnClick="btnAccept_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
                CausesValidation="False" CssClass="btn" OnClick="btnCancel_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" DeleteCommand="DELETE FROM [Order] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Order] ([Id], [CustomerID], [Total], [HasBeenShipped]) VALUES (@Id, @CustomerID, @Total, @HasBeenShipped)" SelectCommand="SELECT * FROM [Order]" UpdateCommand="UPDATE [Order] SET [CustomerID] = @CustomerID, [Total] = @Total, [HasBeenShipped] = @HasBeenShipped WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="CustomerID" Type="String" />
                    <asp:Parameter Name="Total" Type="Decimal" />
                    <asp:Parameter Name="HasBeenShipped" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CustomerID" Type="String" />
                    <asp:Parameter Name="Total" Type="Decimal" />
                    <asp:Parameter Name="HasBeenShipped" Type="Boolean" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" DeleteCommand="DELETE FROM [OrderDetails] WHERE [Id] = @Id" InsertCommand="INSERT INTO [OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (@Id, @OrderID, @ProductID, @Quantity, @UnitPrice)" SelectCommand="SELECT * FROM [OrderDetails]" UpdateCommand="UPDATE [OrderDetails] SET [OrderID] = @OrderID, [ProductID] = @ProductID, [Quantity] = @Quantity, [UnitPrice] = @UnitPrice WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="OrderID" Type="Int32" />
                    <asp:Parameter Name="ProductID" Type="Int32" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="OrderID" Type="Int32" />
                    <asp:Parameter Name="ProductID" Type="Int32" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut1.aspx.cs" Inherits="WebProjectV1.CheckOut1" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h1>Check Out Page</h1>
    <div class="form-group">
        <label class="control-label col-sm-2">First Name:</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Last Name:</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator> 
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Email</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator> 
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Address1</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator> 
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Address 2</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Address 3</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtAddress3" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">City</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator> 
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Post Code</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">County</label>
        <div class="col-sm-5">
            <asp:DropDownList ID="DropDownCountys" runat="server" ForeColor="Black" Font-Bold="true" Width="280" Height="40" DataSourceID="SqlDataSource2" DataTextField="CountyName" DataValueField="Id"></asp:DropDownList>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Phone</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                ErrorMessage="Required" CssClass="text-danger" 
                Display="Dynamic" ControlToValidate="txtPhone"></asp:RequiredFieldValidator> 
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnCheckOut" runat="server" Text="Continue Checkout" 
                CssClass="btn" OnClick="btnCheckOut_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
                CausesValidation="False" CssClass="btn" OnClick="btnCancel_Click" />
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" SelectCommand="SELECT * FROM [AspNetUsers]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" SelectCommand="SELECT * FROM [County]"></asp:SqlDataSource>
</asp:Content>

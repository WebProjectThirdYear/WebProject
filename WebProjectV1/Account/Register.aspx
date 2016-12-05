<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebProjectV1.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="FirstName"
                    CssClass="text-danger" ErrorMessage="The first name field is required." />
            </div>
        </div>
                <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Surname" CssClass="col-md-2 control-label">Surname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Surname" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Surname"
                    CssClass="text-danger" ErrorMessage="The surname field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
                <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DOB" CssClass="col-md-2 control-label">Date of Birth</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="DOB" CssClass="form-control" Width="280px" TextMode="Date"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="DOB"
                    CssClass="text-danger" ErrorMessage="The Date of Birth field is required." />
                <%--<asp:RangeValidator ID="DOBVal" ControlToValidate="DOB" Display="Dynamic" runat="server" CssClass="text-danger" ErrorMessage="Invalid date of birth"></asp:RangeValidator>--%>

            </div>
        </div>
             <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address1" CssClass="col-md-2 control-label">Address Line 1</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Address1" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Address1"
                    CssClass="text-danger" ErrorMessage="The address line 1 field is required." />
            </div>
        </div>
                     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address2" CssClass="col-md-2 control-label">Address Line 2</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Address2" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Address2"
                    CssClass="text-danger" ErrorMessage="The address line 2 field is required." />
            </div>
        </div>
                    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address3" CssClass="col-md-2 control-label">Address Line 3</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Address3" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Address3"
                    CssClass="text-danger" ErrorMessage="The address line 3 field is required." />
            </div>
        </div>
                    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="City" CssClass="col-md-2 control-label">City</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="City" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="City"
                    CssClass="text-danger" ErrorMessage="The city field is required." />
            </div>
        </div>
                            <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DropDownCountys" CssClass="col-md-2 control-label">County</asp:Label>
            <div class="col-md-10">
                 <asp:DropDownList ID="DropDownCountys" ForeColor="Black" Font-Bold="true" Width="280" Height="40" runat="server" DataSourceID="SqlDataSource1" DataTextField="CountyName" DataValueField="Id"></asp:DropDownList>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SligoEntertainmentDBConnectionString %>" SelectCommand="SELECT * FROM [County]"></asp:SqlDataSource>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>

﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebProjectV1.Cart" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row"><%-- row 1 --%>
        <div class="col-sm-6"><%-- cart display column --%>
            <div class="form-group">
                <div class="col-sm-12"><asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox></div>
            </div>
        </div>
        <div class="col-sm-6"><%-- cart edit buttons column --%>
            <div class="form-group">
                <div class="col-sm-12"><asp:Button ID="btnRemove" runat="server" 
                    Text="Remove Item" onclick="btnRemove_Click" CssClass="btn btn-default" /></div>
                <div class="col-sm-12"><asp:Button ID="btnEmpty" runat="server" 
                    Text="Empty Cart" onclick="btnEmpty_Click" CssClass="btn btn-default" /></div>
            </div>
        </div>
    </div><%-- end of row 1 --%>
    <div class="row"><%-- row 2 --%>
        <div class="col-sm-12">
            <div class="form-group"><%-- message label --%>
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False"
                    CssClass="text-info col-sm-12"></asp:Label>
            </div>
            <div class="form-group"><%-- buttons --%>
                <div class="col-sm-12">
                    <asp:Button ID="btnContinue" runat="server"
                        PostBackUrl="~/OrderPage.aspx" Text="Continue Shopping" CssClass="btn btn-default" />
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" PostBackUrl="~/CheckOut1.aspx"  
                         CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </div><%-- end of row 2 --%>
</asp:Content>
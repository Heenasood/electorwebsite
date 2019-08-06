<%@ Page Title="" Language="C#" MasterPageFile="~/UniversalSite.Master" AutoEventWireup="true" CodeBehind="Error403.aspx.cs" Inherits="SmartE.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="align-content:center; margin-top:50px;">
   <center>
       <h2 style="font-weight:bold; color:red; font-style:italic;">Oops! 403 Forbidden Error</h2>
    <asp:Button ID="btnHome" runat="server" CssClass="button primary fit" Text="Back Home" OnClick="btnHome_Click" /><br /><br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/403error.png" /></center>
        </div>
</asp:Content>

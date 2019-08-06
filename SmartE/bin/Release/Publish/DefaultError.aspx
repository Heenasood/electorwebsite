<%@ Page Title="" Language="C#" MasterPageFile="~/UniversalSite.Master" AutoEventWireup="true" CodeBehind="DefaultError.aspx.cs" Inherits="SmartE.WebForm25" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="align-content:center; margin-top:50px;">
   <center>
       <h2 style="font-weight:bold; color:red; font-style:italic;">Oops! Something Went Wrong </h2>
    <asp:Button ID="btnHome" runat="server" CssClass="button primary fit" Text="Back Home" OnClick="btnHome_Click" /><br /><br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/DefaultError.gif" /></center>
        </div>
</asp:Content>

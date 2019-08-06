<%@ Page Title="" Language="C#" MasterPageFile="~/UniversalSite.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="SmartE.WebForm19" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading">
        <h1>Reset Password</h1>
    </div>
    <div style="margin-top: 40px; margin-bottom:60px; margin-left: 550px; margin-right: 0px">
        <table style="border: 0px solid black; width: 600px">

            <tr>
                <td colspan="2">
                    <b>Reset Here</b>
                </td>

            </tr>
            <tr>
                <td>UserName
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" Width="250px" runat="server">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnResetPassword" CssClass="button primary fit" runat="server"
                        Text="Reset Password" OnClick="btnResetPassword_Click" />
                </td>
            </tr>
        </table>
        <asp:Label class="txt" ID="lblMessage" runat="server"></asp:Label>
        <asp:Label class="txt" ID="lblMessage0" runat="server"></asp:Label>
        <asp:Label class="txt" ID="lblException" runat="server"></asp:Label>
    </div>
</asp:Content>

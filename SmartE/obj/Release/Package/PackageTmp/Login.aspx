<%@ Page Title="" Language="C#" MasterPageFile="~/UniversalSite.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SmartE.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading">
        <h1>Login</h1>
    </div>

    <div style="margin-top: 30px; margin-left: 300px; margin-right: 300px">
        <div style="align-content: center; margin-left: 250px; text-align: center; width: 314px; font-weight: bold;">
            <asp:Label ID="lblErrorMessage" runat="server"></asp:Label></div>
        <table class="auto-style1" cellpadding="3px" cellspacing="3px">

            <tr>
                <td style="height: 23px; text-align: center; width: 219px;">
                    <asp:Label class="txt" ID="lblUsername" runat="server" Text="Username"></asp:Label>
                </td>
                <td style="height: 23px; width: 278px;">
                    <asp:TextBox ID="txtUsername" CssClass="input" ValidationGroup="Login" runat="server" Width="216px" placeholder="Enter Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" ValidationGroup="Login" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please Enter Username" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 31px; text-align: center; width: 219px;">
                    <asp:Label class="txt" ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td style="height: 31px; width: 278px;">
                    <asp:TextBox ID="txtPassword" CssClass="input" runat="server" ValidationGroup="Login" TextMode="Password" Width="216px" placeholder="Enter Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" ValidationGroup="Login" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Password" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
        </table>
        <div style="align-content: center; text-align:center; margin-left: 200px; width:600px; width: 463px; font-weight: bold;">
           
                                <%--<asp:Button runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="primary" />--%>
                                <asp:Button CssClass="button primary fit" runat="server" ValidationGroup="Login" OnClick="btnLogin_Click" Text="Login" /><br /><br />
             <asp:LinkButton ID="lblForgotPassword" Style="text-decoration: none; color: blue" runat="server"><a href="ResetPassword.aspx" class="button fit" style="text-decoration:none; color:blue;">Forgot Password?</a> </asp:LinkButton>
           
            <br /><br />
       
            <asp:Label ID="lblNewUser" runat="server" class="txt">New to SmartElector? <a href="Registration.aspx" Style="text-decoration: none; color:blue">Sign Up</a></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" CssClass="txt" ValidationGroup="Login" runat="server" ForeColor="Red" DisplayMode="List" />
        </div>
        
    </div>
</asp:Content>

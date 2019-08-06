<%@ Page Title="" Language="C#" MasterPageFile="~/UniversalSite.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SmartE.WebForm26" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading">
        <h1>Register - Candidate/Elector</h1>
    </div>
    <div style="margin-top:30px; margin-left:300px; margin-right: 300px">
        <div style="align-content: center; margin-left: 250px; font-weight: bold;">
            <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
        </div>
        <br />
        <table class="auto-style1">
            <tr>
                <td style="height: 17px"></td>
                <td style="height: 17px">
                    <table style="width: 100%;">
                        <tr>
                            <td style="height: 22px; width: 235px;">
                                <asp:Label ID="lblUserName" runat="server" Text="UserName" CssClass="txt"></asp:Label>
                            </td>
                            <td style="height: 22px; width: 278px;">
                                <asp:TextBox CssClass="input" ID="txtUserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUserName" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Enter UserName" ControlToValidate="txtUserName" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td style="width: 235px">
                                <asp:Label ID="lblFirstName" runat="server" Text="FirstName" CssClass="txt"></asp:Label>
                            </td>
                            <td style="width: 278px">
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Enter FirstName" ControlToValidate="txtFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td style="width: 235px; height: 30px;">
                                <asp:Label ID="lblLastName" runat="server" Text="LastName" CssClass="txt"></asp:Label>
                            </td>
                            <td style="width: 278px; height: 30px">
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="input"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastName" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Enter LastName" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td style="width: 235px">
                                <asp:Label ID="lblEmail" runat="server" Text="E-Mail" CssClass="txt"></asp:Label>
                            </td>
                            <td style="width: 278px">
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Enter E-Mail" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Enter Valid Email-ID" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 235px">
                                <asp:Label ID="lblPassport" runat="server" Text="Passport" CssClass="txt"></asp:Label>
                            </td>
                            <td style="width: 278px">
                                <asp:TextBox ID="txtPassport" runat="server" CssClass="input"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassport" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Enter Passport" ControlToValidate="txtPassport" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 235px">
                                <asp:Label ID="lblGender" runat="server" Text="Gender" CssClass="txt"></asp:Label>
                            </td>
                            <td style="width: 278px">
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="input">
                                    <asp:ListItem Value="Select Gender">Select Gender</asp:ListItem>
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                    <asp:ListItem Value="Unknown">Unknown</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="Select Gender" ID="rfvPassport0" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Select Gender" ControlToValidate="ddlGender" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 235px; height: 32px;">
                                <asp:Label ID="lblMobile" runat="server" Text="Mobile" CssClass="txt"></asp:Label>
                            </td>
                            <td style="width: 278px; height: 32px;">
                                <asp:TextBox ID="txtMobile" runat="server" TextMode="Number" CssClass="input"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMobile" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Enter Mobile Number" ControlToValidate="txtMobile" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 235px">
                                <asp:Label ID="lbPassword" runat="server" Text="Password" CssClass="txt"></asp:Label>
                            </td>
                            <td style="width: 278px">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 235px">
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="txt"></asp:Label>
                            </td>
                            <td style="width: 278px">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfirmPassword" ValidationGroup="vgRegister" Text="*" runat="server" ErrorMessage="Please Enter Confirm Password" ControlToValidate="txtConfirmPassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvConfirmPassword" runat="server" ValidationGroup="vgRegister" Text="*" ErrorMessage="Password &amp; Confirm Password Should Match" ForeColor="Red" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 235px; height: 30px;">
                                <asp:Label ID="lblUserProfile" runat="server" Text="User-Profile" CssClass="txt"></asp:Label>
                            </td>
                            <td style="height: 30px; width: 278px;">

                                <asp:DropDownList ID="ddlUserProfile" runat="server" CssClass="input">
                                    <asp:ListItem Value="Select Profile">Select Profile</asp:ListItem>
                                    <asp:ListItem Value="admin" Enabled="false">admin</asp:ListItem>
                                    <asp:ListItem Value="Candidate">Candidate</asp:ListItem>
                                    <asp:ListItem Value="Elector">Elector</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="Select Profile Type" ID="rfvProfile" runat="server" ErrorMessage="Please Select User Profile" ValidationGroup="vgRegister" Text="*" ControlToValidate="ddlUserProfile" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td style="width: 235px; height: 45px;">
                                <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="txt"></asp:Label>
                            </td>
                            <td style="width: 278px; height: 45px;">
                                <asp:DropDownList ID="ddlStatus" Enabled="false" runat="server" CssClass="input">
                                    <asp:ListItem Value="Select Status">Select Status</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="active">active</asp:ListItem>
                                    <asp:ListItem Value="inactive">inactive</asp:ListItem>
                                    <asp:ListItem Value="temporary block">temporary block</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="Select Status" ID="rfvStatus" runat="server" ValidationGroup="vgRegister" Text="*" ErrorMessage="Please Select User Profile Status" ControlToValidate="ddlStatus" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>

                        </tr>
                      
                    </table>
                    <%--<asp:ValidationSummary ID="vsAdminSummary" runat="server" ForeColor="Red" HeaderText="Please fix the following Errors:" ValidationGroup="vgRegister" />--%>
                </td>
                <td style="height: 17px"></td>
            </tr>

        </table>
        <div style="align-content: center; text-align:center; margin-left: 200px; width: 600px; width: 463px; font-weight: bold;">

            <%--<asp:Button runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="primary" />--%>
            <asp:Button ID="btnRegister" runat="server" Text="Register" ValidationGroup="vgRegister" OnClick="btnRegister_Click" CssClass="button primary fit" />
            &nbsp;
                                <asp:Button ID="btnReset" class="button fit" runat="server" OnClick="btnReset_Click1" Text="Reset" />&nbsp;
            

            <br />
            <br />


            <asp:Label runat="server" ID="lblExistingUser" CssStyle="Font-weight:bold" CssClass="txt">Already have an account? Sign in <a href="Login.aspx" style="text-decoration:none">here</a></asp:Label><br />
            <br />
            <asp:ValidationSummary ID="vsAdminSummary" runat="server" ForeColor="Red" HeaderText="Please fix the following Errors:" ValidationGroup="vgRegister" DisplayMode="List" />
        </div>
    </div>
</asp:Content>

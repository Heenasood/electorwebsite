<%@ Page Title="" Language="C#" MasterPageFile="~/UniversalSite.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="SmartE.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="heading">
        <h1>Change Password</h1>
    </div>
    <div style="margin-top: 60px; margin-bottom:60px; margin-left: 600px; margin-right: 500px">
<table>
    <tr>
        <td colspan="2">
            <b>Change Password</b>
        </td>
    </tr>
    <tr>
        <td>
            New Password
        </td>
        <td>
            :<asp:TextBox ID="txtNewPassword" TextMode="Password" 
            runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPassword" 
                runat="server" ErrorMessage="New Password required"
                Text="*" ControlToValidate="txtNewPassword" ForeColor="Red">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Confirm New Password
        </td>
        <td>
            :<asp:TextBox ID="txtConfirmNewPassword" TextMode="Password" runat="server">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmNewPassword" 
                runat="server" ErrorMessage="Confirm New Password required" Text="*" 
                ControlToValidate="txtConfirmNewPassword"
                ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidatorPassword" runat="server" 
                ErrorMessage="New Password and Confirm New Password must match"
                ControlToValidate="txtConfirmNewPassword" ForeColor="Red" 
                ControlToCompare="txtNewPassword"
                Display="Dynamic" Type="String" Operator="Equal" Text="*">
            </asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td>
                    
        </td>
        <td>
            &nbsp;<asp:Button ID="btnSave" CssClass="button primary fit" runat="server" 
            Text="Save" onclick="btnSave_Click"  />
        </td>
    </tr>

</table>
         <asp:ValidationSummary ID="ValidationSummary1" 
            ForeColor="Red" runat="server" />
        <asp:Label ID="lblMessage" runat="server">
            </asp:Label>
</div>

</asp:Content>

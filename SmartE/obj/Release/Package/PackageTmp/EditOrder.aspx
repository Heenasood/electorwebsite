<%@ Page Title="" Language="C#" MasterPageFile="~/ElectorSite.Master" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="SmartE.WebForm27" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div style="margin-left:400px; margin-right:550px;">
    <asp:Label ID="Label1" runat="server" Text="Modify Donation Quantity" ForeColor="Red" Font-Italic="true" Font-Size="X-Large"></asp:Label>



    <table style="width: 100%">
        <tr>
            <td style="width: 205px">Donatation ID</td>
            <td><asp:Label ID="lblDonationID" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 205px">Donation Type</td>
            <td>
               <asp:Label ID="lblDonationtype" runat="server" Text="Label"></asp:Label> 
            </td>
        </tr>
        <tr>
            <td style="width: 205px">Donation Name</td>
            <td><asp:Label ID="lblDonationName" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 205px">Amount</td>
            <td>
            <asp:Label ID="lblAmount" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 205px">Quantity</td>
            <td><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 205px">Total Price</td>
            <td><asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 205px" >&nbsp;</td>
            <td>
            <asp:Button ID="save" runat="server" Text="Save" OnClick="save_Click" /></td>
        </tr>
    </table>


        </div>
</asp:Content>

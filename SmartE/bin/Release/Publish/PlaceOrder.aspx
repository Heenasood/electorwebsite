<%@ Page Title="" Language="C#" MasterPageFile="~/ElectorSite.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="SmartE.WebForm28" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:300px; margin-right:400px;">
    <asp:Label ID="Label1" runat="server" Text="Enter complete below details to place your order" ForeColor="Red" Font-Italic="true" Font-Size="X-Large"></asp:Label>

    <table style="width: 100%; height: 239px">

        <tr>
            <td class="auto-style1" style="width: 354px">Order ID</td>
            <td>
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="width: 354px">Order Date</td>
            <td>
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="width: 294px">Type Your Address</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="82px" style="margin-left: 0px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="width: 294px">Mobile Number</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="width: 294px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br /><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  ShowFooter="True" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <%--<asp:BoundField DataField="sno" HeaderText="S. No" />--%>
                <asp:BoundField DataField="DonateID" HeaderText="Donate ID" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="DonationType" HeaderText="Donation Type" HeaderStyle-ForeColor="White"  />
                <asp:BoundField DataField="DonationName" HeaderText="Donation Name" HeaderStyle-ForeColor="White" />
                <asp:ImageField DataImageUrlField="DonationImage" HeaderText="Image" HeaderStyle-ForeColor="White">
                    <ControlStyle Height="200px" Width="200px" />
                    <FooterStyle Height="200px" Width="200px" />
                    <ItemStyle Height="200px" Width="200px" />
                </asp:ImageField>
                <asp:BoundField DataField="DonationAmount" HeaderText="Price" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="totalprice" HeaderText="Total Price" HeaderStyle-ForeColor="White" /> 
                <asp:BoundField DataField="discountprice" HeaderText="Promoted price" HeaderStyle-ForeColor="White" />

            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" Height="45px" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>

    <br /><br />

    <table style="width: 100%">
        
        <tr>
            <td class="auto-style1" style="width: 294px">&nbsp;</td>
            <td>
                <asp:Button ID="btnPlaceOrder" runat="server" Text="Place My Order" OnClick="btnPlaceOrder_Click" />
            </td>
        </tr>
    </table>
        </div> 
</asp:Content>

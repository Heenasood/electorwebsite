<%@ Page Title="" Language="C#" MasterPageFile="~/ElectorSite.Master" AutoEventWireup="true" CodeBehind="AddtoCart.aspx.cs" Inherits="SmartE.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 40px">
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Following items have been added to your cart"></asp:Label>

        &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="X-Large" Font-Italic="true" NavigateUrl="~/Donations.aspx">Donate More</asp:HyperLink>
    
        <%--<div style="margin-top: 15px; margin-left: 1050px">
        <asp:Label ID="Label2" Font-Size="Large" Font-Bold="true" runat="server" Text="Total Items in Your Cart"></asp:Label>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/basket.png" Height="35px" Width="35px" />:
         <asp:Label Font-Size="XX-Large" Font-Bold="true" ForeColor="Green" ID="lblItem" runat="server"></asp:Label>
            </div>--%>
        <asp:Label ID="lblException" runat="server" Text=""></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="DonateID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <%--<asp:BoundField DataField="sno" HeaderText="S. No" HeaderStyle-ForeColor="White" />--%>
                <asp:BoundField DataField="DonateID" HeaderText="Donate ID" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="DonationType" HeaderText="DonationType" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="DonationName" HeaderText="Donation Name" HeaderStyle-ForeColor="White" />
                <asp:ImageField DataImageUrlField="DonationImage" HeaderText="Image" HeaderStyle-ForeColor="White">
                    <ControlStyle Height="200px" Width="200px" />
                    <FooterStyle Height="200px" Width="200px" />
                    <ItemStyle Height="200px" Width="200px" />
                </asp:ImageField>
                <asp:BoundField DataField="DonationAmount" HeaderText="Price" HeaderStyle-ForeColor="White"/>
                <asp:BoundField DataField="quantity" HeaderText="Quantity" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="totalprice" HeaderText="Total Price" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="Discount" DataFormatString="{0:p}" HeaderText="Discount" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="discountprice" HeaderText="Promoted Price" HeaderStyle-ForeColor="White" />
                <asp:CommandField SelectText="Modify" ShowSelectButton="True"  />
                <asp:CommandField DeleteText="Remove" ShowDeleteButton="True"  />
               
                

            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" Height="40px" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView><br /><br />

        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
    </div>
</asp:Content>

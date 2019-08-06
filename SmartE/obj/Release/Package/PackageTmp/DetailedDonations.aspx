<%@ Page Title="" Language="C#" MasterPageFile="~/ElectorSite.Master" AutoEventWireup="true" CodeBehind="DetailedDonations.aspx.cs" Inherits="SmartE.WebForm30" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
         <div style="margin-top: 15px; margin-left: 1050px">
        <asp:Label ID="Label1" Font-Size="Large" Font-Bold="true" runat="server" Text="Total Items in Your Cart"></asp:Label>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/basket.png" Height="35px" Width="35px" />:
         <asp:Label Font-Size="XX-Large" Font-Bold="true" ForeColor="Green" ID="lblItem" runat="server"></asp:Label>
        &nbsp; &nbsp;
        <asp:HyperLink ID="HyperLink1" Font-Size="X-Large" Font-Bold="true" runat="server" NavigateUrl="~/AddtoCart.aspx">View Cart</asp:HyperLink>
    </div>
    <div style="margin-left: 350px; margin-right: 450px;">
        <center><asp:FormView ID="FormView1" runat="server" DataKeyNames="DonateID" DataSourceID="SqlDataSource1" AllowPaging="True" OnItemCommand="FormView1_ItemCommand">
            <ItemTemplate>
                <table style="width: 100%; padding-left: 10px">
                    <tr>

                        <td style="align-items: center; width: 300px">
                            <center><img  src='<%#Eval("DonationImage") %>' style="height: 200px; width: 200px"></img></center>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px" class="infotxtHeading">Donation ID:
                                        <asp:Label ID="PartyLabel" CssClass="infotxt" runat="server" Text='<%# Bind("DonateID") %>' />
                        </td>
                        <tr>
                            <td class="infotxtHeading">Donation Type: <%# Eval("DonationType") %></td>
                        </tr>
                    <td>
                    <tr>
                        <td>Donation Name: <%# Eval("DonationName") %></center></td>
                    </tr>
                    <tr>
                        <td>
                         Description: '<%# Eval("DonationDesc") %>' </td>
                    </tr>
                    <tr>
                        <td>Donation Amount:
                            <asp:Label ID="RoleYearLabel" CssClass="infotxt" runat="server" Text='<%# Bind("DonationAmount") %>' /></td>
                    </tr>

                    <tr>
                        <td class="infotxtHeading">Quantity:
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                <asp:ListItem Value="3" Text="3"></asp:ListItem>
                            </asp:DropDownList></td>

                    </tr>
                     <tr>
                        <td class="infotxtHeading">Total Price:
                            <asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label>
                    </tr>
                    
                </table>
                    <center><asp:Button ID="btnAddtocart" CssClass="button primary fit" runat="server" CommandName="addtocart" CommandArgument='<%# Eval("DonateID") %>' Text="Add to Cart"></asp:Button></center>
            </ItemTemplate>

        </asp:FormView></center>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smartElectorConnectionString %>" SelectCommand="SELECT DISTINCT [DonateID], [DonationType], [DonationName], [DonationDesc], [DonationImage], [DonationAmount], [DonationStatus] FROM [Donations]"></asp:SqlDataSource>
    </div>
</asp:Content>

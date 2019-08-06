<%@ Page Title="" Language="C#" MasterPageFile="~/ElectorSite.Master" AutoEventWireup="true" CodeBehind="Donations.aspx.cs" Inherits="SmartE.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 15px; margin-left: 1050px">
        <asp:Label ID="Label1" Font-Size="Large" Font-Bold="true" runat="server" Text="Total Items in Your Cart"></asp:Label>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/basket.png" Height="35px" Width="35px" />:
         <asp:Label Font-Size="XX-Large" Font-Bold="true" ForeColor="Green" ID="lblItem" runat="server"></asp:Label>
        &nbsp; &nbsp;
        <%--<asp:HyperLink ID="HyperLink1" Font-Size="X-Large" Font-Bold="true" runat="server" NavigateUrl="~/AddtoCart.aspx">View Cart</asp:HyperLink>--%>
    </div>
    <div style="margin-top: 50px">
        <asp:DataList ID="dlCandidateInfo" runat="server" RepeatColumns="2" Style="margin-right: 0px" OnItemCommand="dlCandidateInfo_ItemCommand">
            <ItemTemplate>
                <div style="margin-left: 200px; width: 300px;" />
                <center>
                                <table>
                                    <tr>
                                        <td>
                                            
                                                
                                                  <center> <a href='DetailedDonations.aspx?DonateID=<%# Eval("DonateID") %>'> <img src='<%#Eval("DonationImage") %>' style="height: 250px; width: 200px"></img></a></center>
                                        </td>
                            </center>
                </tr>
                                    <tr>
                                        <td>
                                            <center>
                                                <hr />
                                                <h1 style="color:darkslategray"><%# Eval("DonationName") %></h1>
                                                
                                                <hr />
                                            </center>
                                        </td>
                                    </tr>
                <tr>
                    <td>
                        
                            
                                        <h3 class="infotxt"><strong>Descption:</strong> <%# Eval("DonationDesc") %><br /><br />
                                            <strong>Donation Type:</strong> <%# Eval("DonationType") %><br /><br />
                                            <strong>Quantity:</strong> <asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:listitem runat="server" Value="1" Text="1"/>
                                                <asp:listitem runat="server" Value="2" Text="2"/>
                                                <asp:listitem runat="server" Value="3"  Text="3"/>
                                            </asp:DropDownList><br />
                                        
                                        </h3>
                                    
                    </td>

                    <tr>
                        <td>
                            <asp:Label ID="lblDiscount" Text='<%# Eval("Discount") %>' runat="server" ></asp:Label></td>
                    </tr>
                     <tr>
                        <td>Price: 
                           <strike> $<asp:Label ID="lblActualPrice" runat="server" Text='<%# Eval("DonationAmount") %>'></asp:Label></strike> $&nbsp;<asp:Label ID="lblDiscountedPrice" Text='<%# Eval("NewPrice") %>' runat="server"></asp:Label> </td>
                    </tr>
                     <tr>
                        <td><asp:Button ID="btnDonate" CssClass="button primary fit" runat="server" Text="Donate" CommandName="addtocart" CommandArgument='<%# Eval("DonateID") %>'></asp:Button></td>
                    </tr>
                </tr>

                </table>
                            </center>
                        </div>
            </ItemTemplate>

        </asp:DataList>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:smartElectorConnectionString %>" SelectCommand="SELECT DISTINCT [DonateID], [DonationType], [DonationName], [DonationDesc], [DonationImage], [DonationAmount], [DonationStatus], [Promotions], [Discount] FROM [Donations]"></asp:SqlDataSource>

    </div>
</asp:Content>

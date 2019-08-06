<%@ Page Title="" Language="C#" MasterPageFile="~/ElectorSite.Master" AutoEventWireup="true" CodeBehind="CandidateDetails.aspx.cs" Inherits="SmartE.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 200px; width: 800px;">

                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="RoleID" DataSourceID="SqlDataSource1" AllowPaging="True" >
                        <ItemTemplate>
                            <table style="width: 100%; padding-left:10px">
                                <tr>
                                    <td style="width: 250px" class="infotxtHeading">Group:</td>
                                    <td style="width: 200px">
                                        <asp:Label ID="PartyLabel" CssClass="infotxt" runat="server" Text='<%# Bind("Party") %>' /></td>
                                    <td rowspan="3" style="align-items: center; width: 300px">
                                        <center><img  src='<%#Eval("RoleImages") %>' style="height: 200px; width: 200px"></img>
                                            <h3 style="color:darkslategray"> <%# Eval("LastName") %>,&nbsp;<%# Eval("FirstName") %></h3>
                                        <h3 style="color:darkslategray"><%# Eval("RoleName") %></h3></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infotxtHeading">Enrolled Year:</td>
                                    <td>
                                        <asp:Label ID="RoleYearLabel" CssClass="infotxt" runat="server" Text='<%# Bind("RoleYear") %>' /></td>
                                </tr>

                                <tr>
                                    <td class="infotxtHeading">Email-ID:</td>
                                    <td>
                                        <asp:Label ID="EmailIDLabel" CssClass="infotxt" runat="server" Text='<%# Bind("EmailID") %>' /></td>
                                </tr>
                                <tr>
                                    <td class="infotxtHeading">Gender:</td>
                                    <td colspan="2">
                                        <asp:Label ID="GenderLabel" CssClass="infotxt" runat="server" Text='<%# Bind("Gender") %>' /></td>
                                </tr>
                                                                <tr>
                                    <td class="infotxtHeading">Manifesto Name:</td>
                                    <td colspan="2">
                                        <asp:Label ID="ManifestoNameLabel" CssClass="infotxt" runat="server" Text='<%# Bind("ManifestoName") %>' /></td>
                                </tr>
                                <tr>
                                    <td class="infotxtHeading">Manifesto Summary:</td>
                                    <td colspan="2">
                                        <asp:Label ID="ManifestoSummaryLabel" CssClass="infotxt" runat="server" Text='<%# Bind("ManifestoSummary") %>' /></td>

                                </tr>
                                <tr>
                                    <td class="infotxtHeading">Manifesto Description:</td>
                                    <td colspan="2">
                                        <asp:Label ID="ManifestoDescLabel" CssClass="infotxt" runat="server" Text='<%# Bind("ManifestoDesc") %>' /></td>

                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smartElectorConnectionString %>" SelectCommand="SELECT c.RoleID, c.RoleImages, gu.LastName, gu.FirstName, c.RoleName, c.Party, c.RoleYear, c.ManifestoName, c.ManifestoSummary, c.ManifestoDesc, gu.EmailID, gu.Gender FROM globalUsers AS gu INNER JOIN Candidate AS c ON gu.UserName = c.Candidate_Name WHERE (gu.UserProfile = 'Candidate') AND (gu.ProfileStatus = 'Active') AND (c.RoleStatus = 'active')"></asp:SqlDataSource>
    </div>

</asp:Content>

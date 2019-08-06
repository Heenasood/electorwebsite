<%@ Page Title="" Language="C#" MasterPageFile="~/ElectorSite.Master" AutoEventWireup="true" CodeBehind="Candidate_Info.aspx.cs" Inherits="SmartE.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        <tr>
            <td>&nbsp;</td>
            <td>

                <asp:DataList ID="dlCandidateInfo" runat="server" RepeatColumns="2" DataSourceID="SqlDataSource2" style="margin-right: 0px">
                    <ItemTemplate>
                        <div style="margin-left: 200px; width: 300px;" />
                        <center>
                                <table>
                                    <tr>
                                        <td>
                                            <center>
                                                <a href='CandidateDetails.aspx?RoleID=<%# Eval("RoleID") %>'>
                                                    <img src='<%#Eval("RoleImages") %>' style="height: 150px; width: 150px"></img></a>
                                        </td>
                            </center>
                        </tr>
                                    <tr>
                                        <td>
                                            <center>
                                                <hr />
                                                <h2 style="color:darkslategray"><%# Eval("LastName") %>,&nbsp;<%# Eval("FirstName") %></h2>
                                                <h3 style="color:darkslategray"><%# Eval("RoleName") %></h3>
                                                <hr />
                                            </center>
                                        </td>
                                    </tr>
                        <tr>
                            <td>
                                <center>
                                        <p class="infotxt">Party Name: <%# Eval("Party") %></p>
                                    </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                        <p class="infotxt">Nominated For Year: <%# Eval("RoleYear") %></p>
                                    </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center class="infotxt">Manifesto Name: <%# Eval("ManifestoSummary") %></center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                        </table>
                            </center>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:smartElectorConnectionString %>" SelectCommand="SELECT c.RoleID, c.RoleName, c.Party, c.RoleYear, c.RoleImages, c.ManifestoName, c.ManifestoSummary, c.ManifestoDesc, c.Candidate_Name, gu.UserName, gu.LastName, gu.FirstName, gu.EmailID, gu.Gender, gu.Passport FROM globalUsers AS gu INNER JOIN Candidate AS c ON gu.UserName = c.Candidate_Name WHERE (gu.UserProfile = 'Candidate') AND (gu.ProfileStatus = 'Active') AND (c.RoleStatus = 'active')"></asp:SqlDataSource>

        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

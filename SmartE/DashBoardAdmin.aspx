<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="DashBoardAdmin.aspx.cs" Inherits="SmartE.WebForm12" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="#d5cdc6">
        <div style="margin-left: 140px; margin-right: 300px">

            <table>

                <tr>
                    <td colspan="2">
                        <h2 style="text-align: center">Results for Individual Data</h2>
                    </td>
                </tr>
                <tr>
                    <td style="align-items: center">
                        <asp:Chart ID="chrCandidate" Name="ChartArea1" runat="server" BackColor="Linen">
                            <Series>
                                <asp:Series ChartType="Pie" Name="Series1" YValuesPerPoint="2">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                            <BorderSkin PageColor="Gainsboro" />
                        </asp:Chart>
                    </td>
                    <td>
                        <asp:Chart ID="barCandidate" runat="server" BackColor="Linen">
                            <Series>
                                <asp:Series Name="Series1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                     
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h2 style="text-align: center">Results based on the Role</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Chart ID="chrPieRole" runat="server" BackColor="Linen">
                            <Series>
                                <asp:Series ChartType="Pie" Name="Series1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                    <td>
                        <asp:Chart ID="chrbarRole" runat="server" BackColor="Linen">
                            <Series>
                                <asp:Series Name="Series1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h2 style="text-align: center">Total Votes Recieved</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Chart ID="chrBarPollName" runat="server" BackColor="Linen">
                            <Series>
                                <asp:Series ChartType="Pie" Name="Series1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                    <td>
                        <asp:Chart ID="chrPiePollName" runat="server" BackColor="Linen">
                            <Series>
                                <asp:Series Name="Series1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>

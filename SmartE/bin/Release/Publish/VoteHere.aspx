<%@ Page Title="" Language="C#" MasterPageFile="~/ElectorSite.Master" AutoEventWireup="true" CodeBehind="VoteHere.aspx.cs" Inherits="SmartE.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="special" style="margin-top: 15px">
        <h2>SMART ELECTOR - OFFICIAL BALLOT</h2>
        <h3>INSTRUCTIONS TO USE</h3>
        <asp:CheckBox ID="chkDeclaration" CssClass="infotxtHeading" Style="text-align: center; font-weight: bold;" runat="server" Text="I hereby declare that I am entitled to vote, that I have not already voted earlier and my preference for candidate role is/are as:" />
        <br />
        <%--class="highlights"
        class="inner"
        class="wrapper"--%>
    </header>
    <!-- Highlights -->


    <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" DataSourceID="SqlDataSource2" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <asp:HiddenField runat="server" ID="hfRoleName" Value='<%#Eval("PollRole") %>' />

            <div>
                <div>
                    <section class="highlights" style="align-items: center;">
                        <div class="content" style="margin-left: 65px; padding-left: 24px; padding-right: 24px">

                            <h5><%# Eval("PollRole") %></h5>
                            <a href="#" class="icon fa-vcard-o"><span class="label"></span></a>
                            <br />
                            <%# Eval("PollName") %>
                            <br />
                            <div runat="server" id="cddSection"></div>
                            <%--<asp:Repeater ID="ProductsByCategoryList" EnableViewState="False"
                                DataSourceID="SqlDataSource2" runat="server">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>





                                    <Radiobuttonlist ID="rbInsertVote" runat="server" DataSourceID="SqlDataSource2" DataTextField="Candidate_Name" DataValueField="Candidate_Name">
                                      
                                    <%# Eval("Candidate_Name") %><br />
                                        </Radiobuttonlist>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>--%>

                            <asp:FormView runat="server" ID="FVCandidateList" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="rbInsertVote" runat="server" DataSourceID="SqlDataSource2" DataTextField="Candidate_Name" DataValueField="Candidate_Name">
                                    </asp:RadioButtonList>
                                </ItemTemplate>
                            </asp:FormView>

                            <%-- <asp:RadioButtonList ID="rbInsertVote" runat="server" DataSourceID="SqlDataSource1" DataTextField="Candidate_Name" DataValueField="Candidate_Name">
                                <asp:ListItem> </asp:ListItem>
                            </asp:RadioButtonList>
                               <asp:RequiredFieldValidator ControlToValidate="rbInsertVote" ValidationGroup="Vote" ForeColor="Red" ID="rfvInsertVote" runat="server" Text="*" ErrorMessage="Please Cast Your Vote"></asp:RequiredFieldValidator>--%>
                        </div>
                    </section>
                    <%--Candidate_Name:
            <asp:Label ID="Candidate_NameLabel" runat="server" Text='<%# Eval("Candidate_Name") %>' />
            <br />
            RoleID:
            <asp:Label ID="RoleIDLabel" runat="server" Text='<%# Eval("RoleID") %>' />
            <br />
            RoleImages:
            <asp:Label ID="RoleImagesLabel" runat="server" Text='<%# Eval("RoleImages") %>' />
            <br />
            ManifestoName:
            <asp:Label ID="ManifestoNameLabel" runat="server" Text='<%# Eval("ManifestoName") %>' />
            <br />
            PollID:
            <asp:Label ID="PollIDLabel" runat="server" Text='<%# Eval("PollID") %>' />
            <br />
            PollRole:
            <asp:Label ID="PollRoleLabel" runat="server" Text='<%# Eval("PollRole") %>' />
            <br />
            PollQuestion:
            <asp:Label ID="PollQuestionLabel" runat="server" Text='<%# Eval("PollQuestion") %>' />
            <br />
            PollName:
            <asp:Label ID="PollNameLabel" runat="server" Text='<%# Eval("PollName") %>' />--%>

                </div>
            </div>
         <%--   <%--<%# Eval("RoleImages") %>--%>
        <asp:Label ID="lblRoleIDLabel" Visible="false" runat="server" Text='<%# Eval("RoleID") %>' />
            <asp:Label ID="lblPollIDLabel" Visible="false" runat="server" Text='<%# Eval("PollID") %>' />
            <asp:Label ID="lblRoleYear" Visible="false" runat="server" Text='<%# Eval("RoleYear") %>' />
            <asp:Label ID="lblPollRoleLabel" Visible="false" runat="server" Text='<%# Eval("PollRole") %>' />
            <asp:Label ID="lblPollNameLabel" Visible="false" runat="server" Text='<%# Eval("PollName") %>' />
            <asp:Label ID="lblPollQuestionLabel" Visible="false" runat="server" Text='<%# Eval("PollQuestion") %>' />
        </ItemTemplate>
        <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
    </asp:DataList>
    <div style="margin-left: 300px; margin-right: 300px">
        <asp:Button ID="btnSubmit" ValidationGroup="Vote" CssClass="button primary fit" runat="server" Text="Submit" OnClick="btnSubmit_Click" OnClientClick="if (!confirm('Are you sure you want to Submit')) return false;" />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <asp:ValidationSummary ValidationGroup="Vote" DataKeyField="ResultID" ID="vs" ForeColor="Red" runat="server" DisplayMode="List" ShowSummary="False" />
    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smartElectorConnectionString %>"
        SelectCommand="SELECT  p.PollRole, p.PollName FROM tblPoll as p WHERE (p.PollStatus = 'Active')"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:smartElectorConnectionString %>"
        SelectCommand="SELECT DISTINCT c.Candidate_Name, c.RoleID, c.RoleImages, c.RoleYear, c.ManifestoName, p.PollID, p.PollRole, p.PollQuestion, p.PollName FROM tblPoll AS p INNER JOIN Candidate AS c ON p.RoleID = c.RoleID"></asp:SqlDataSource>
</asp:Content>

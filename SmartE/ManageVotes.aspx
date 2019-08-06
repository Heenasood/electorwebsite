<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="ManageVotes.aspx.cs" Inherits="SmartE.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 350px">
        <table class="auto-style1" style="width: 500px">

            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:DropDownList ID="ddlSearch" runat="server" ValidationGroup="Search" Style="text-align: left" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                        <asp:ListItem Selected="True">Select Criteria</asp:ListItem>
                        <asp:ListItem Value="PollType">Poll-Type</asp:ListItem>
                        <asp:ListItem Value="PollName">Poll Name</asp:ListItem>
                        <asp:ListItem Value="PollRole">Role</asp:ListItem>
                        <asp:ListItem Value="PollStatus">Status</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ValidationGroup="Search" InitialValue="Select Criteria" ID="rfvddlSearch" runat="server" Text="*" ForeColor="Red" ControlToValidate="ddlSearch" ErrorMessage="Please Select A Search Criteria"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ValidationGroup="Search" ID="txtSearch" runat="server" placeholder="Enter Keyword"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btnSearch" ValidationGroup="Search" CssClass="button primary fit" runat="server" Style="text-align: left" Text="Search" OnClick="btnSearch_Click" />&nbsp;&nbsp;<br /><br />
                <asp:Button ID="btnReset" runat="server" Style="text-align: left" Text="Reset" OnClick="btnReset_Click" />&nbsp;&nbsp;
                <asp:Label ValidationGroup="Search" ID="lblSearchError" runat="server"></asp:Label>
            <asp:ValidationSummary ID="vsSearch" ValidationGroup="Search" runat="server" DisplayMode="List" ForeColor="Red" />
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>
        <asp:Label ID="lblException" runat="server"></asp:Label>
    </div>


    <asp:GridView ID="gvPolls" runat="server" AutoGenerateColumns="False" OnRowCommand="gvPolls_RowCommand" DataKeyNames="PollID" OnRowDataBound="gvPolls_RowDataBound" ShowFooter="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>


            <%--<asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:ImageButton ToolTip="Update" ImageUrl="~/images/updateicon.jpg" ImageAlign="Middle" Height="22px" Width="22px" ID="btnUpdate" runat="server" CommandArgument='<%# Eval("PollID") %>' CausesValidation="True" CommandName="UpdateRow" Text="Update"></asp:ImageButton>
                    <asp:ImageButton ToolTip="Cancel" ImageUrl="~/images/Cancel icon.png" ID="btnCancel" ImageAlign="Middle" Height="22px" Width="22px" runat="server" CommandArgument='<%# Eval("PollID") %>' CausesValidation="False" CommandName="CancelUpdate" Text="Cancel"></asp:ImageButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ToolTip="Edit" ImageUrl="~/images/editicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnEdit" runat="server" CommandArgument='<%# Eval("PollID") %>' CausesValidation="False" CommandName="EditRow" Text="Edit"></asp:ImageButton>
                    <asp:ImageButton ToolTip="Delete" ImageUrl="~/images/deleteicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnDelete" runat="server" CommandArgument='<%# Eval("PollID") %>' CausesValidation="False" CommandName="DeleteRow" OnClientClick="Javascript: return Confirm(Are you sure you want to Delete?)" Text="Delete"></asp:ImageButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <FooterTemplate>
                    <asp:ImageButton ToolTip="New Record" ImageUrl="~/images/image1.jpg" ImageAlign="Middle" Height="35px" Width="35px" ID="btnInsert" CommandName="InsertRow" runat="server" ValidationGroup="vgInsert" Text="Insert" />
                </FooterTemplate>
            </asp:TemplateField>--%>

            <asp:TemplateField ShowHeader="False" HeaderStyle-ForeColor="White">
                <EditItemTemplate>
                    <asp:ImageButton ToolTip="Update" ImageUrl="~/images/updateicon.jpg" ImageAlign="Middle" Height="22px" Width="22px" ID="btnUpdate" runat="server" CommandArgument='<%# Eval("PollID") %>' CausesValidation="True" CommandName="UpdateRow" Text="Update" OnClientClick="if (!confirm('Are you sure you want to update the record?')) return false;"></asp:ImageButton>
                    <asp:ImageButton ToolTip="Cancel" ImageUrl="~/images/Cancel icon.png" ID="btnCancel" ImageAlign="Middle" Height="22px" Width="22px" runat="server" CommandArgument='<%# Eval("PollID") %>' CausesValidation="False" CommandName="CancelUpdate" Text="Cancel"></asp:ImageButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ToolTip="Edit" ImageUrl="~/images/editicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnEdit" runat="server" CommandArgument='<%# Eval("PollID") %>' CausesValidation="False" CommandName="EditRow" Text="Edit"></asp:ImageButton>
                    <asp:ImageButton ToolTip="Delete" ImageUrl="~/images/deleteicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnDelete" runat="server" CommandArgument='<%# Eval("PollID") %>' CausesValidation="False" CommandName="DeleteRow" OnClientClick="if (!confirm('Are you sure you want to delete the record?')) return false;" Text="Delete"></asp:ImageButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <FooterTemplate>
                    <asp:ImageButton ToolTip="New Record" ImageUrl="~/images/image1.jpg" ImageAlign="Middle" Height="35px" Width="35px" ID="btnInsert" CommandName="InsertRow" runat="server" ValidationGroup="vgInsert" Text="Insert" />
                </FooterTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Poll ID" HeaderStyle-ForeColor="White">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("PollID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Poll Type" HeaderStyle-ForeColor="White">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("PollType") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox CssClass="input" ID="txtPollType" runat="server" Text='<%# Eval("PollType") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox CssClass="input" ID="txtPollTypeFooter" runat="server" placeholder="Poll Type"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Poll Name" HeaderStyle-ForeColor="White">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("PollName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox CssClass="input" ID="txtPollName" runat="server" Text='<%# Eval("PollName") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox CssClass="input" ID="txtPollNameFooter" runat="server" placeholder="Poll Name"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Poll Question" HeaderStyle-ForeColor="White">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("PollQuestion") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox CssClass="input" ID="txtPollQues" runat="server" Text='<%# Eval("PollQuestion") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox CssClass="input" ID="txtPollQuesFooter" runat="server" placeholder="Poll Question"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Poll Description" HeaderStyle-ForeColor="White">
                <ItemTemplate>
                    <asp:Label style="width:400px;" runat="server" Text='<%# Eval("PollDescription") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox style="width:400px;" CssClass="input" ID="txtPollDesc" runat="server" Rows="5" Text='<%# Eval("PollDescription") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox style="width:400px;" CssClass="input" ID="txtPollDescFooter" runat="server" placeholder="Detailed Poll description" Rows="5" Columns="45" TextMode="MultiLine"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role Name" HeaderStyle-ForeColor="White">
                <EditItemTemplate>
                    <asp:DropDownList CssClass="input" ID="ddlEditPollRole" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPollRole" runat="server" Text='<%# Eval("PollRole") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList CssClass="input" ID="ddlPollRoleFooter" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvInsertCandidateName" InitialValue="Select Name" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select Candidate Name" ControlToValidate="ddlPollRoleFooter" ForeColor="Red"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="PollStatus" HeaderStyle-ForeColor="White">
                <EditItemTemplate>
                    <asp:DropDownList CssClass="input" ID="ddlEditStatus" runat="server" SelectedValue='<%# Bind("PollStatus") %>'>
                        <asp:ListItem Value="Select Status">Select Status</asp:ListItem>
                        <asp:ListItem Value="active">active</asp:ListItem>
                        <asp:ListItem Value="inactive">inactive</asp:ListItem>
                        <asp:ListItem Value="temporary block">temporary block</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvEditPollStatus" InitialValue="Select Status" runat="server" Text="*" ErrorMessage="Please Select Poll Status" ControlToValidate="ddlEditStatus" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPollStatus" runat="server" Text='<%# Bind("PollStatus") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList CssClass="input" ID="ddlInsertStatusFooter" runat="server">
                        <asp:ListItem Value="Select Status">Select Status</asp:ListItem>
                        <asp:ListItem Value="active">active</asp:ListItem>
                        <asp:ListItem Value="inactive">inactive</asp:ListItem>
                        <asp:ListItem Value="temporary block">temporary block</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvInsertPollStatus" InitialValue="Select Status" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select Poll Status" ControlToValidate="ddlInsertStatusFooter" ForeColor="Red"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>

        </Columns>
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />

        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />

        <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />

    </asp:GridView>



    <br />
</asp:Content>

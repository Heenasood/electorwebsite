<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="SmartE.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-left: 350px">
        <table class="auto-style1" style="width: 500px">
            <tr>

                <td>
                    <asp:DropDownList ID="ddlSearch" runat="server" ValidationGroup="Search" Style="text-align: left" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                        <asp:ListItem Selected="True">Select Criteria</asp:ListItem>
                        <asp:ListItem Value="RoleName">Role Name</asp:ListItem>
                        <asp:ListItem Value="Party">Party/Group</asp:ListItem>
                        <asp:ListItem Value="RoleYear">Year</asp:ListItem>
                        <asp:ListItem Value="ManifestoName">Manifesto</asp:ListItem>
                        <asp:ListItem Value="Candidate_Name">Candidate Name</asp:ListItem>
                        <asp:ListItem Value="RoleStatus">Status</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ValidationGroup="Search" InitialValue="Select Criteria" ID="rfvddlSearch" runat="server" Text="*" ForeColor="Red" ControlToValidate="ddlSearch" ErrorMessage="Please Select A Search Criteria"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ValidationGroup="Search" ID="txtSearch" placeholder="Enter Keyword" runat="server"></asp:TextBox><br />

                    <asp:Button ID="btnSearch" ValidationGroup="Search" CssClass="button primary fit" runat="server" Style="text-align: left" Text="Search" OnClick="btnSearch_Click" /><br />
                    <br />
                    <asp:Button ID="btnReset" runat="server" Style="text-align: left" Text="Reset" OnClick="btnReset_Click" />&nbsp;&nbsp;
        <asp:ValidationSummary ID="vsSearch" ValidationGroup="Search" runat="server" DisplayMode="List" ForeColor="Red" OnLoad="vsSearch_Load" />
                    <asp:Label ValidationGroup="Search" ID="lblSearchError" runat="server"></asp:Label>
                </td>

            </tr>
        </table>
    </div>
     <div>
        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
        <asp:Label ID="lblException" runat="server"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="grdViewRoles" runat="server" AutoGenerateColumns="False" DataKeyNames="RoleID" ShowFooter="True" HeaderStyle-ForeColor="White" OnRowCommand="grdViewRoles_RowCommand" OnRowDataBound="grdViewRoles_RowDataBound" CellPadding="4" GridLines="None" ForeColor="#333333">
            <%--OnRowCommand="grdViewUsers_RowCommand1 OnRowCommand="grdViewUsers_RowCommand" OnRowUpdating="grdViewUsers_RowUpdating" OnRowDeleting="grdViewUsers_RowDeleting" OnRowCancelingEdit="grdViewUsers_RowCancelingEdit"--%>
            <AlternatingRowStyle BackColor="White" />
            <Columns>


                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:ImageButton ToolTip="Update" ImageUrl="~/images/updateicon.jpg" ImageAlign="Middle" Height="22px" Width="22px" ID="btnUpdate" runat="server" CommandArgument='<%# Eval("RoleID") %>' CausesValidation="True" CommandName="UpdateRow" Text="Update" OnClientClick="if (!confirm('Are you sure you want to update the record?')) return false;"></asp:ImageButton>
                        <asp:ImageButton ToolTip="Cancel" ImageUrl="~/images/Cancel icon.png" ID="btnCancel" ImageAlign="Middle" Height="22px" Width="22px" runat="server" CommandArgument='<%# Eval("RoleID") %>' CausesValidation="False" CommandName="CancelUpdate" Text="Cancel"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ToolTip="Edit" ImageUrl="~/images/editicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnEdit" runat="server" CommandArgument='<%# Eval("RoleID") %>' CausesValidation="False" CommandName="EditRow" Text="Edit"></asp:ImageButton>
                        <asp:ImageButton ToolTip="Delete" ImageUrl="~/images/deleteicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnDelete" runat="server" CommandArgument='<%# Eval("RoleID") %>' CausesValidation="False" CommandName="DeleteRow" OnClientClick="if (!confirm('Are you sure you want to delete the record?')) return false;" Text="Delete"></asp:ImageButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <FooterTemplate>
                        <asp:ImageButton ToolTip="New Record" ImageUrl="~/images/image1.jpg" ImageAlign="Middle" Height="35px" Width="35px" ID="btnInsert" CommandName="InsertRow" runat="server" ValidationGroup="vgInsert" Text="Insert" />
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Role ID" InsertVisible="False" SortExpression="UserID" HeaderStyle-ForeColor="White" >
                    <EditItemTemplate>
                        <asp:Label ID="lbleditRoleID" runat="server" Text='<%# Eval("RoleID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblRoleID" runat="server" Text='<%# Bind("RoleID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Role Name" SortExpression="RoleName" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditRoleName" runat="server" Text='<%# Bind("RoleName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfveditRoleName" runat="server" Text="*" ErrorMessage="Please Enter RoleName" ControlToValidate="txtEditRoleName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertRoleName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertRoleName" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter RoleName" ControlToValidate="txtInsertRoleName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Group/Party" SortExpression="Party" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditParty" runat="server" Text='<%# Bind("Party") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditParty" runat="server" Text="*" ErrorMessage="Please Enter Party" ControlToValidate="txtEditParty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Party") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertParty" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertParty" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter Party" ControlToValidate="txtInsertParty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Election Year" SortExpression="Year" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditYear" TextMode="Number" runat="server" Text='<%# Bind("RoleYear") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditYear" runat="server" Text="*" ErrorMessage="Please Enter Year" ControlToValidate="txtEditYear" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("RoleYear") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertYear" TextMode="Number" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertYear" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter Year" ControlToValidate="txtInsertYear" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Manifesto Name" SortExpression="RoleImage" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditManifestorName" runat="server" Text='<%# Bind("ManifestoName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditManifestorName" runat="server" Text="*" ErrorMessage="Please Upload Role Image" ControlToValidate="txtEditManifestorName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblManifestoName" runat="server" Text='<%# Bind("ManifestoName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertManifestorName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertManifestorName" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Upload Role Image" ControlToValidate="txtInsertManifestorName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Manifesto Summary" SortExpression="RoleImage" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditManifestorShortDesc" runat="server" Text='<%# Bind("ManifestoSummary") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditManifestoShortDesc" runat="server" Text="*" ErrorMessage="Please Add Manifesto Summary" ControlToValidate="txtEditManifestorShortDesc" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblManifestoSummary" runat="server" Text='<%# Bind("ManifestoSummary") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertManifestoShortDesc" TextMode="MultiLine" Rows="2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertManifestoShortDesc" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Add Manifesto Summary" ControlToValidate="txtInsertManifestoShortDesc" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Manifesto Description" SortExpression="RoleImage" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditManifestorLongDesc" runat="server" TextMode="MultiLine" Rows="5" Text='<%# Bind("ManifestoDesc") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditManifestoLongDesc" runat="server" Text="*" ErrorMessage="Please Add Details Of Manifesto" ControlToValidate="txtEditManifestorLongDesc" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblManifestoDesc" runat="server" Text='<%# Bind("ManifestoDesc") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertManifestoLongDesc" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertManifestoLongDesc" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Add Details Of Manifesto" ControlToValidate="txtInsertManifestoLongDesc" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Candidate Name" HeaderStyle-ForeColor="White">

                    <EditItemTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlEditCandidateName" runat="server" Enabled="true">
                            <%--<asp:ListItem Selected="True" Value='<%# Eval("Candidate_Name") %>'></asp:ListItem>--%>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditCandidateName" runat="server" Text="*" ErrorMessage="Please Select Candidate Name" ControlToValidate="ddlEditCandidateName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCandidateName" runat="server" Text='<%# Bind("Candidate_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlInsertCandidateName" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertCandidateName" InitialValue="Select Name" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select Candidate Name" ControlToValidate="ddlInsertCandidateName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Role/Group Image" SortExpression="RoleImage" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:Image CssClass="input" ID="LabelRoleImage" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("RoleImages") %>'></asp:Image>
                        <br />
                        <asp:FileUpload CssClass="input" ID="fuEditRoleImage" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvEditRoleImage" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Upload Role Image" ControlToValidate="fuEditRoleImage" ForeColor="Red"></asp:RequiredFieldValidator>

                        <%--<asp:Image CssClass="input" ID="EditRoleImage" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("RoleImages") %>'></asp:Image>--%>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image CssClass="input" ID="LabelRoleImage" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("RoleImages") %>'></asp:Image>
                        <%--Text='<%# Bind("RoleImages") %>'--%>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:FileUpload CssClass="input" ID="fuInsertRoleImage" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvInsertRoleImage" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Upload Role Image" ControlToValidate="fuInsertRoleImage" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Status" SortExpression="RoleStatus" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlEditStatus" runat="server" SelectedValue='<%# Bind("RoleStatus") %>'>
                            <asp:ListItem Value="Select Status">Select Status</asp:ListItem>
                            <asp:ListItem Value="active">active</asp:ListItem>
                            <asp:ListItem Value="inactive">inactive</asp:ListItem>
                            <asp:ListItem Value="temporary block">temporary block</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditRoleStatus" InitialValue="Select Status" runat="server" Text="*" ErrorMessage="Please Select Role Status" ControlToValidate="ddlEditStatus" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblRoleStatus" runat="server" Text='<%# Bind("RoleStatus") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlInsertStatus" runat="server">
                            <asp:ListItem Value="Select Status">Select Status</asp:ListItem>
                            <asp:ListItem Value="active">active</asp:ListItem>
                            <asp:ListItem Value="inactive">inactive</asp:ListItem>
                            <asp:ListItem Value="temporary block">temporary block</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertRoleStatus" InitialValue="Select Status" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select Role Status" ControlToValidate="ddlInsertStatus" ForeColor="Red"></asp:RequiredFieldValidator>
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
    </div>
    <div>

        <asp:ValidationSummary ID="vsEdit" runat="server" ForeColor="Red" HeaderText="Please fix following Issues:" />
        <asp:ValidationSummary ID="vsInsert" ValidationGroup="vgInsert" runat="server" ForeColor="Red" HeaderText="Please fix following Issues:" />
    </div>

</asp:Content>

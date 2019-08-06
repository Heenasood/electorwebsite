<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="SmartE.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div style="margin-left: 350px">
        <table class="auto-style1" style="width: 500px">

            <tr>

                <td>
                    <asp:DropDownList ID="ddlSearch" runat="server" ValidationGroup="Search" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">

                        <asp:ListItem Selected="True">Select Criteria</asp:ListItem>
                        <asp:ListItem Value="UserName">Username</asp:ListItem>
                        <asp:ListItem Value="FirstName">Firstname</asp:ListItem>
                        <asp:ListItem Value="LastName">Lastname</asp:ListItem>
                        <asp:ListItem Value="EmailID">Email-ID</asp:ListItem>
                        <asp:ListItem Value="Passport">Passport</asp:ListItem>
                        <asp:ListItem Value="Gender">Gender</asp:ListItem>
                        <asp:ListItem Value="UserProfile">User-Profile</asp:ListItem>
                        <asp:ListItem Value="UserStatus">User-Status</asp:ListItem>

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ValidationGroup="Search" InitialValue="Select Criteria" ID="rfvddlSearch" runat="server" Text="*" ForeColor="Red" ControlToValidate="ddlSearch" ErrorMessage="Please Select A Search Criteria"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ValidationGroup="Search" ID="txtSearch" placeholder="Enter Keyword" runat="server"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btnSearch" ValidationGroup="Search" runat="server" CssClass="button primary fit" Style="text-align: left" Text="Search" OnClick="btnSearch_Click" /><br />
                    <br />
                    <asp:Button ID="btnReset" runat="server" Style="text-align: left" Text="Reset" OnClick="btnReset_Click" />&nbsp;&nbsp;
                   <asp:ValidationSummary ID="vsSearch" ValidationGroup="Search" runat="server" DisplayMode="List" ForeColor="Red" />
                    <asp:Label ValidationGroup="Search" ID="lblSearchError" runat="server"></asp:Label>
                </td>

            </tr>
        </table>
    </div>
    <div>
        <asp:Label ID="lblUserErrorMessage" runat="server"></asp:Label>
        <asp:Label ID="lblUserException" runat="server"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="grdViewUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" ShowFooter="True" OnRowCommand="grdViewUsers_RowCommand1" CellPadding="4" ForeColor="WhiteSmoke" BackColor="#D31D2A" GridLines="None" EditRowStyle-BorderColor="#D31D2A" HeaderStyle-BackColor="#D31D2A" HeaderStyle-ForeColor="White">
            <%--OnRowCommand="grdViewUsers_RowCommand" OnRowUpdating="grdViewUsers_RowUpdating" OnRowDeleting="grdViewUsers_RowDeleting" OnRowCancelingEdit="grdViewUsers_RowCancelingEdit"--%>
            <AlternatingRowStyle BackColor="White" />
            <Columns>

                <asp:TemplateField ShowHeader="False" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:ImageButton ToolTip="Update" ImageUrl="~/images/updateicon.jpg" ImageAlign="Middle" Height="22px" Width="22px" ID="btnUpdate" runat="server" CommandArgument='<%# Eval("UserID") %>' CausesValidation="True" CommandName="UpdateRow" Text="Update" OnClientClick="if (!confirm('Are you sure you want to update the record?')) return false;"></asp:ImageButton>
                        <asp:ImageButton ToolTip="Cancel" ImageUrl="~/images/Cancel icon.png" ID="btnCancel" ImageAlign="Middle" Height="22px" Width="22px" runat="server" CommandArgument='<%# Eval("UserID") %>' CausesValidation="False" CommandName="CancelUpdate" Text="Cancel"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ToolTip="Edit" ImageUrl="~/images/editicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnEdit" runat="server" CommandArgument='<%# Eval("UserID") %>' CausesValidation="False" CommandName="EditRow"></asp:ImageButton>
                        <asp:ImageButton ToolTip="Delete" ImageUrl="~/images/deleteicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnDelete" runat="server" CommandArgument='<%# Eval("UserID") %>' CausesValidation="False" CommandName="DeleteRow" OnClientClick="if (!confirm('Are you sure you want to delete the record?')) return false;" Text="Delete"></asp:ImageButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>



                <asp:TemplateField HeaderText="UserID" InsertVisible="False" SortExpression="UserID" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ToolTip="New Record" ImageUrl="~/images/image1.jpg" ImageAlign="Middle" Height="35px" Width="35px" ID="btnInsert" CommandName="InsertRow" runat="server" ValidationGroup="vgInsert" Text="Insert" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="UserName" SortExpression="UserName" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfveditUsername" runat="server" Text="*" ErrorMessage="Please Enter UserName" ControlToValidate="txtEditUserName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertUserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertUsername" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter UserName" ControlToValidate="txtInsertUserName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditFirstname" runat="server" Text="*" ErrorMessage="Please Enter Firstname" ControlToValidate="txtEditFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertFirstname" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter Firstname" ControlToValidate="txtInsertFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="LastName" SortExpression="LastName" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditLastname" runat="server" Text="*" ErrorMessage="Please Enter Lastname" ControlToValidate="txtEditLastName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertLastname" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter Lastname" ControlToValidate="txtInsertLastName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EmailID" SortExpression="EmailID" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditEmailID" runat="server" Text='<%# Bind("EmailID") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditEmailID" runat="server" Text="*" ErrorMessage="Please Enter Email-ID" ControlToValidate="txtEditEmailID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("EmailID") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertEmailID" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertEmailID" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter Email-ID" ControlToValidate="txtInsertEmailID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Passport" SortExpression="Passport" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditPassport" runat="server" Text='<%# Bind("Passport") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditPassport" runat="server" Text="*" ErrorMessage="Please Enter Passport" ControlToValidate="txtEditPassport" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Passport") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertPassport" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertpassport" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter Passport" ControlToValidate="txtInsertPassport" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender" SortExpression="Gender" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlEditGender" runat="server" SelectedValue='<%# Bind("Gender") %>'>
                            <asp:ListItem Value="Select Gender">Select Gender</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Unknown">Unknown</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="Select Gender" ID="rfvEditGender" runat="server" Text="*" ErrorMessage="Please Select Gender" ControlToValidate="ddlEditGender" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlInsertGender" runat="server">
                            <asp:ListItem Value="Select Gender">Select Gender</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Unknown">Unknown</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertGender" InitialValue="Select Gender" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select Gender" ControlToValidate="ddlInsertGender" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Mobile" SortExpression="Mobile" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditMobile" runat="server" Text="*" ErrorMessage="Please Enter Mobile Number" ControlToValidate="txtEditMobile" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertMobile" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertMobile" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter Mobile Number" ControlToValidate="txtInsertMobile" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Password" SortExpression="Password" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="input" ID="txtEditPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditPassword" runat="server" Text="*" ErrorMessage="Please Enter Password" ControlToValidate="txtEditPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox CssClass="input" ID="txtInsertPassword" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertPassword" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter Password" ControlToValidate="txtInsertPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="UserProfile" SortExpression="UserProfile" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlEditUserProfile" runat="server" SelectedValue='<%# Bind("UserProfile") %>'>
                            <asp:ListItem Value="Select Profile">Select Profile</asp:ListItem>
                            <asp:ListItem Value="admin">admin</asp:ListItem>
                            <asp:ListItem Value="Candidate">Candidate</asp:ListItem>
                            <asp:ListItem Value="Elector">Elector</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="Select Profile" ID="rfvEditUserProfile" runat="server" Text="*" ErrorMessage="Please Select User-Profile" ControlToValidate="ddlEditUserProfile" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("UserProfile") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlInsertUserProfile" runat="server">
                            <asp:ListItem Value="Select Profile">Select Profile</asp:ListItem>
                            <asp:ListItem Value="admin">admin</asp:ListItem>
                            <asp:ListItem Value="Candidate">Candidate</asp:ListItem>
                            <asp:ListItem Value="Elector">Elector</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="Select Profile" ID="rfvInsertUserProfile" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select User-Profile" ControlToValidate="ddlInsertUserProfile" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProfileStatus" SortExpression="ProfileStatus" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlEditStatus" runat="server" SelectedValue='<%# Bind("ProfileStatus") %>'>
                            <asp:ListItem Value="Select Status">Select Status</asp:ListItem>
                            <asp:ListItem Value="active">active</asp:ListItem>
                            <asp:ListItem Value="inactive">inactive</asp:ListItem>
                            <asp:ListItem Value="temporary block">temporary block</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditProfileStatus" InitialValue="Select Status" runat="server" Text="*" ErrorMessage="Please Select Profile Status" ControlToValidate="ddlEditStatus" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("ProfileStatus") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList CssClass="input" ID="ddlInsertStatus" runat="server">
                            <asp:ListItem Value="Select Status">Select Status</asp:ListItem>
                            <asp:ListItem Value="active">active</asp:ListItem>
                            <asp:ListItem Value="inactive">inactive</asp:ListItem>
                            <asp:ListItem Value="temporary block">temporary block</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertProfileStatus" InitialValue="Select Status" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select Profile Status" ControlToValidate="ddlInsertStatus" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Right" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
    <div>
        <asp:ValidationSummary ID="vsEdit" runat="server" ForeColor="Red" HeaderText="Please fix following Issues:" DisplayMode="List" />
        <asp:ValidationSummary ID="vsInsert" ValidationGroup="vgInsert" runat="server" ForeColor="Red" HeaderText="Please fix following Issues:" DisplayMode="List" />
    </div>





</asp:Content>

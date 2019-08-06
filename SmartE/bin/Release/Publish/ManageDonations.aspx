<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="ManageDonations.aspx.cs" Inherits="SmartE.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label></div>
<div style="margin-left:50px; margin-right:50px;">


                <asp:GridView ID="grdViewDonation" runat="server" AutoGenerateColumns="False" DataKeyNames="DonateID" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" OnRowCommand="grdViewDonation_RowCommand">
                    <%--OnRowCommand="grdViewUsers_RowCommand1 OnRowCommand="grdViewUsers_RowCommand" OnRowUpdating="grdViewUsers_RowUpdating" OnRowDeleting="grdViewUsers_RowDeleting" OnRowCancelingEdit="grdViewUsers_RowCancelingEdit"--%>
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:TemplateField ShowHeader="False" HeaderStyle-ForeColor="White">
                            <EditItemTemplate>
                                <asp:ImageButton ToolTip="Update" ImageUrl="~/images/updateicon.jpg" ImageAlign="Middle" Height="22px" Width="22px" ID="btnUpdate" runat="server" CommandArgument='<%# Eval("DonateID") %>' CausesValidation="True" CommandName="UpdateRow" Text="Update"></asp:ImageButton>
                                <asp:ImageButton ToolTip="Cancel" ImageUrl="~/images/Cancel icon.png" ID="btnCancel" ImageAlign="Middle" Height="22px" Width="22px" runat="server" CommandArgument='<%# Eval("DonateID") %>' CausesValidation="False" CommandName="CancelUpdate" Text="Cancel"></asp:ImageButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ToolTip="Edit" ImageUrl="~/images/editicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnEdit" runat="server" CommandArgument='<%# Eval("DonateID") %>' CausesValidation="False" CommandName="EditRow" Text="Edit"></asp:ImageButton>
                                <asp:ImageButton ToolTip="Delete" ImageUrl="~/images/deleteicon.png" ImageAlign="Middle" Height="22px" Width="22px" ID="btnDelete" runat="server" CommandArgument='<%# Eval("DonateID") %>' CausesValidation="False" CommandName="DeleteRow" OnClientClick="Javascript: return Confirm(Are you sure you want to Delete?)" Text="Delete"></asp:ImageButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                            <FooterTemplate>
                                <asp:ImageButton ToolTip="New Record" ImageUrl="~/images/image1.jpg" ImageAlign="Middle" Height="35px" Width="35px" ID="btnInsert" CommandName="InsertRow" runat="server" ValidationGroup="vgInsert" Text="Insert" />
                            </FooterTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Donate ID" InsertVisible="False" SortExpression="UserID" HeaderStyle-ForeColor="White">
                            <EditItemTemplate>
                                <asp:Label ID="lblDonateID" runat="server" Text='<%# Eval("DonateID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDonateID" runat="server" Text='<%# Bind("DonateID") %>'></asp:Label>
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Donation Name" SortExpression="DonationName" HeaderStyle-ForeColor="White" >
                            <EditItemTemplate>
                                <asp:TextBox style="width:150px;" CssClass="input" ID="txtEditDonationName" runat="server" Text='<%# Bind("DonationName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfveditDonationName" runat="server" Text="*" ErrorMessage="Please Enter DonationName" ControlToValidate="txtEditDonationName" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("DonationName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox style="width:150px;" CssClass="input" ID="txtInsertDonationName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertDonationName" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter DonationName" ControlToValidate="txtInsertDonationName" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="DonationAmount" SortExpression="DonationAmount" HeaderStyle-ForeColor="White">
                            <EditItemTemplate>
                                <asp:TextBox style="width:150px;" CssClass="input" ID="txtEditDonationAmount" runat="server" Text='<%# Bind("DonationAmount") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditDonationAmount" runat="server" Text="*" ErrorMessage="Please Enter DonationAmount" ControlToValidate="txtEditDonationAmount" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("DonationAmount") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox style="width:150px;" CssClass="input" ID="txtInsertDonationAmount" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertDonationAmount" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Enter DonationAmount" ControlToValidate="txtInsertDonationAmount" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="Donation Description" SortExpression="DonationImage" HeaderStyle-ForeColor="White" HeaderStyle-Width="500px">
                            <EditItemTemplate>
                                <asp:TextBox style="width:400px;" CssClass="input" ID="txtEditDonationDesc" runat="server" TextMode="MultiLine"  Rows="5" Text='<%# Bind("DonationDesc") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditDonationDesc" runat="server" Text="*" ErrorMessage="Please Add Details Of Manifesto" ControlToValidate="txtEditDonationDesc" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label style="width:400px;" ID="lblManifestoDesc" runat="server" Text='<%# Bind("DonationDesc") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox style="width:400px;" CssClass="input" ID="txtInsertDonationDesc" TextMode="MultiLine" Columns="50" Rows="5" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertManifestoLongDesc" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Add Details Of Manifesto" ControlToValidate="txtInsertDonationDesc" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Donation Type" SortExpression="DonationStatus" HeaderStyle-ForeColor="White">
                            <EditItemTemplate>
                                <asp:DropDownList style="width:150px;" CssClass="input" ID="ddlEditDonationType" runat="server" SelectedValue='<%# Bind("DonationType") %>'>
                                    <asp:ListItem Value="Select Type">Select Status</asp:ListItem>
                                    <asp:ListItem Value="Hospital/School Charity">Hospital/School Charity</asp:ListItem>
                                    <asp:ListItem Value="Nobel Cause">Nobel Cause</asp:ListItem>
                                    <asp:ListItem Value="Public Welfare Funds">Public Welfare Funds</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvEditDonationType" InitialValue="Select Type" runat="server" Text="*" ErrorMessage="Please Select Donation Type" ControlToValidate="ddlEditDonationType" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label style="width:150px;" ID="lblDonationType" runat="server" Text='<%# Bind("DonationType") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList style="width:150px;" CssClass="input" ID="ddlInsertDonationType" runat="server">
                                    <asp:ListItem Value="Select Type">Select Status</asp:ListItem>
                                    <asp:ListItem Value="Hospital/School Charity">Hospital/School Charity</asp:ListItem>
                                    <asp:ListItem Value="Nobel Cause">Nobel Cause</asp:ListItem>
                                    <asp:ListItem Value="Public Welfare Funds">Public Welfare Funds</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvInsertDonationType" InitialValue="Select Type" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select Donation Type" ControlToValidate="ddlInsertDonationType" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="DonationImage" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Image ID="LabelDonationImage" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("DonationImage") %>'></asp:Image>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:FileUpload style="width:150px;" CssClass="input" ID="fuInsertDonationImage" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvInsertDonationImage" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Upload Donation Image" ControlToValidate="fuInsertDonationImage" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Status" SortExpression="DonationStatus" HeaderStyle-ForeColor="White">
                            <EditItemTemplate>
                                <asp:DropDownList style="width:150px;" CssClass="input" ID="ddlEditStatus" runat="server" SelectedValue='<%# Bind("DonationStatus") %>'>
                                    <asp:ListItem Value="Select Status">Select Type </asp:ListItem>
                                    <asp:ListItem Value="active">active</asp:ListItem>
                                    <asp:ListItem Value="inactive">inactive</asp:ListItem>
                                    <asp:ListItem Value="temporary block">temporary block</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvEditDonationStatus" InitialValue="Select Status" runat="server" Text="*" ErrorMessage="Please Select Role Status" ControlToValidate="ddlEditStatus" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label style="width:150px;" ID="lblDonationStatus" runat="server" Text='<%# Bind("DonationStatus") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList style="width:150px;" CssClass="input" ID="ddlInsertStatus" runat="server">
                                    <asp:ListItem Value="Select Status">Select Status</asp:ListItem>
                                    <asp:ListItem Value="active">active</asp:ListItem>
                                    <asp:ListItem Value="inactive">inactive</asp:ListItem>
                                    <asp:ListItem Value="temporary block">temporary block</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvInsertDonationStatus" InitialValue="Select Status" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select Role Status" ControlToValidate="ddlInsertStatus" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Promotions" SortExpression="Promotions" HeaderStyle-ForeColor="White">
                            <EditItemTemplate>
                                <asp:DropDownList style="width:150px;" CssClass="input" ID="ddlEditPromotions" runat="server" SelectedValue='<%# Bind("Promotions") %>'>
                                    <asp:ListItem Value="Select Promotion">Select Type </asp:ListItem>
                                    <asp:ListItem Value="True">True</asp:ListItem>
                                    <asp:ListItem Value="False">False</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvEditPromotions" InitialValue="Select Promotion" runat="server" Text="*" ErrorMessage="Please Select Promotion" ControlToValidate="ddlEditPromotions" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label style="width:150px;" ID="lblPromotions" runat="server" Text='<%# Bind("Promotions") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList style="width:150px;" CssClass="input" ID="ddlInsertPromotions" runat="server">
                                    <asp:ListItem Value="Select Promotion">Select Type </asp:ListItem>
                                    <asp:ListItem Value="True">True</asp:ListItem>
                                    <asp:ListItem Value="False">False</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvInsertPromotions" InitialValue="Select Promotion" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Select Promotion" ControlToValidate="ddlInsertPromotions" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>

                       <asp:TemplateField HeaderText="Discount Offered" SortExpression="DiscountImage" HeaderStyle-ForeColor="White" HeaderStyle-Width="500px">
                            <EditItemTemplate>
                                <asp:TextBox CssClass="input" ID="txtEditDiscount" runat="server" Text='<%# Bind("Discount") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditDiscount" runat="server" Text="*" ErrorMessage="Please Add Discount Price" ControlToValidate="txtEditDiscount" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDiscount" runat="server" Text='<%# Bind("Discount") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox CssClass="input" ID="txtInsertDiscount" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertDiscount" runat="server" ValidationGroup="vgInsert" Text="*" ErrorMessage="Please Add Discount Price" ControlToValidate="txtInsertDiscount" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smartElectorConnectionString %>" SelectCommand="SELECT * FROM [Donations]"></asp:SqlDataSource>
                <%--OnRowCommand="grdViewUsers_RowCommand" OnRowUpdating="grdViewUsers_RowUpdating" OnRowDeleting="grdViewUsers_RowDeleting" OnRowCancelingEdit="grdViewUsers_RowCancelingEdit"--%>
</div>
    <div>
        <asp:ValidationSummary ID="vsEdit" runat="server" ForeColor="Red" HeaderText="Please fix following Issues:" />
                <asp:ValidationSummary ID="vsInsert" ValidationGroup="vgInsert" runat="server" ForeColor="Red" HeaderText="Please fix following Issues:" />
    </div>
</asp:Content>

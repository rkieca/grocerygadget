<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Item.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Admin_Item" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Grocery Gadget</title>
    <link href="style/Admin_Page.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
        <div id="MainData">
            <div id="Header">
            <asp:Image ID="header_image" runat="server" ImageUrl="~/images/food_header.jpg" Width="481px"/>
            </div>
            <div id="Content">
                <br />
                <div style="text-align: center; font-size:large;">
                    <strong>EDIT ITEM TABLE</strong>
                </div>
                <br />
                Add or edit item information. Fill out all necessary texboxes.<br />
        <span class="auto-style1"><strong>NOTE</strong></span>: To upload an image, please click
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Admin_ItemImage.aspx">UPLOAD IMAGE TO ITEM</asp:LinkButton>
                .<br />
        <span class="auto-style1"><strong>NOTE</strong></span>: To find out what the numbers mean for either Category ID or Aisle ID, please refer to pages Edit Category or Edit Aisle.<br />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" HorizontalAlign="Center" AutoGenerateColumns="False" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnSorting="GridView1_Sorting" >
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you sure you want to UPDATE the selected Item Id?');"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to DELETE the selected Item Id?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item_Id" InsertVisible="False" SortExpression="Item_Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Item_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Item_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="lbInsert" ValidationGroup="INSERT"  runat="server" OnClick="lbInsert_Click">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item_Name" SortExpression="Item_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Width="200px" Text='<%# Bind("Item_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Item name is required." ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtItemName" runat="server" Width="200px" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertItemName" runat="server" ValidationGroup="INSERT" ErrorMessage="Item name is required." ControlToValidate="txtItemName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cat_Id" SortExpression="Cat_Id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="50px" Text='<%# Bind("Cat_Id") %>' DataSourceID="SqlDataSource1" DataTextField="Cat_Id" DataValueField="Cat_Id" SelectedValue='<%# Bind("Cat_Id") %>'></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [Cat_Id] FROM [CATEGORY]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Category ID is required." ControlToValidate="DropDownList1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cat_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddCatID" runat="server" Width="50px" DataSourceID="SqlDataSource2" DataTextField="Cat_Id" DataValueField="Cat_Id"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [Cat_Id] FROM [CATEGORY]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="InsertCatID" runat="server" ValidationGroup="INSERT" ErrorMessage="Category ID is required." ControlToValidate="ddCatID" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Aisle_Id" SortExpression="Aisle_Id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" Width="50px" Text='<%# Bind("Aisle_Id") %>' DataSourceID="SqlDataSource3" DataTextField="Aisle_Id" DataValueField="Aisle_Id" SelectedValue='<%# Bind("Aisle_Id") %>'></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [Aisle_Id] FROM [AISLE]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Aisle ID is required." ControlToValidate="DropDownList2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Aisle_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddAisleID" runat="server" Width="50px" DataSourceID="SqlDataSource4" DataTextField="Aisle_Id" DataValueField="Aisle_Id"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [Aisle_Id] FROM [AISLE]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="InsertAisleID" runat="server" ValidationGroup="INSERT" ErrorMessage="Aisle ID is required." ControlToValidate="ddAisleID" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item_ImgPath" SortExpression="Item_ImgPath">
                            <EditItemTemplate>
                                <asp:Label ID="TextBox4" runat="server" Text='<%# Bind("Item_ImgPath") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Item_ImgPath") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="INSERT" ForeColor="Red" runat="server" DisplayMode="List" />
                <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" DisplayMode="List" />
                <br />
                <br />
                <br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin_Home.aspx" Font-Bold="True">GO BACK TO MENU</asp:LinkButton>
                <br />
                <br />
                <br />
            </div>
            <div id="Footer">&copy;Copyright 2016. All Rights Reserved.</div>
        </div>
    </form>
</body>
</html>


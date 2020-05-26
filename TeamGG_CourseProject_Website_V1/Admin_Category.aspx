<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Category.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Admin_Category" %>

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
                    <strong>EDIT CATEGORY TABLE</strong>
                </div>
                <br />
                Add or edit category information. Fill out all necessary texboxes.<br />
        <span class="auto-style1"><strong>NOTE</strong></span>: To upload an image, please click
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Admin_CatImage.aspx">UPLOAD IMAGE TO CATEGORY</asp:LinkButton>
                .<br />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" HorizontalAlign="Center" AutoGenerateColumns="False" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnSorting="GridView1_Sorting">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you sure you want to UPDATE the selected Category Id?');"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to DELETE the selected Category Id? \n DELETING THE CATEGORY WILL DELETE ALL THE ITEMS FOR THAT CATEGORY!');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Cat_Id" InsertVisible="False" SortExpression="Cat_Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cat_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Cat_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="lbInsert" ValidationGroup="INSERT"  runat="server" OnClick="lbInsert_Click">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cat_Name" SortExpression="Cat_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Width="200px" Text='<%# Bind("Cat_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Category name is required." ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Cat_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtCategory" runat="server" Width="200px" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertCategory" runat="server" ValidationGroup="INSERT" ErrorMessage="Category name is required." ControlToValidate="txtCategory" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cat_Desc" SortExpression="Cat_Desc">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Width="250px" Text='<%# Bind("Cat_Desc") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description is required." ControlToValidate="TextBox2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cat_Desc") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Width="250px" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertDescription" runat="server" ValidationGroup="INSERT" ErrorMessage="Description is required." ControlToValidate="txtDescription" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cat_ImgPath" SortExpression="Cat_ImgPath">
                            <EditItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cat_ImgPath") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Cat_ImgPath") %>'></asp:Label>
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

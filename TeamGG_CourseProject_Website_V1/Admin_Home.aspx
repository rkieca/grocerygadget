<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Home.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Admin_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

        <title>Grocery Gadget</title>
    <link href="style/Admin_Page.css" rel="stylesheet" />

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
                    <strong>WELCOME, ADMINISTRATOR&nbsp;
                    <asp:Label ID="lblAdmin" runat="server" ForeColor="#9933FF"></asp:Label>
                    </strong>
                </div>
            <br />
            The most powerful place for modifying Grocery Gadget information on the website.<br />
            <br />
            <br />
        <table style="width:70%; margin-left:auto; margin-right:auto;">
            <tr>
                <td style="text-align:right;">
                    <asp:LinkButton ID="lbPerson" runat="server" PostBackUrl="~/Admin_Person.aspx" >Edit Person Table</asp:LinkButton>
                </td>
                <td style="text-align:left;">
                    View person table and edit information</td>
                </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:LinkButton ID="lbCategory" runat="server" PostBackUrl="~/Admin_Category.aspx">Edit  Category Table</asp:LinkButton>
                </td>
                <td style="text-align:left;">
                    View category table and edit information</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Admin_CatImage.aspx">Upload Image to Category Table</asp:LinkButton>
                </td>
                <td style="text-align:left;">
                    The only place to edit images for the Category page</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:LinkButton ID="lbAisle" runat="server" PostBackUrl="~/Admin_Aisle.aspx">Edit Aisle Table</asp:LinkButton>
                </td>
                <td style="text-align:left;">
                    View aisle table and edit information</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:LinkButton ID="lbItem" runat="server" PostBackUrl="~/Admin_Item.aspx">Edit Item Table</asp:LinkButton>
                </td>
                <td style="text-align:left;">
                    View item table and edit information</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Admin_ItemImage.aspx">Upload Image to Item Table</asp:LinkButton>
                </td>
                <td style="text-align:left;">
                    The only place to edit images for the Item page</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:LinkButton ID="lbShopList" runat="server" PostBackUrl="~/Admin_ShoppingList.aspx">View Shopping List Table by User</asp:LinkButton>
                </td>
                <td style="text-align:left;"> View shopping list that customers have made</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:LinkButton ID="lbList" runat="server" PostBackUrl="~/Admin_UserList.aspx" >View Shopping List Name by User</asp:LinkButton>
                </td>
                <td style="text-align:left;">
                    View shopping list name that was created by user</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
           <tr>
                <td style="text-align:right">
                    <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Admin_Special.aspx">Edit Special Table on Home Page</asp:LinkButton>
                </td>
                <td style="text-align:left;">
                    View home page and edit information</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <asp:LinkButton ID="lbLogOut" runat="server" OnClick="lbLogOut_Click" Font-Bold="True">LOG OUT</asp:LinkButton>
                </td>
                <td style="text-align:left;">
                    Safely log out of the admin page</td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            </table>
            <br />
            <br />
           </div>
        <div id="Footer">&copy;Copyright 2016. All Rights Reserved.</div>
    </div>
    </form>
</body>
</html>
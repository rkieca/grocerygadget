<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: center;
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:Panel ID="pnMenu" runat="server" HorizontalAlign="Center" Font-Size="X-Large" BackColor="White" BorderStyle="Outset">
                <a class="current" href="Home.aspx">HOME</a> | <a href="BrowseCategory.aspx">BROWSE</a> | <a href="ShoppingList.aspx">SHOPPING LIST</a> |
                <a href="EditPerson.aspx">EDIT INFO</a> | <asp:LinkButton id="logout0" Text="LOG OUT" OnClick="LinkButton_Click" runat="server" />
            </asp:Panel>
    <br />
    <div style="text-align:center; font-size: large;">
    <strong>WELCOME,
        <asp:Label ID="lblUser" runat="server" ForeColor="#9900FF"></asp:Label>
    </strong>
    </div>
    <div style="text-align:center;">
        <br />
        Welcome to XYZ Grocery Store's Grocery Gadget!<br />
        The one stop shop to create, customize and carry your grocery shopping lists wherever you go.
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        <br />
        <br />
       
    <span class="auto-style2"><strong>NOTE</strong></span>: Selecting one of the coupons above will enlarge the image on a new tab/window.<br />
        </div>
         <br />
    <br />
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_UserList.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Admin_UserList" %>

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
                <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager> 
                <asp:UpdatePanel ID="panel1" runat="server"><ContentTemplate>  
                <br />
                <div style="text-align: center; font-size:large;">
                    <strong>VIEW SHOPPING LIST NAME BY USER</strong>
                </div>
                <br />
                    Select the user&#39;s full name from the dropdown list to view their shopping list names.<br />
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Full_Name" DataValueField="User_Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [User_Id], [FName] &amp; ' ' &amp; [LName] as Full_Name from [PERSON] Where Role = 'user'"></asp:SqlDataSource>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" HorizontalAlign="Center" AllowSorting="True" DataKeyNames="List_Id">
                    <Columns>
                        <asp:BoundField DataField="User_Id" HeaderText="User_Id" />
                        <asp:BoundField DataField="User_List" HeaderText="User_List" SortExpression="User_List" />                        
                        <asp:BoundField DataField="List_Id" HeaderText="List_Id" InsertVisible="False" SortExpression="List_Id" ReadOnly="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [List_Id], [User_Id], [User_List] FROM [LIST] WHERE [User_Id] = ?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="?" PropertyName="SelectedValue" />
                    </SelectParameters>                
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin_Home.aspx" Font-Bold="True">GO BACK TO MENU</asp:LinkButton>
                <br />
                <br />
                <br />
                </ContentTemplate></asp:UpdatePanel>
            </div>
            <div id="Footer">&copy;Copyright 2016. All Rights Reserved.</div>
        </div>
    </form>
</body>
</html>

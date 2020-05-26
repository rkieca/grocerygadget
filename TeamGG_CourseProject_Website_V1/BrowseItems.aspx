<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BrowseItems.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.BrowseItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnMenu" runat="server" HorizontalAlign="Center" Font-Size="X-Large" BackColor="White" BorderStyle="Outset">
        <a href="Home.aspx">HOME</a> | <a class="current" href="BrowseCategory.aspx">BROWSE</a> | <a href="ShoppingList.aspx">SHOPPING LIST</a> |
                <a href="EditPerson.aspx">EDIT INFO</a> |
        <asp:LinkButton ID="logout0" Text="LOG OUT" OnClick="LinkButton_Click" runat="server" />
    </asp:Panel>
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="panel1" runat="server">
    <ContentTemplate>            
    <br />
    <div style="text-align:center; font-size: large;">
        <strong>BROWSE ITEM</strong>
    </div>
    <div style="text-align: center;">
        <br />
               Place a check mark in the box next to the item(s) you want to add to your specified shopping list. <br /> Select the <em> Add To Shopping List </em>button when you are finished.<br />
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Item_Id" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
            <RowStyle HorizontalAlign="Center"></RowStyle>        
        <Columns>
            <asp:TemplateField HeaderText="">
                <EditItemTemplate>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ImageField HeaderText="Image" DataImageUrlField='Item_ImgPath' ControlStyle-Height="100px" ControlStyle-Width="100px">
                <ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField DataField="Item_Name" HeaderText="Item" />
            <asp:BoundField DataField="Cat_Name" HeaderText="Category" SortExpression="Cat_Name" />
            <asp:BoundField DataField="Aisle_Loc" HeaderText="Aisle Location" SortExpression="Aisle_Loc" />
            <asp:TemplateField HeaderText="Select your list">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="150px" DataSourceID="SqlDataSource2" DataTextField="User_List" DataValueField="List_Id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [List_Id], [User_List] FROM [LIST] Where [User_Id] = @User_Id">
                        <SelectParameters>
                            <asp:SessionParameter
                                Name="User_Id"
                                SessionField="User_Id"
                                DefaultValue="0" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <br />
    <div style="text-align: center;">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add to Shopping List" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT ITEM.Item_Id, ITEM.Item_ImgPath, ITEM.Item_Name, CATEGORY.Cat_Name, AISLE.Aisle_Loc
FROM CATEGORY INNER JOIN (AISLE INNER JOIN ITEM ON AISLE.Aisle_Id = ITEM.Aisle_Id) ON CATEGORY.Cat_Id = ITEM.Cat_Id WHERE ([CATEGORY.Cat_Id] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Cat_Id" QueryStringField="catID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

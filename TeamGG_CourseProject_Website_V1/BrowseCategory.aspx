<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BrowseCategory.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Browse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnMenu" runat="server" HorizontalAlign="Center" Font-Size="X-Large" BackColor="White" BorderStyle="Outset">
        <a href="Home.aspx">HOME</a> | <a class="current" href="BrowseCategory.aspx">BROWSE</a> | <a href="ShoppingList.aspx">SHOPPING LIST</a> |
                <a href="EditPerson.aspx">EDIT INFO</a> |
        <asp:LinkButton ID="logout0" Text="LOG OUT" OnClick="LinkButton_Click" runat="server" />
    </asp:Panel>
    <br />
    <div style="text-align: center; font-size: large;">
        <strong>BROWSE CATEGORY</strong>
    </div>
    <div style="text-align: center;">
        <br />
        Select the category below to view its items.<br />
        If you wish to <em>look up an item</em>,
            please
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="true" PostBackUrl="~/SearchItem.aspx">SEARCH HERE</asp:LinkButton>.<br />
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Cat_Id" DataSourceID="SqlDataSource1" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand">
        <RowStyle HorizontalAlign="Center"></RowStyle>
        <Columns>
            <asp:TemplateField HeaderText="" SortExpression="Cat_Id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cat_Id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="editQuantity" runat="server" CommandName="Q" CommandArgument='<%# Bind("Cat_Id") %>'>View</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ImageField HeaderText="Image" DataImageUrlField='Cat_ImgPath' ControlStyle-Height="100px" ControlStyle-Width="100px"></asp:ImageField>
            <asp:BoundField DataField="Cat_Name" HeaderText="Category" />
            <asp:BoundField DataField="Cat_Desc" HeaderText="Description" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT * FROM [CATEGORY]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

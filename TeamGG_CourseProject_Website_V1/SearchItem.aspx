<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SearchItem.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.SearchItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnMenu" runat="server" HorizontalAlign="Center" Font-Size="X-Large" BackColor="White" BorderStyle="Outset">
        <a href="Home.aspx">HOME</a> | <a class="current" href="BrowseCategory.aspx">BROWSE</a> | <a href="ShoppingList.aspx">SHOPPING LIST</a> |
                <a href="EditPerson.aspx">EDIT INFO</a> |
        <asp:LinkButton ID="logout0" Text="LOG OUT" OnClick="LinkButton_Click" runat="server" />
    </asp:Panel>
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="panel1" runat="server">
        <ContentTemplate>
            <br />
            <div style="text-align: center; font-size: large;">
                <strong>SEARCH FOR ITEM</strong>
            </div>
            <div style="text-align: center;">
                <br />
                Curious to see what we have instead of looking up based on category? Type in a basic item that you&#39;re looking for in the textbox.<br />
                <span class="auto-style1"><strong>NOTE</strong></span>: If you click on &quot;Add to Shopping List&quot; button and it does nothing, that means you have no item(s) selected.<br />
                <br />
                <asp:TextBox ID="txtSearch" runat="server" Width="195px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
                <br />
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" ForeColor="#6600CC"></asp:Label>
            </div>
            <br />
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
                    </asp:ImageField>
                    <asp:BoundField DataField="Item_Name" HeaderText="Item" SortExpression="Item_Name" />
                    <asp:BoundField DataField="Cat_Name" HeaderText="Category" SortExpression="Cat_Name" />
                    <asp:BoundField DataField="Aisle_Loc" HeaderText="Aisle Location" SortExpression="Aisle_Loc" />
                    <asp:TemplateField HeaderText="Select User's List" SortExpression="User_List">
                        <EditItemTemplate>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="150px" DataSourceID="SqlDataSource2" DataTextField="User_List" DataValueField="List_Id">
                            </asp:DropDownList>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>"
                SelectCommand="SELECT ITEM.Item_Id, ITEM.Item_ImgPath, ITEM.Item_Name, CATEGORY.Cat_Name, AISLE.Aisle_Loc
FROM CATEGORY INNER JOIN (AISLE INNER JOIN ITEM ON AISLE.Aisle_Id = ITEM.Aisle_Id) ON CATEGORY.Cat_Id = ITEM.Cat_Id
WHERE ([Item_Name] LIKE '%' + ? + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="Item_Name" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <div style="text-align: center;">
                <asp:Button ID="btnAdd" runat="server" Text="Add to Shopping List" OnClick="btnAdd_Message" CausesValidation="False" />
            </div>
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>


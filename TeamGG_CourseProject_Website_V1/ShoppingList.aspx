<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ShoppingList.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.ShoppingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style3 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnMenu" runat="server" HorizontalAlign="Center" Font-Size="X-Large" BackColor="White" BorderStyle="Outset">
        <a href="Home.aspx">HOME</a> | <a href="BrowseCategory.aspx">BROWSE</a> | <a class="current" href="ShoppingList.aspx">SHOPPING LIST</a> |
                <a href="EditPerson.aspx">EDIT INFO</a> |
        <asp:LinkButton ID="logout0" Text="LOG OUT" OnClick="LinkButton_Click" runat="server" />
    </asp:Panel>
    <br />
    <div style="text-align:center; font-size: large;">
        <strong>SHOPPING LIST</strong>
    </div>
    <div style="text-align:center;">
        <br />
        Please select a shopping list to view from the dropdown menu.<br />
        <span class="auto-style3"><strong>NOTE</strong></span>: If this is your first shopping list, <em> Default </em> will be your only shopping list option.<br />
        <br />
        To print your selected shopping list, <asp:LinkButton ID="linkPrint0" Font-Bold="true" runat="server" OnClientClick="PrintPage()">CLICK PRINT</asp:LinkButton>
        <script type="text/javascript">
            function PrintPage() {
                //Hide column Shop List Id
                rows = document.getElementById("<%= GridView1.ClientID %>").rows;
                for (i = 0; i < rows.length; i++) {
                    rows[i].cells[0].style.display = "none";
                }
                //Print code
                var printContent = document.getElementById('<%= GridView1.ClientID %>');
                var printWindow = window.open('', "PrintGridViewData", 'left=100,top=100,width=1000,height=1000');
                printWindow.document.write(printContent.outerHTML);
                printWindow.document.close();
                printWindow.focus();
                printWindow.print();
            }
        </script>
        <br />
        To create a <em>NEW</em> or <em>EDIT</em> a current shopping list,
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="true" PostBackUrl="~/EditList.aspx">CLICK ADD/EDIT LIST</asp:LinkButton>
        <br />
        <br />
        <asp:DropDownList ID="ddList" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="User_List" DataValueField="List_Id">        
        </asp:DropDownList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [List_Id], [User_List] FROM [LIST] Where [User_Id] = @User_Id">
            <SelectParameters>
                <asp:SessionParameter
                    Name="User_Id"
                    SessionField="User_Id"
                    DefaultValue="0" />
            </SelectParameters>         
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Shop_Id" DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True">
            <RowStyle HorizontalAlign="Center"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText="Shop ID" ItemStyle-CssClass="hideGridColumn" HeaderStyle-CssClass="hideGridColumn">
                    <EditItemTemplate>
                        <asp:Label ID="Label" runat="server" Text='<%# Bind("Shop_Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label" runat="server" Text='<%# Bind("Shop_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Item_ImgPath") %>' ControlStyle-Height="100px" ControlStyle-Width="100px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Item_ImgPath") %>' ControlStyle-Height="100px" ControlStyle-Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item" SortExpression="Item_Name">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Aisle Location" SortExpression="Aisle_Loc">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Aisle_Loc") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Aisle_Loc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy hh:mm tt}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy hh:mm tt}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <EditItemTemplate>
                        <script type="text/javascript">
                            function isNumberKey(evt) {
                                var charCode = (evt.which) ? evt.which : event.keyCode
                                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                                    alert("Please enter only numeric value.");
                                    return false;
                                }
                                return true;
                            }
                        </script>
                        <asp:TextBox ID="TextBox1" onkeypress="return isNumberKey(event)" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" Text="Textbox is blank" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Complete" SortExpression="Complete">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Complete") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Complete") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="linkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you sure you want to UPDATE the selected item?');"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="linkCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="linkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="linkDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to DELETE the selected item?');"></asp:LinkButton>
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
            <SortedDescendingCellStyle BackColor="#E9E7E2" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>"
            SelectCommand="SELECT [SHOPPING LIST].Shop_Id, ITEM.Item_ImgPath, ITEM.Item_Name, AISLE.Aisle_Loc, [SHOPPING LIST].Date, [SHOPPING LIST].Quantity, [SHOPPING LIST].Complete
            FROM PERSON INNER JOIN ((AISLE INNER JOIN ITEM ON AISLE.Aisle_Id = ITEM.Aisle_Id) INNER JOIN [SHOPPING LIST] ON ITEM.Item_Id = [SHOPPING LIST].Item_Id) ON PERSON.User_Id = [SHOPPING LIST].User_Id WHERE [SHOPPING LIST].User_Id = @User_Id and [SHOPPING LIST].List_Id = ? ORDER BY [SHOPPING LIST].Shop_Id;"
            DeleteCommand="DELETE FROM [SHOPPING LIST] WHERE [Shop_Id] = ?"
            UpdateCommand="UPDATE [SHOPPING LIST] SET [Quantity] = ?, [Complete] = ? WHERE [Shop_Id] = ?">
            <SelectParameters>
                <asp:SessionParameter
                    Name="User_Id"
                    SessionField="User_Id"
                    DefaultValue="0" />
                <asp:ControlParameter ControlID="ddList" Name="?" PropertyName="SelectedValue" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Shop_Id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Complete" Type="Boolean" />
                <asp:Parameter Name="Shop_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
</asp:Content>

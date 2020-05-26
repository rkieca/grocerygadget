<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Special.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Admin_Special" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grocery Gadget</title>
    <link href="style/Admin_Page.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 61px;
        }
        .auto-style4 {
            width: 311px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
                            <script type="text/javascript">
                                function CheckOtherIsCheckedByGVID(spanChk) {

                                    var IsChecked = spanChk.checked;
                                    var CurrentRdbID = spanChk.id;
                                    var Chk = spanChk;
                                    Parent = document.getElementById("<%=GridView1.ClientID%>");
                                    var items = Parent.getElementsByTagName('input');
                                    for (i = 0; i < items.length; i++) {
                                        if (items[i].id != CurrentRdbID && items[i].type == "radio") {
                                            if (items[i].checked) {
                                                items[i].checked = false;
                                                items[i].parentElement.parentElement.style.color = 'black';
                                            }
                                        }
                                    }
                                }
</script>
        <div id="MainData">
            <div id="Header">
                <asp:Image ID="header_image" runat="server" ImageUrl="~/images/food_header.jpg" Width="481px" />
            </div>
            <div id="Content">
                <br />
                <div style="text-align: center; font-size:large;">
                    <strong>EDIT SPECIAL TABLE ON HOME PAGE</strong>
                </div>
                <br />
                Add or edit special information.<br />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Special_Id" DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True">
                    <Columns>
                        <asp:TemplateField HeaderText="Special_Id" InsertVisible="False" SortExpression="Special_Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Special_Id") %>'></asp:Label>
                            </EditItemTemplate>
                        <ItemTemplate>
                            <asp:RadioButton ID="rbId" GroupName="test" runat="server" Text='<%# Bind("Special_Id") %>' onclick="javascript:CheckOtherIsCheckedByGVID(this);" />
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Special_ImgPath" SortExpression="Special_ImgPath">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Special_ImgPath") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Special_ImgPath") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" SortExpression="Special_ImgPath">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Special_ImgPath") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Special_ImgPath") %>' ControlStyle-Height="139px" ControlStyle-Width="200px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [Special_Id], [Special_ImgPath], [Special_ImgPath] FROM [SPECIAL]"></asp:SqlDataSource>
                <br />
                <table style="width:90%; margin-left:auto; margin-right:auto">
                <tr>
                <td class="auto-style1" style="text-align:center;">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="500px" />
                </td>
                </tr>
               </table>
                <br />
                <table style=" width:90%; margin-left:auto; margin-right:auto;">
                <tr>
                <td style="text-align:center;" class="auto-style4">
                <asp:Button ID="btnAdd" runat="server" Text="Add Image to Special" Width="155px" OnClick="btnAdd_Click" OnClientClick="return confirm('Are you sure you want to ADD an image to Specials table?');" />
                </td>
                <td style="text-align:center;" class="auto-style4">
                <asp:Button ID="btnUpdate" runat="server" Text="Update Special Selected" Width="160px" OnClick="btnUpdate_Click" OnClientClick="return confirm('Are you sure you want to UPDATE the selected Special Id?');" />
                </td>
                <td style="text-align:center;">
                <asp:Button ID="btnDelete" runat="server" Text="Delete Special Selected" Width="160px" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to DELETE the selected Special Id?');" />
                </td>
                </tr>
                </table>
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

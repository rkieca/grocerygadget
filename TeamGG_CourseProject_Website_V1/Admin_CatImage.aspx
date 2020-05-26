<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_CatImage.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Admin_CatImage" %>

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
        <div id="Content" style="text-align:center;">
                <br />
                <div style="text-align: center; font-size:large;">
                    <strong>UPLOAD IMAGES TO CATEGORY TABLE</strong>
                </div>
                <br />
            <div style="padding-left:80px; padding-right:80px">
            Select the category id to change the image and save it to the category table.<br />
            </div>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" HorizontalAlign="Center" DataKeyNames="Cat_Id" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="Cat_Id" InsertVisible="False" SortExpression="Cat_Id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cat_Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:RadioButton ID="rbId" runat="server" Text='<%# Bind("Cat_Id") %>' onclick="javascript:CheckOtherIsCheckedByGVID(this);" />
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
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Cat_Name" HeaderText="Cat_Name" SortExpression="Cat_Name" />
                    <asp:TemplateField InsertVisible="False" SortExpression="Cat_ImgPath">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Cat_ImgPath") %>' ControlStyle-Height="100px" ControlStyle-Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Cat_ImgPath" HeaderText="Cat_ImgPath" InsertVisible="False" ReadOnly="True" SortExpression="Cat_ImgPath" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GG_Database %>" ProviderName="<%$ ConnectionStrings:GG_Database.ProviderName %>" SelectCommand="SELECT [Cat_Id], [Cat_Name], [Cat_ImgPath], [Cat_ImgPath] FROM [CATEGORY]"></asp:SqlDataSource>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" Width="500px" />
            <br />
            <br />
            <br />
            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Update Image Selected" />
            <br />
            <br />
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

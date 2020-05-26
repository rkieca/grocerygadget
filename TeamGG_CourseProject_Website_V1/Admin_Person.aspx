<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Person.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Admin_Person" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grocery Gadget</title>
    <link href="style/Admin_Person.css" rel="stylesheet" />
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
                    <strong>EDIT PERSON TABLE</strong>
                </div>
                <br />
                Add or edit user login information. Fill out all necessary textboxes.<br />
        <span class="auto-style1"><strong>NOTE</strong></span>: If you see multiple exclamations after filling out a column, please click the Insert or Update link to view the error.<br />
                <br />
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" Width="70%" ShowFooter="True" AllowSorting="True" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnSorting="GridView1_Sorting">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you sure you want to UPDATE the selected User Id?');"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to DELETE the selected User Id? \n DELETING THE PERSON WILL DELETE ALL OF THEIR SHOPPING INFORMATION!');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="User_Id" SortExpression="User_Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("User_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("User_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="lbInsert" ValidationGroup="INSERT"  runat="server" OnClick="lbInsert_Click" >Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Width="100px" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name is required." ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtUserName" runat="server" Width="100px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertUser" runat="server" ValidationGroup="INSERT" ErrorMessage="User Name is required." ControlToValidate="txtUserName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UserPassword" SortExpression="UserPassword">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Width="100px" Text='<%# Bind("UserPassword") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required." ControlToValidate="TextBox2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserPassword") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtUserPsswd" Width="100px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertPsswd" runat="server" ValidationGroup="INSERT" ErrorMessage="Password is required." ControlToValidate="txtUserPsswd" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FName" SortExpression="FName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Width="100px" Text='<%# Bind("FName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="First Name is required." ControlToValidate="TextBox3" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFName" Width="100px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertName" runat="server" ValidationGroup="INSERT" ErrorMessage="First Name is required." ControlToValidate="txtFName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LName" SortExpression="LName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Width="100px" Text='<%# Bind("LName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Last Name is required." ControlToValidate="TextBox4" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("LName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtLName" Width="100px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertLast" runat="server" ValidationGroup="INSERT" ErrorMessage="Last Name is required." ControlToValidate="txtLName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SAdress" SortExpression="SAdress">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Width="150px" Text='<%# Bind("SAdress") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address is required." ControlToValidate="TextBox5" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("SAdress") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddress" Width="150px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertAddress" runat="server" ValidationGroup="INSERT" ErrorMessage="Address is required." ControlToValidate="txtAddress" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SCity" SortExpression="SCity">
                            <EditItemTemplate>
                                <script type="text/javascript">
                                    function isLetterKey(evt) {
                                        var charCode = (evt.which) ? evt.which : event.keyCode
                                        if (charCode > 31 && (charCode < 65 || charCode > 90 && charCode < 97 || charCode > 122) && charCode != 45 && charCode != 46 && charCode != 32 && charCode != 39) {
                                            alert("Please enter only alphabetical letters.");
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                                <asp:TextBox ID="TextBox6" onkeypress="return isLetterKey(event)" runat="server" Width="100px" Text='<%# Bind("SCity") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="City is required." ControlToValidate="TextBox6" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("SCity") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <script type="text/javascript">
                                    function isLetterKey(evt) {
                                        var charCode = (evt.which) ? evt.which : event.keyCode
                                        if (charCode > 31 && (charCode < 65 || charCode > 90 && charCode < 97 || charCode > 122) && charCode != 45 && charCode != 46 && charCode != 32 && charCode != 39) {
                                            alert("Please enter only alphabetical letters.");
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                                <asp:TextBox ID="txtCity" onkeypress="return isLetterKey(event)" Width="100px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertCity" runat="server" ValidationGroup="INSERT" ErrorMessage="City is required." ControlToValidate="txtCity" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SState" SortExpression="SState">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="50px" SelectedValue='<%# Bind("SState") %>'>
                                    <asp:ListItem>AL</asp:ListItem>
                                    <asp:ListItem>AK</asp:ListItem>
                                    <asp:ListItem>AZ</asp:ListItem>
                                    <asp:ListItem>AR</asp:ListItem>
                                    <asp:ListItem>CA</asp:ListItem>
                                    <asp:ListItem>CO</asp:ListItem>
                                    <asp:ListItem>CT</asp:ListItem>
                                    <asp:ListItem>DE</asp:ListItem>
                                    <asp:ListItem>FL</asp:ListItem>
                                    <asp:ListItem>GA</asp:ListItem>
                                    <asp:ListItem>HI</asp:ListItem>
                                    <asp:ListItem>ID</asp:ListItem>
                                    <asp:ListItem>IL</asp:ListItem>
                                    <asp:ListItem>IN</asp:ListItem>
                                    <asp:ListItem>IA</asp:ListItem>
                                    <asp:ListItem>KS</asp:ListItem>
                                    <asp:ListItem>KY</asp:ListItem>
                                    <asp:ListItem>LA</asp:ListItem>
                                    <asp:ListItem>ME</asp:ListItem>
                                    <asp:ListItem>MD</asp:ListItem>
                                    <asp:ListItem>MA</asp:ListItem>
                                    <asp:ListItem>MI</asp:ListItem>
                                    <asp:ListItem>MN</asp:ListItem>
                                    <asp:ListItem>MS</asp:ListItem>
                                    <asp:ListItem>MO</asp:ListItem>
                                    <asp:ListItem>MT</asp:ListItem>
                                    <asp:ListItem>NE</asp:ListItem>
                                    <asp:ListItem>NV</asp:ListItem>
                                    <asp:ListItem>NH</asp:ListItem>
                                    <asp:ListItem>NJ</asp:ListItem>
                                    <asp:ListItem>NM</asp:ListItem>
                                    <asp:ListItem>NY</asp:ListItem>
                                    <asp:ListItem>NC</asp:ListItem>
                                    <asp:ListItem>ND</asp:ListItem>
                                    <asp:ListItem>OH</asp:ListItem>
                                    <asp:ListItem>OK</asp:ListItem>
                                    <asp:ListItem>OR</asp:ListItem>
                                    <asp:ListItem>PA</asp:ListItem>
                                    <asp:ListItem>RI</asp:ListItem>
                                    <asp:ListItem>SC</asp:ListItem>
                                    <asp:ListItem>SD</asp:ListItem>
                                    <asp:ListItem>TN</asp:ListItem>
                                    <asp:ListItem>TX</asp:ListItem>
                                    <asp:ListItem>UT</asp:ListItem>
                                    <asp:ListItem>VT</asp:ListItem>
                                    <asp:ListItem>VA</asp:ListItem>
                                    <asp:ListItem>WA</asp:ListItem>
                                    <asp:ListItem>WV</asp:ListItem>
                                    <asp:ListItem>WI</asp:ListItem>
                                    <asp:ListItem>WY</asp:ListItem>
                                    <asp:ListItem>DC</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="State is required." ControlToValidate="DropDownList1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("SState") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddState" runat="server" Width="50px" SelectedValue='<%# Bind("SState") %>'>
                                    <asp:ListItem>AL</asp:ListItem>
                                    <asp:ListItem>AK</asp:ListItem>
                                    <asp:ListItem>AZ</asp:ListItem>
                                    <asp:ListItem>AR</asp:ListItem>
                                    <asp:ListItem>CA</asp:ListItem>
                                    <asp:ListItem>CO</asp:ListItem>
                                    <asp:ListItem>CT</asp:ListItem>
                                    <asp:ListItem>DE</asp:ListItem>
                                    <asp:ListItem>FL</asp:ListItem>
                                    <asp:ListItem>GA</asp:ListItem>
                                    <asp:ListItem>HI</asp:ListItem>
                                    <asp:ListItem>ID</asp:ListItem>
                                    <asp:ListItem>IL</asp:ListItem>
                                    <asp:ListItem>IN</asp:ListItem>
                                    <asp:ListItem>IA</asp:ListItem>
                                    <asp:ListItem>KS</asp:ListItem>
                                    <asp:ListItem>KY</asp:ListItem>
                                    <asp:ListItem>LA</asp:ListItem>
                                    <asp:ListItem>ME</asp:ListItem>
                                    <asp:ListItem>MD</asp:ListItem>
                                    <asp:ListItem>MA</asp:ListItem>
                                    <asp:ListItem>MI</asp:ListItem>
                                    <asp:ListItem>MN</asp:ListItem>
                                    <asp:ListItem>MS</asp:ListItem>
                                    <asp:ListItem>MO</asp:ListItem>
                                    <asp:ListItem>MT</asp:ListItem>
                                    <asp:ListItem>NE</asp:ListItem>
                                    <asp:ListItem>NV</asp:ListItem>
                                    <asp:ListItem>NH</asp:ListItem>
                                    <asp:ListItem>NJ</asp:ListItem>
                                    <asp:ListItem>NM</asp:ListItem>
                                    <asp:ListItem>NY</asp:ListItem>
                                    <asp:ListItem>NC</asp:ListItem>
                                    <asp:ListItem>ND</asp:ListItem>
                                    <asp:ListItem>OH</asp:ListItem>
                                    <asp:ListItem>OK</asp:ListItem>
                                    <asp:ListItem>OR</asp:ListItem>
                                    <asp:ListItem>PA</asp:ListItem>
                                    <asp:ListItem>RI</asp:ListItem>
                                    <asp:ListItem>SC</asp:ListItem>
                                    <asp:ListItem>SD</asp:ListItem>
                                    <asp:ListItem>TN</asp:ListItem>
                                    <asp:ListItem>TX</asp:ListItem>
                                    <asp:ListItem>UT</asp:ListItem>
                                    <asp:ListItem>VT</asp:ListItem>
                                    <asp:ListItem>VA</asp:ListItem>
                                    <asp:ListItem>WA</asp:ListItem>
                                    <asp:ListItem>WV</asp:ListItem>
                                    <asp:ListItem>WI</asp:ListItem>
                                    <asp:ListItem>WY</asp:ListItem>
                                    <asp:ListItem>DC</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="InsertState" runat="server" ValidationGroup="INSERT" ErrorMessage="State is required." ControlToValidate="ddState" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SZip" SortExpression="SZip">
                            <EditItemTemplate>
                                <script type="text/javascript">
                                    function isNumberKey(evt) {
                                        var charCode = (evt.which) ? evt.which : event.keyCode
                                        if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 45) {
                                            alert("Please enter only numeric value.");
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                                <asp:TextBox ID="TextBox8" onkeypress="return isNumberKey(event)" runat="server" Width="50px" Text='<%# Bind("SZip") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Zip Code is required." ControlToValidate="TextBox8" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Zip Code must be in format 99999" Text="!!!!!!" Display="Dynamic" ForeColor="red" ValidationExpression="\d{5}(-\d{4})?" ControlToValidate="TextBox8"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("SZip") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <script type="text/javascript">
                                    function isNumberKey(evt) {
                                        var charCode = (evt.which) ? evt.which : event.keyCode
                                        if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 45) {
                                            alert("Please enter only numeric value.");
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                                <asp:TextBox ID="txtZip" onkeypress="return isNumberKey(event)" Width="50px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertZip" runat="server" ValidationGroup="INSERT" ErrorMessage="Zip Code is required." ControlToValidate="txtZip" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="INSERT" ErrorMessage="Zip Code must be in format 99999" Text="!!!!!!" Display="Dynamic" ForeColor="red" ValidationExpression="\d{5}(-\d{4})?" ControlToValidate="txtZip"></asp:RegularExpressionValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SPhone" SortExpression="SPhone">
                            <EditItemTemplate>
                                <script type="text/javascript">
                                    function isNumberKey(evt) {
                                        var charCode = (evt.which) ? evt.which : event.keyCode
                                        if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 45) {
                                            alert("Please enter only numeric value.");
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                                <asp:TextBox ID="TextBox9" onkeypress="return isNumberKey(event)" runat="server" Width="100px" Text='<%# Bind("SPhone") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Phone is required." ControlToValidate="TextBox9" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Text="!!!!!!" ErrorMessage="Phone Number must be in format 999-999-9999" Display="Dynamic" ForeColor="red" ControlToValidate="TextBox9" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("SPhone") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <script type="text/javascript">
                                    function isNumberKey(evt) {
                                        var charCode = (evt.which) ? evt.which : event.keyCode
                                        if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 45) {
                                            alert("Please enter only numeric value.");
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                                <asp:TextBox ID="txtPhone" onkeypress="return isNumberKey(event)" runat="server" Width="100px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertPhone" runat="server" ValidationGroup="INSERT" ErrorMessage="Phone is required." ControlToValidate="txtPhone" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Text="!!!!!!" ValidationGroup="INSERT" ErrorMessage="Phone Number must be in format 999-999-9999" Display="Dynamic" ForeColor="red" ControlToValidate="txtPhone" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" Width="125px" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="E-mail is required." ControlToValidate="TextBox10" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" Text="!!!!!!"  ControlToValidate="TextBox10" ErrorMessage="Email must be in format abc@abc.com" Display="Dynamic" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" Width="125px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertEmail" runat="server" ValidationGroup="INSERT" ErrorMessage="E-mail is required." ControlToValidate="txtEmail" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" Text="!!!!!!" ValidationGroup="INSERT" ControlToValidate="txtEmail" ErrorMessage="Email must be in format abc@abc.com" Display="Dynamic" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role" SortExpression="Role">
                            <EditItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddRole" Width="90px" runat="server">
                                    <asp:ListItem>Select role</asp:ListItem>
                                    <asp:ListItem>user</asp:ListItem>
                                    <asp:ListItem>admin</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="InsertRole" runat="server" ErrorMessage="Role is required." ValidationGroup="INSERT" ControlToValidate="ddRole" Text="*" ForeColor="Red" InitialValue="Select role"></asp:RequiredFieldValidator>
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

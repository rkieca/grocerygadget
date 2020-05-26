<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EditPerson.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.EditPerson" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        color: #FF0000;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnMenu" runat="server" HorizontalAlign="Center" Font-Size="X-Large" BackColor="White" BorderStyle="Outset">
        <a href="Home.aspx">HOME</a> | <a href="BrowseCategory.aspx">BROWSE</a> | <a href="ShoppingList.aspx">SHOPPING LIST</a> |
                <a class="current" href="EditPerson.aspx">EDIT INFO</a> |
        <asp:LinkButton ID="logout0" Text="LOG OUT" OnClick="LinkButton_Click" runat="server" CausesValidation="false" />
    </asp:Panel>
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>         
    <asp:UpdatePanel ID="panel1" runat="server"><ContentTemplate>    
    <br />
    <div style="text-align:center; font-size: large;">
        <strong>EDIT PERSONAL INFORMATION</strong>
    </div>
        <div style="text-align:center;">
         <br />
        <span class="auto-style3"> If there&#39;s anything that you want to change about yourself, feel free to do so and click the UPDATE button.</span><br />
        <span class="auto-style1"><strong>NOTE</strong></span>: You are only allowed to change the password to your account, not your user name.<br />
        </div>
        <br />
        <table style="width:70%; margin-left:auto; margin-right:auto">
            <tr>
                <td style="text-align:right;">
        <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtboxFN" runat="server" width="136px"></asp:TextBox>
                </td>
                <td style="text-align:left;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtboxFN" ErrorMessage="First Name cannot be blank!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
        <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtboxLN" runat="server" width="136px"></asp:TextBox>
                </td>
                <td style="text-align:left;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtboxLN" ErrorMessage="Last Name cannot be blank!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
        <asp:Label ID="Label3" runat="server" Text="Address:"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtboxAddress" runat="server" width="136px"></asp:TextBox>
                </td>
                <td style="text-align:left;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtboxAddress" ErrorMessage="Address cannot be blank!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
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
            <tr>
                <td style="text-align:right;">
        <asp:Label ID="Label4" runat="server" Text="City:"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtboxCity" onkeypress="return isLetterKey(event)" runat="server" width="136px" style="margin-top: 0px"></asp:TextBox>
                </td>
                <td style="text-align:left;"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtboxCity" ErrorMessage="City cannot be blank!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
        <asp:Label ID="Label5" runat="server" Text="State:"></asp:Label>
                </td>
                <td> <asp:DropDownList ID="ddState" runat="server" width="136px">
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
                </td>
                <td>&nbsp;</td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
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
                <td style="text-align:right;">
        <asp:Label ID="Label6" runat="server" Text="Zip Code:"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtboxZip" onkeypress="return isNumberKey(event)" runat="server" width="136px"></asp:TextBox>
                </td>
                <td style="text-align:left;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtboxZip" ErrorMessage="Zip Code cannot be blank!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
        <asp:Label ID="Label7" runat="server" Text="Telephone Number:"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtboxPhone" onkeypress="return isNumberKey(event)" runat="server" width="136px" ></asp:TextBox>
                </td>
                <td style="text-align:left;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtboxPhone" ErrorMessage="Phone cannot be blank!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
        <asp:Label ID="Label10" runat="server" Text="E-mail Address:"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtboxEmail" runat="server" width="136px" TextMode="Email"></asp:TextBox>
                </td>
                <td style="text-align:left;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtboxEmail" ErrorMessage="E-mail cannot be blank!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
        <asp:Label ID="Label8" runat="server" Text="Current User Name:"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtboxUser" runat="server" width="136px" Enabled="False"></asp:TextBox>
                </td>
                <td style="text-align:left;">
                    &nbsp;</td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
        <asp:Label ID="Label9" runat="server" Text="Change User Password:"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtboxPsswd" runat="server" width="136px"></asp:TextBox>
                </td>
                <td style="text-align:left;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtboxPsswd" ErrorMessage="Password cannot be blank!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: left">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Zip Code must be in format 99999" ForeColor="Red" style="text-align: left" ValidationExpression="\d{5}(-\d{4})?" ControlToValidate="txtboxZip"></asp:RegularExpressionValidator>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td style="text-align: left">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Phone Number must be in format 999-999-9999" style="text-align: left" ForeColor="Red" ControlToValidate="txtboxPhone" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="text-align: left">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtboxEmail" ErrorMessage="Email must be in format abc@abc.com" ForeColor="Red" style="text-align: left" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
           <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>

           <tr>
                <td style="text-align:right;">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" CausesValidation="true" OnClick="btnUpdate_Click" Text="UPDATE" Width="100px" />
                </td>
                <td style="text-align:left;">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        </ContentTemplate></asp:UpdatePanel>
</asp:Content>

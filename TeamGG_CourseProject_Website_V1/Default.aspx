<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TeamGG_CourseProject_Website_V1.Default" %>
<%@ OutputCache Location="None" NoStore="True" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Home.aspx"
             OnAuthenticate="Login1_Authenticate" TitleText="Please enter your username and password to login." style="width:375px; height:200px; margin-left:auto; margin-right:auto" >
        </asp:Login>
        <div style="text-align:center; font-size: medium">
If you do not have an account, please
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Register.aspx">Register</asp:LinkButton>
        </div>
        <br />
        <br />

</asp:Content>

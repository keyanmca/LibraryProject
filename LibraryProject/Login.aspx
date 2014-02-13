<%@ Page Title="" Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LibraryProject.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 119px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
    <tr>
        <td class="style2">
            User Name:</td>
        <td>
            <asp:TextBox ID="txbox_Username" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
            Password:</td>
        <td>
            <asp:TextBox ID="txbox_password" runat="server" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lbl_Intro" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:CheckBox ID="checkbox_rememberMe" runat="server" Text="Remember Me" />
        </td>
    </tr>
    <tr>
        <td class="style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_Login" runat="server" Height="26px" Text="Login" 
                Width="69px" onclick="btn_Login_Click" />
        </td>
        <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_register" runat="server" Text="Register" 
                onclick="btn_register_Click" />
        </td>
    </tr>
</table>
</asp:Content>

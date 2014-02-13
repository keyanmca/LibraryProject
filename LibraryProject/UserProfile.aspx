<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="LibraryProject.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 157px;
        }
        .style4
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                &nbsp;</td>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                User Name</td>
        <td>
            <asp:TextBox ID="TextBoxUsername" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style4">
            <asp:Label ID="lbl_passwordOld" runat="server" Text="Password(old)" 
                Visible="False"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxPasswordOld" runat="server" 
                TextMode="Password" Visible="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                Password</td>
        <td>
            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" 
                Visible="False"></asp:TextBox>
            <asp:LinkButton ID="lnkbtn_changePassword" runat="server" 
                onclick="lnkbtn_changePassword_Click">Change Password</asp:LinkButton>
&nbsp;
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                &nbsp;</td>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
            <asp:Label ID="lbl_passwordAgain" runat="server" Text="Password(again)" 
                Visible="False"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBoxPassagain" runat="server" TextMode="Password" 
                Visible="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_savePassword" runat="server" 
                onclick="btn_savePassword_Click" Text="Save Password" Visible="False" 
                Width="116px" />
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4" colspan="2">
            <asp:Label ID="lbl_introPass" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                &nbsp;</td>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                &nbsp;</td>
        <td>
                <asp:LinkButton ID="lnkbtn_edit" runat="server" onclick="lnkbtn_edit_Click">Edit Personal Informations</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                &nbsp;</td>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                Name</td>
        <td>
            <asp:TextBox ID="TextBoxName" runat="server" Enabled="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4" colspan="2">
                &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                Surname</td>
        <td>
            <asp:TextBox ID="TextBoxSurname" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                &nbsp;</td>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                E-mail</td>
        <td>
            <asp:TextBox ID="TextBoxEmail" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                &nbsp;</td>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                Birth Day</td>
        <td>
            <asp:Calendar ID="Calendar1" runat="server" Enabled="False"></asp:Calendar>
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style2" colspan="2">
                &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style2" colspan="2">
            <asp:Label ID="lbl_intro" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                &nbsp;</td>
        <td>
                <asp:Button ID="btn_Finish" runat="server" onclick="btn_Finish_Click" 
                    Text="Finish Editing" Visible="False" />
        </td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td class="style4">
                &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

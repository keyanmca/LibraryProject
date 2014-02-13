<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditNew.aspx.cs" Inherits="LibraryProject.EditNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style6" colspan="5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" colspan="6">
                Please fill the textbox.</td>
        </tr>
        <tr>
            <td class="style6" colspan="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                New Title:</td>
            <td class="style6">
                <asp:TextBox ID="TextBox_title" runat="server" style="margin-bottom: 1px" 
                    Width="180px"></asp:TextBox>
            </td>
            <td class="style6" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style6" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                Content:</td>
            <td class="style6">
                <asp:TextBox ID="TextBox_content" runat="server" Height="55px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="style6" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" colspan="6">
                <asp:Label ID="lbl_info" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style6" colspan="3">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Update" />
            </td>
        </tr>
    </table>
</asp:Content>

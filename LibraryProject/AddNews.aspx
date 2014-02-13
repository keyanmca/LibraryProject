<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="LibraryProject.AdminNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 670px;
            height: 63px;
        }
        .style5
        {
            height: 21px;
            width: 130px;
        }
        .style6
        {
            text-align: center;
        }
        .style8
        {
            text-align: left;
        }
        .style9
        {
            text-align: left;
            width: 98px;
        }
    </style>
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
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" />
            </td>
        </tr>
    </table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewBook.aspx.cs" Inherits="LibraryProject.ViewBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="templatemo_content_right0">
        <h1>
            <asp:Label ID="lbl_title" runat="server"></asp:Label>
        </h1>
        <div class="image_panel">
            <asp:Image ID="Image1" runat="server" Height="150px" Width="100px" />
        </div>
        <ul>
            <li>By
                <asp:Label ID="lbl_author" runat="server"></asp:Label>
            </li>
            <li>
                <asp:Label ID="lbl_Year" runat="server"></asp:Label>
            </li>
            <li>
                <asp:Label ID="lbl_category" runat="server"></asp:Label>
            </li>
            <li>
                <asp:Label ID="lbl_publisher" runat="server"></asp:Label>
            </li>
        </ul>
        <p>
            <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Height="141px" 
                TextMode="MultiLine" Width="536px">dsgfsdxcvgdfgbdgb</asp:TextBox>
        </p>
        <div class="cleaner_with_height">
            &nbsp;</div>
&nbsp;</div>
</asp:Content>

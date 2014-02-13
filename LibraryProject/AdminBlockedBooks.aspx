﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminBlockedBooks.aspx.cs" Inherits="LibraryProject.AdminBlockedBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:DataList ID="DataList1" runat="server" BorderColor="#FFCC00" 
                    CellPadding="3" RepeatColumns="2">
                    <ItemTemplate>
                       <div class="templatemo_product_box">
            	<h1><%# Eval("BookTitle") %>  <span>(<%# Eval("Author") %>-<%# Eval("Year") %>)</span></h1>
                <asp:Image ID="resim" Width="100" Height="150" 
                             ImageUrl='<%#Eval("ImagePath")%>' runat="server" />
                <div class="product_info">
                    <p><%# Eval("Publisher") %>-<%# Eval("CategoryName") %></p>
                	<p><%# Eval("desc") %></p>
                    <div class="buy_now_button"><a href="EditBooks.aspx?bid=<%# Eval("BookID") %>" >Edit</a></div>
                    <div class="detail_button"><a href="AdminBlockedBooks.aspx?bid=<%# Eval("BookID") %>">UnBlock </a></div>
                </div>
                <div class="cleaner">&nbsp;</div>
            </div>
                    </ItemTemplate>
                </asp:DataList>
</asp:Content>

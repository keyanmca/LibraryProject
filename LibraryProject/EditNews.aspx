<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditNews.aspx.cs" Inherits="LibraryProject.EditNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td>
                
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="LibraryProject.GenelDataContext" EntityTypeName="" 
        TableName="tbl_News">
    </asp:LinqDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="NewID" 
        DataSourceID="LinqDataSource1" RepeatColumns="2">
        <ItemTemplate>
           <div class="templatemo_product_box">
           <table class="style1">
        <tr>
            <td>
               <h1> <%# Eval("Title") %></h1>
            </td>
            <td></td>
            <td>
            
                &nbsp;</td>
        </tr>
        <tr>
            <td>
            <%# Eval("Date")%>
            <br />
            <asp:Label ID="Label1" runat="server" 
            
                Text='<%# Eval("NewContent") %>' />
                
                &nbsp;</td>
                <td></td>
            <td>
            <div class="buy_now_button"><a href="EditNew.aspx?nid=<%# Eval("NewID") %>" >Edit</a></div>
            
            <div class="detail_button"><a href="EditNews.aspx?nid=<%# Eval("NewID") %>">Remove </a></div>
                &nbsp;</td>
        </tr>
    </table>
    </div>

       
<br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

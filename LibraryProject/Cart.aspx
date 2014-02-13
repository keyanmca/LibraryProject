<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="LibraryProject.Cart" %>
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
            <td colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <asp:DataList ID="DataList1" runat="server" BorderColor="#FFCC00" 
        CellPadding="3" RepeatColumns="2">
        <ItemTemplate>
            <div class="templatemo_product_box">
                <h1>
                    <%# Eval("BookTitle") %><span>(<%# Eval("Author") %>-<%# Eval("Year") %>)</span></h1>
                <asp:Image ID="resim" runat="server" Height="150" 
                    ImageUrl='<%#Eval("ImagePath")%>' Width="100" />
                <div class="product_info">
                    <p>
                        <%# Eval("Publisher") %>-<%# Eval("CategoryName") %></p>
                    <p>
                        <%# Eval("desc") %>
                    </p>
                    <div class="buy_now_button">
                        <a href='ViewBook.aspx?bid=<%# Eval("BookID") %>'>View</a></div>
                    <div class="detail_button">
                        <a href='Cart.aspx?dbid=<%# Eval("BookID") %>'>Remove From Cart </a>
                    </div>
                </div>
                <div class="cleaner">
                    &nbsp;</div>
            </div>
        </ItemTemplate>
    </asp:DataList>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Button ID="Btn_Continue" runat="server" onclick="Btn_Continue_Click" 
                    Text="Continue Order" />
            </td>
            <td style="text-align: center">
                <asp:Button ID="Btn_Barrow" runat="server" onclick="Btn_Barrow_Click" 
                    Text="Barrow" />
            </td>
        </tr>
    </table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UserBooks.aspx.cs" Inherits="LibraryProject.UserBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                        <a href='Cart.aspx?bid=<%# Eval("BookID") %>'>Add to Cart </a>
                    </div>
                </div>
                <div class="cleaner">
                    &nbsp;</div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

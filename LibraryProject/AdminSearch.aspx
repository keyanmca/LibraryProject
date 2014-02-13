<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminSearch.aspx.cs" Inherits="LibraryProject.AdminSearch" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
        }
        .style3
        {
            height: 30px;
            text-align: center;
        }
        .style4
        {
            height: 30px;
        }
        .style5
        {
            height: 21px;
        }
        .style6
        {
            width: 13px;
        }
        .style7
        {
            height: 21px;
            width: 13px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style3" colspan="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" colspan="6">
                <asp:Panel ID="Panel4" runat="server">
                    <table class="style1">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Advanced Search</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel3" runat="server" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td>
                                Title</td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style5">
                                Author</td>
                            <td class="style5">
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </td>
                            <td class="style5">
                            </td>
                            <td class="style5">
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td>
                                Category</td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="LinqDataSource1" DataTextField="CategoryName" 
                DataValueField="CategoryId" style="margin-left: 0px">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                ContextTypeName="LibraryProject.GenelDataContext" EntityTypeName="" 
                TableName="tbl_Categories">
                                </asp:LinqDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Search" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Normal Search</asp:LinkButton>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="6">
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
                    <div class="buy_now_button"><a href="EditBooks.aspx?bid=<%# Eval("BookID") %>" >Edit</a></div>
                    <div class="detail_button"><a href="AdminBooks.aspx?bid=<%# Eval("BookID") %>">Block </a></div>
                </div>
                <div class="cleaner">
                    &nbsp;</div>
            </div>
        </ItemTemplate>
    </asp:DataList>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

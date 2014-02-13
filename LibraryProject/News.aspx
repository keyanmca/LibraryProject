<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="LibraryProject.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="NewID" 
        DataSourceID="LinqDataSource1" RepeatColumns="2">
        <ItemTemplate>
            <div class="templatemo_product_box">
                <table class="style1">
                    <tr>
                        <td>
                            <h1>
                                <%# Eval("Title") %>
                            </h1>
                        </td>
                        <td>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <%# Eval("Date")%>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("NewContent") %>' />
                            &nbsp;</td>
                        <td>
                        </td>
                        <td>
                            
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="LibraryProject.GenelDataContext" EntityTypeName="" 
        TableName="tbl_News">
    </asp:LinqDataSource>
</asp:Content>

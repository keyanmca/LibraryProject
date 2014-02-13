<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="LibraryProject.ViewOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
        }
        .style4
        {
            text-align: center;
            width: 44px;
        }
        .style3
        {
            text-align: center;
            width: 98px;
        }
        .style5
        {
            text-align: center;
            height: 21px;
        }
        .style6
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="2" style="text-align: center">
                &nbsp;</td>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td colspan="2" style="text-align: center" class="style6">
            </td>
            <td class="style5" colspan="2">
            </td>
            <td class="style5">
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td colspan="2" style="text-align: center" class="style6">
                Order ID</td>
            <td class="style5" colspan="2">
                :</td>
            <td class="style5">
                <asp:Label ID="lbl_orderid" runat="server"></asp:Label>
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td colspan="2" style="text-align: center" class="style6">
                User Name</td>
            <td class="style5" colspan="2">
                :</td>
            <td class="style5">
                <asp:Label ID="lbl_username" runat="server"></asp:Label>
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="2" style="text-align: center">
                Start Date</td>
            <td class="style2" colspan="2">
                :</td>
            <td class="style2">
                <asp:Label ID="lbl_startdate" runat="server"></asp:Label>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="2" style="text-align: center">
                Finish Date</td>
            <td class="style2" colspan="2">
                :</td>
            <td class="style2">
                <asp:Label ID="lbl_finis" runat="server"></asp:Label>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="2" style="text-align: center">
                State</td>
            <td class="style2" colspan="2">
                :</td>
            <td class="style2">
                <asp:Label ID="lbl_state" runat="server"></asp:Label>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="7">
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
                                <div class="cleaner">
                    &nbsp;</div>
                            </div>
                    </ItemTemplate>
                </asp:DataList>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                &nbsp;</td>
            <td class="style3" colspan="2">
                &nbsp;</td>
            <td class="style2" colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

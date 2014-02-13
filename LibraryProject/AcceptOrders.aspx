<%@ Page Title="" Language="C#" MasterPageFile="~/Supporter.Master" AutoEventWireup="true" CodeBehind="AcceptOrders.aspx.cs" Inherits="LibraryProject.AcceptOrders" %>
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
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" DataKeyNames="OrderID" DataSourceID="LinqDataSource1" 
                    ForeColor="Black" GridLines="Vertical" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    style="text-align: center" Width="662px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="View" ShowSelectButton="True" />
                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="OrderID" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" 
                            SortExpression="UserID" />
                        <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                            SortExpression="StartDate" />
                        <asp:BoundField DataField="FinishDate" HeaderText="FinishDate" 
                            SortExpression="FinishDate" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                    ContextTypeName="LibraryProject.GenelDataContext" EntityTypeName="" 
                    TableName="tbl_orders" Where="State == @State">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="Waiting" Name="State" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

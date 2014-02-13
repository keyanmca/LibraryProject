<%@ Page Title="" Language="C#" MasterPageFile="~/Supporter.Master" AutoEventWireup="true" CodeBehind="AcceptReturns.aspx.cs" Inherits="LibraryProject.AcceptReturns" %>
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
            <td colspan="3" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Accept Returns</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" DataKeyNames="OrderID" DataSourceID="LinqDataSource1" 
                    ForeColor="Black" GridLines="Vertical" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    style="text-align: center" Width="660px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox_Select" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
                        <asp:Parameter DefaultValue="Accepted" Name="State" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

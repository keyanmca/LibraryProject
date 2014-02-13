<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="LibraryProject.Messages" %>
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
            <td style="text-align: center">
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Readed</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="LinqDataSource1" ForeColor="Black" 
                    GridLines="Vertical" style="text-align: center" Width="660px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MessageID" HeaderText="MessageID" ReadOnly="True" 
                            SortExpression="MessageID" />
                        <asp:BoundField DataField="state" HeaderText="state" ReadOnly="True" 
                            SortExpression="state" />
                        <asp:BoundField DataField="message" HeaderText="message" ReadOnly="True" 
                            SortExpression="message" />
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
                    Select="new (message, state, MessageID)" TableName="tbl_Messages" 
                    Where="userID == @userID">
                    <WhereParameters>
                        <asp:SessionParameter DefaultValue="0" Name="userID" SessionField="userID" 
                            Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="LibraryProject.EditUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        height: 18px;
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td class="style2">
            &nbsp;</td>
        <td class="style2">
            &nbsp;</td>
        <td class="style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            <asp:LinkButton ID="lnkbtn_delete" runat="server" onclick="lnkbtn_delete_Click">Delete Users</asp:LinkButton>
        </td>
        <td class="style2">
            <asp:LinkButton ID="lnkbtn_ban" runat="server" onclick="lnkbtn_ban_Click">Ban Users</asp:LinkButton>
        </td>
        <td class="style2">
            <asp:LinkButton ID="lnkbtn_makeAdmin" runat="server" 
                onclick="lnkbtn_makeAdmin_Click">Make Admin</asp:LinkButton>
        </td>
        <td class="style2">
            <asp:LinkButton ID="lnkbtn_makeSupport" runat="server" 
                onclick="lnkbtn_makeSupport_Click">Add support team</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="4">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="LinqDataSourceTbl_user" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                GridLines="Horizontal" Width="618px">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="CheckBoxSelect" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="UserName" HeaderText="UserName" 
            SortExpression="UserName" ReadOnly="True" />
        <asp:BoundField DataField="Password" HeaderText="Password" 
            SortExpression="Password" ReadOnly="True" />
        <asp:BoundField DataField="Name" HeaderText="Name" 
            SortExpression="Name" ReadOnly="True" />
    </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
</asp:GridView>
<asp:LinqDataSource ID="LinqDataSourceTbl_user" runat="server" 
    ContextTypeName="LibraryProject.GenelDataContext" EntityTypeName="" 
    TableName="tbl_users" Select="new (UserName, Password, Name)" Where="Type == @Type">
    <WhereParameters>
        <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
    </WhereParameters>
</asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="4">
            <asp:Label ID="lbl_intro" runat="server" ForeColor="#80FF00"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

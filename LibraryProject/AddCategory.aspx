<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="LibraryProject.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            text-align: center;
            width: 252px;
        }
        .style4
        {
            text-align: left;
            width: 210px;
        }
        .style5
        {
            width: 196px;
        }
        .style6
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="LinqDataSourceCategories" DataTextField="CategoryName" 
                    DataValueField="CategoryId" Height="22px" Width="195px">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSourceCategories" runat="server" 
                    ContextTypeName="LibraryProject.GenelDataContext" EntityTypeName="" 
                    OrderBy="CategoryName, CategoryId" TableName="tbl_Categories">
                </asp:LinqDataSource>
            </td>
            <td class="style5" style="text-align: center">
                <asp:Button ID="btn_Update" runat="server" onclick="btn_Update_Click" 
                    Text="Edit" />
            </td>
            <td style="text-align: center">
                <asp:Button ID="btn_delete" runat="server" onclick="btn_delete_Click" 
                    Text="Delete" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style5" style="text-align: center">
                <asp:TextBox ID="TextBoxEdit" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:Button ID="btn_finish" runat="server" onclick="btn_finish_Click" 
                    Text="Finish Editing" Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td colspan="2">
                <asp:Label ID="lbl_intro0" runat="server" ForeColor="Red" 
                    style="text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Please enter the category name that you want to add..</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Category Name:</td>
            <td colspan="2" style="text-align: left">
                <asp:TextBox ID="TextBoxCategoryName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style6" colspan="2">
                <asp:Label ID="lbl_intro" runat="server" ForeColor="Red" 
                    style="text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btn_addCategory" runat="server" onclick="btn_addCategory_Click" 
                    Text="Add Category" />
            </td>
        </tr>
    </table>
</asp:Content>

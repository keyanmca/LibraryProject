<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditBooks.aspx.cs" Inherits="LibraryProject.EditBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Book Title</td>
            <td class="style2">
                :</td>
            <td class="style4">
                <asp:TextBox ID="TextBoxTitle" runat="server"></asp:TextBox>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                Description</td>
            <td class="style6">
                :</td>
            <td colspan="2" rowspan="3">
                <asp:TextBox ID="TextBoxDesc" runat="server" EnableTheming="True" Height="63px" 
                    TextMode="MultiLine" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Category</td>
            <td class="style2">
                :</td>
            <td class="style4">
                <asp:DropDownList ID="ddl_category" runat="server" 
                    DataSourceID="LinqDataSource1" DataTextField="CategoryName" 
                    DataValueField="CategoryId" Height="22px" Width="128px">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                    ContextTypeName="LibraryProject.GenelDataContext" EntityTypeName="" 
                    OrderBy="CategoryName, CategoryId" TableName="tbl_Categories">
                </asp:LinqDataSource>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Author</td>
            <td class="style2">
                :</td>
            <td class="style4">
                <asp:TextBox ID="TextBoxAuthor" runat="server"></asp:TextBox>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                Image</td>
            <td class="style6">
                :</td>
            <td class="style7">
                <asp:FileUpload ID="FileUploadImage" runat="server" Width="212px" />
                <asp:RegularExpressionValidator ID="regexValidator" runat="server" 
                    ControlToValidate="FileUploadImage" 
                    ErrorMessage="Only JPEG and PNG images are allowed" 
                    ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])|.*\.([Pp][Nn][Gg])$)">
</asp:RegularExpressionValidator>
            </td>
            <td rowspan="5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Year</td>
            <td class="style2">
                :</td>
            <td class="style4">
                <asp:TextBox ID="TextBoxYear" runat="server"></asp:TextBox>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Puplisher</td>
            <td class="style2">
                :</td>
            <td class="style4">
                <asp:TextBox ID="TextBoxPublisher" runat="server"></asp:TextBox>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2" colspan="7">
                <asp:Label ID="lbl_intro" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                <asp:Button ID="btn_Update" runat="server" onclick="btn_Update_Click" 
                    Text="Update" />
            </td>
            <td class="style6">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Comp229_Assign04.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br />
        <h2><strong>
            <asp:Label ID="subTitle" runat="server" Text="Suggest updated Models Info"></asp:Label></strong></h2>
        <br />
        <br />
    </div>
    <div style="margin-left: 40%; height:300px; text-align:left;">
        <table>
            <tr>
                <td>Name: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server" type="text"></asp:TextBox></td>
            </tr>
            <tr>
                <td>E-mail: </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" type="email"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <br />
                    <asp:Button ID="btnSendMail" runat="server" OnClick="SendMailButton_Click" CssClass="btn btn-warning" Text="Send Updated Models Info" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblResult" runat="server" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

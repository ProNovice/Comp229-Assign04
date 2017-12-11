<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Comp229_Assign04.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br />
        <h2><strong>Model List</strong></h2>
        <br />
        <br />
    </div>
    <div style="max-width: 800px;">
        <asp:DataList runat="server" ID="ModelList">
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
            <ItemTemplate>
                <table class="table table-bordered" style="width: 100%; font-size: 20px;">
                    <tbody>
                        <tr>
                            <td class="col-md-6">
                                <img style="max-width: 100%" src="<%# Eval("imageUrl") %>" />
                            </td>
                            <td class="col-md-6">
                                <table>
                                    <tr>
                                        <td>Name: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtName" runat="server" type="text" Text='<%# Eval("Name") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblName" Text='<%# Eval("Name") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Faction: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtFaction" runat="server" type="text" Text='<%# Eval("faction")%>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblFaction" Text='<%# Eval("faction")%>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Rank: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtRank" runat="server" type="text" Text='<%# Eval("rank") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblRank" Text='<%# Eval("rank") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Base: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtBase" runat="server" type="text" Text='<%# Eval("_base") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblBase" Text='<%# Eval("_base") %>'></asp:Label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Size: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtSize" runat="server" type="text" Text='<%# Eval("size") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblSize" Text='<%# Eval("size") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Deployment Zone: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtDeploymentZone" runat="server" type="text" Text=' <%# Eval("deploymentZone") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblDeploymentZone" Text=' <%# Eval("deploymentZone") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mobility: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtMobility" runat="server" type="text" Text='<%# Eval("mobility")%>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblMobility" Text='<%# Eval("mobility")%>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Willpower: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtWillpower" runat="server" type="text" Text='<%# Eval("willpower") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblWillpower" Text='<%# Eval("willpower") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Resiliance: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtResiliance" runat="server" type="text" Text='<%# Eval("resiliance") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblResiliance" Text='<%# Eval("resiliance") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Wounds: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtWounds" runat="server" type="text" Text='<%# Eval("wounds") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblWounds" Text='<%# Eval("wounds") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <asp:Button ID="btnEdit" runat="server" OnClick="Edit_Click" class="btn btn-warning" Text="Edit" />
                                <asp:Button ID="btnUpdate" Visible="false" runat="server" OnClick="Update_Click" class="btn btn-warning" Text="Update" />
                                <asp:Button ID="btnViewModel" runat="server" OnClick="ViewModel_Click" class="btn btn-warning" Text="View detail" />
<%--                                <span runat="server" onclick="Update_Click" class="btn btn-warning">Update  </span>
                                <span runat="server" onclick="ViewDetale_Click" class="btn btn-warning">View detail  <span class="glyphicon glyphicon-search"></span></span></a>
                            --%></td>
                        </tr>
                    </tbody>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

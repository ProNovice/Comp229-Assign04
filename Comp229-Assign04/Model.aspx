<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Model.aspx.cs" Inherits="Comp229_Assign04.Model" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">    <div>
        <br />
        <h2><strong>
            <asp:Label ID="subTitle" runat="server" Text="Model Information"></asp:Label></strong></h2>
        <br />
        <br />
    </div>
    <div style="min-width: 900px;">
        <table id="modelTable" runat="server" class="table table-bordered" style="width: 100%; font-size: 20px;">
            <tbody>
                <tr>
                    <td class="col-md-6">
                        <img runat="server" id="imgModel" style="max-width: 100%" />
                        <!-- this img's src is decided by code behind-->
                    </td>
                    <td class="col-md-6">
                        <table>
                            <tr>
                                <td>Name: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtName" runat="server" type="text"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblName"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Faction: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtFaction" runat="server" type="text"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblFaction"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Rank: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtRank" runat="server" type="number"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblRank"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Base: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtBase" runat="server" type="number"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblBase"></asp:Label>

                                </td>
                            </tr>
                            <tr>
                                <td>Size: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtSize" runat="server" type="number"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblSize"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Deployment Zone: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtDeploymentZone" runat="server" type="text"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblDeploymentZone"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Mobility: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtMobility" runat="server" type="number"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblMobility"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Willpower: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtWillpower" runat="server" type="number"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblWillpower"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Resiliance: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtResiliance" runat="server" type="number"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblResiliance"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Wounds: </td>
                                <td>
                                    <asp:TextBox Visible="false" CssClass="form-control" ID="txtWounds" runat="server" type="number"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblWounds"></asp:Label>
                                </td>
                            </tr>

                        </table>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p>Actions: </p>
                        <table style="width: 100%">
                            <thead>
                                <tr>
                                    <td class="col-md-2">Name
                                    </td>
                                    <td class="col-md-2">Type
                                    </td>
                                    <td class="col-md-1">Rating
                                    </td>
                                    <td class="col-md-1">Range
                                    </td>
                                    <td class="col-md-6">Description
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="actionRepeater">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("name") %></td>
                                            <td><%# Eval("type") %></td>
                                            <td><%# Eval("rating") %></td>
                                            <td><%# Eval("range") %></td>
                                            <td><%# Eval("description") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Repeater runat="server" ID="updateActionRepeater" Visible="false">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtActName" Text='<%# Eval("name") %>' CssClass="form-control" runat="server" type="text"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txtActType" Text='<%# Eval("type") %>' CssClass="form-control" runat="server" type="text"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txtActRating" Text='<%# Eval("rating") %>' CssClass="form-control" runat="server" type="text"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txtActRange" Text='<%# Eval("range") %>' CssClass="form-control" runat="server" type="text"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox Columns="50" ID="txtActDescription" Text='<%# Eval("description") %>' CssClass="form-control" runat="server" type="text"></asp:TextBox></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <%--                        <asp:GridView runat="server" ID="grdActions">
                        <Columns>
                            <asp:BoundField DataField="name" HeaderText="Name" InsertVisible="true" ReadOnly="true" SortExpression="name" />
                            <asp:BoundField DataField="type" HeaderText="Type" InsertVisible="false" ReadOnly="false" SortExpression="type" />
                        </Columns>
                            </asp:GridView>--%>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Button ID="btnEdit" runat="server" OnClick="Edit_Click" class="btn" Text="Edit" CssClass="btn btn-warning" />
        <asp:Button ID="btnUpdate" Visible="false" runat="server" OnClick="Update_Click" class="btn" Text="Update" CssClass="btn btn-warning" />
        <asp:Button ID="btnDelete" runat="server" OnClick="Delete_Click" class="btn" Text="Delete" CssClass="btn btn-danger" />
        <a href="Contact.aspx"><span class="btn btn-warning">Send Suggestion</span></a>
    </div>
</asp:Content>

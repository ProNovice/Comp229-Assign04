<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Model.aspx.cs" Inherits="Comp229_Assign04.Model" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
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
                        <!-- this img's src is decided by code behind-->
                        <img runat="server" id="imgModel" style="max-width: 100%" src="temporal" />
                        <div id="divImageUrl" runat="server" visible="false">
                            <p>Image URL:</p>
                            <asp:TextBox ID="txtImageUrl" runat="server"></asp:TextBox>
                        <asp:Button ID="applyImageButton" runat="server" Text="Preview Image" CssClass="btn" OnClick="PreviewImageButton_Click" />
                        </div>
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
                                <td>Traits: </td>
                                <td>
                                    <div id="divTraits" runat="server" Visible="false" >
                                    <asp:TextBox CssClass="form-control" ID="txtTraits" runat="server" type="text"></asp:TextBox>
                                    <h5>Please distinguish traits by ','</h5>
                                        </div>
                                    <asp:Label runat="server" ID="lblTraits"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Types: </td>
                                <td><div id="divTypes" runat="server" Visible="false" >
                                    <asp:TextBox  CssClass="form-control" ID="txtTypes" runat="server" type="text"></asp:TextBox>
                                    <h5>Please distinguish types by ','</h5></div>
                                    <asp:Label runat="server" ID="lblTypes"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>DefenseCharts: </td>
                                <td><div id="divDefenseCharts" runat="server" Visible="false" >
                                    <asp:TextBox CssClass="form-control" ID="txtDefenseChart" runat="server" type="text"></asp:TextBox>
                                    <h5>Please distinguish charts by ','</h5></div>
                                    <asp:Label runat="server" ID="lblDefenseChart"></asp:Label>
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
                                                <asp:TextBox ID="txtActRating" Text='<%# Eval("rating") %>' CssClass="form-control" runat="server" type="number"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txtActRange" Text='<%# Eval("range") %>' CssClass="form-control" runat="server" type="text"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox Columns="80" ID="txtActDesc" Text='<%# Eval("description") %>' CssClass="form-control" runat="server" type="text"></asp:TextBox></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <asp:Button ID="addNewActionRowButton" runat="server" OnClick="AddNewActionRow_Click" CssClass="btn btn-warning" Text="Add a row" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p>Specialability: </p>
                        <table style="width: 100%">
                            <thead>
                                <tr>
                                    <td class="col-md-4">Name
                                    </td>
                                    <td class="col-md-8">Description
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="specialRepeater">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("name") %></td>
                                            <td><%# Eval("description") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Repeater runat="server" ID="updateSpecialRepeater" Visible="false">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtSpecialName" Text='<%# Eval("name") %>' CssClass="form-control" runat="server" type="text"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox Columns="100" ID="txtSpecialDesc" Text='<%# Eval("description") %>' CssClass="form-control" runat="server" type="text"></asp:TextBox></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <asp:Button ID="addNewSpecialRowButton" runat="server" OnClick="AddNewSpecialRow_Click" CssClass="btn btn-warning" Text="Add a row" Visible="false" />
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Button ID="btnEdit" runat="server" OnClick="Edit_Click" class="btn" Text="Edit" CssClass="btn btn-warning" />
        <asp:Button ID="btnUpdate" Visible="false" runat="server" OnClick="Update_Click" class="btn" Text="Update" CssClass="btn btn-warning" />
        <asp:Button ID="btnDelete" runat="server" OnClick="Delete_Click" class="btn" Text="Delete" CssClass="btn btn-danger" />
        <a href="Contact.aspx"><span class="btn btn-warning">Send Updated Models</span></a>
    </div>
</asp:Content>

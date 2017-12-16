<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Comp229_Assign04.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br />
        <h2><strong>
            <asp:Label ID="subTitle" runat="server" Text="Model List"></asp:Label></strong></h2>
        <br />
        <br />
    </div>
    <div style="max-width: 800px;">
        <asp:DataList runat="server" ID="modelList">
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
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtRank" runat="server" type="number" Text='<%# Eval("rank") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblRank" Text='<%# Eval("rank") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Base: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtBase" runat="server" type="number" Text='<%# Eval("_base") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblBase" Text='<%# Eval("_base") %>'></asp:Label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Size: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtSize" runat="server" type="number" Text='<%# Eval("size") %>'></asp:TextBox>
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
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtMobility" runat="server" type="number" Text='<%# Eval("mobility")%>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblMobility" Text='<%# Eval("mobility")%>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Willpower: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtWillpower" runat="server" type="number" Text='<%# Eval("willpower") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblWillpower" Text='<%# Eval("willpower") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Resiliance: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtResiliance" runat="server" type="number" Text='<%# Eval("resiliance") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblResiliance" Text='<%# Eval("resiliance") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Wounds: </td>
                                        <td>
                                            <asp:TextBox Visible="false" CssClass="form-control" ID="txtWounds" runat="server" type="number" Text='<%# Eval("wounds") %>'></asp:TextBox>
                                            <asp:Label runat="server" ID="lblWounds" Text='<%# Eval("wounds") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p>Actions: </p>
                                <asp:GridView runat="server" ID="grdActions" DataSource='<%# Eval("actions") %>'>
                                </asp:GridView>

                            </td>
                        </tr>
                    </tbody>
                </table>
                <asp:Button ID="btnUpdate" runat="server" OnClick="Update_Click" CssClass="btn btn-warning" Text="Update" />
                <asp:Button ID="btnViewModel" runat="server" OnClick="ViewModel_Click" CssClass="btn btn-warning" Text="View detail" />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:Button ID="btnShowAdditionForm" runat="server" OnClick="SwitchAdditionForm_Click" CssClass="btn btn-warning" Text="Add new Model" />
        <!-- A textbox and a button for adding a new student -->
        <div id="additionForm" runat="server" visible="false">
            <table id="modelTable" runat="server" class="table table-bordered" style="width: 100%; font-size: 20px;">
                <tbody>
                    <tr>
                        <td class="col-md-6">
                            <p>Image url: </p>
                            <asp:TextBox CssClass="form-control" ID="txtImageUrl" runat="server" type="text"></asp:TextBox>
                        </td>
                        <td class="col-md-6">
                            <table>
                                <tr>
                                    <td>Name: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtName" runat="server" type="text"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Faction: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtFaction" runat="server" type="text"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtFaction" ErrorMessage="Faction is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Rank: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtRank" runat="server" type="number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtRank" ErrorMessage="Rank is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Base: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtBase" runat="server" type="number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtBase" ErrorMessage="Base is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Size: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtSize" runat="server" type="number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtSize" ErrorMessage="Size is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Deployment Zone: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtDeploymentZone" runat="server" type="text"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtDeploymentZone" ErrorMessage="DeploymentZone is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mobility: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtMobility" runat="server" type="number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtMobility" ErrorMessage="Mobility is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Willpower: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtWillpower" runat="server" type="number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtWillpower" ErrorMessage="Willpower is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Resiliance: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtResiliance" runat="server" type="number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtResiliance" ErrorMessage="Resiliance is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Wounds: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="txtWounds" runat="server" type="number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtWounds" ErrorMessage="Wounds is required" ForeColor="Red"></asp:RequiredFieldValidator>
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
                        </td>
                    </tr>
                </tbody>
            </table>
            <asp:Button ID="btnAddModel" runat="server" ValidationGroup="newModel" OnClick="AddModel_Click" CssClass="btn btn-warning" Text="Add new Model" />
            <a href="Contact.aspx"><span class="btn btn-warning">Send Suggestion</span></a>
        </div>
    </div>
</asp:Content>

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
                                            <asp:Label runat="server" ID="lblName" Text='<%# Eval("Name") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Faction: </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblFaction" Text='<%# Eval("faction")%>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Rank: </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblRank" Text='<%# Eval("rank") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Base: </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblBase" Text='<%# Eval("_base") %>'></asp:Label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Size: </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblSize" Text='<%# Eval("size") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Deployment Zone: </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblDeploymentZone" Text=' <%# Eval("deploymentZone") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mobility: </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblMobility" Text='<%# Eval("mobility")%>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Willpower: </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblWillpower" Text='<%# Eval("willpower") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Resiliance: </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblResiliance" Text='<%# Eval("resiliance") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Wounds: </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblWounds" Text='<%# Eval("wounds") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <asp:Button ID="btnUpdate" runat="server" OnClick="Update_Click" CssClass="btn btn-warning" Text="Update" />
                <asp:Button ID="btnViewModel" runat="server" OnClick="ViewModel_Click" CssClass="btn btn-warning" Text="View detail" />
                <br />
            </ItemTemplate>
        </asp:DataList>
    </div>
    <asp:Button ID="btnShowAdditionForm" runat="server" OnClick="SwitchAdditionForm_Click" CssClass="btn btn-warning" Text="Add new Model" />
    <!-- A textbox and a button for adding a new student -->
    <div id="additionForm" runat="server" visible="false">
        <table id="modelTable" runat="server" class="table table-bordered" style="width: 100%; font-size: 20px;">
            <tbody>
                <tr>
                    <td class="col-md-6">
                        <img id="modelImage" runat="server" style="max-width: 100%;" src="temporal" />
                        <p>Image url: </p>
                        <asp:TextBox CssClass="form-control" ID="txtImageUrl" runat="server" type="text"></asp:TextBox>
                        <asp:Button ID="applyImageButton" runat="server" Text="Preview Image" CssClass="btn" OnClick="PreviewImageButton_Click" />
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
                                <td>Traits: </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="txtTraits" runat="server" type="text"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtTraits" ErrorMessage="Trait is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <h5>Please distinguish by ','</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>Types: </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="txtTypes" runat="server" type="text"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtTypes" ErrorMessage="Type is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <h5>Please distinguish by ','</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>DefenseCharts: </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="txtDefenseChart" runat="server" type="text"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="newModel" runat="server" ControlToValidate="txtDefenseChart" ErrorMessage="Defense is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <h5>Please distinguish by ','</h5>
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
                                <asp:Repeater runat="server" ID="newActionRepeater">
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
                        <asp:Button ID="addNewActionRowButton" runat="server" OnClick="AddNewActionRow_Click" CssClass="btn btn-warning" Text="Add a row" />
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
                                <asp:Repeater runat="server" ID="newSpecialRepeater">
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
                        <asp:Button ID="addNewSpecialRowButton" runat="server" OnClick="AddNewSpecialRow_Click" CssClass="btn btn-warning" Text="Add a row" />
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Button ID="btnAddModel" runat="server" ValidationGroup="newModel" OnClick="AddModel_Click" CssClass="btn btn-warning" Text="Add new Model" />
        <a href="Contact.aspx"><span class="btn btn-warning">Send Updated Models</span></a>
    </div>
</asp:Content>

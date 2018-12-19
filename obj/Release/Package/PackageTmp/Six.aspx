<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="Six.aspx.cs" Inherits="Rcc5yrProgRev.Six" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navigation" runat="server">

    <div id="rccNav" class="row">
        <div class="navbar navbar-default navbar-static-top">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Program Review Forms:</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="One.aspx">One</a></li>
                    <li><a href="Two.aspx">Two</a></li>
                    <li><a href="Three.aspx">Three</a></li>
                    <li><a href="Four.aspx">Four</a></li>
                    <li><a href="Five.aspx">Five</a></li>
                    <li class="active"><a href="Six.aspx">Six</a></li>
                    <li><a href="Seven.aspx">Seven</a></li>
                    <li><a href="Eight.aspx">Eight</a></li>
                    <li><a href="Nine.aspx">Nine</a></li>
                    <li>
                        <asp:HyperLink ID="HyperLinkImport" runat="server" NavigateUrl="~/import.aspx" Visible="False">Import</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <div id="rccContent" class="container">

        <div id="rccSubNav" class="container col-sm-2">

            <asp:DataPager ID="rccPlanNav" runat="server" PagedControlID="rccPlanView" PageSize="1">
                <Fields>
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="col-sm-12 disabled btn btn-pager btn-primary" NumericButtonCssClass="col-sm-12 btn btn-pager btn-primary" ButtonCount="10" NextPageText="" PreviousPageText="" RenderNonBreakingSpacesBetweenControls="false" />
                </Fields>
            </asp:DataPager>
            <a href="#planAddModal" role="button" class="btn btn-success" data-toggle="modal">Add</a>


        </div>

        <div id="rccFocus" class="container col-sm-10">
            <fieldset>

                <!-- Form Name -->
                <legend>Reflection & Action Plans</legend>
                <div class="col-sm-12">
                    <asp:Label ID="LabelAttachError" runat="server"></asp:Label>
                </div>
                <asp:ListView ID="rccPlanView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourcePlan" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Plan -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Plan
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:DropDownList ID="EditPlan" CssClass="form-control"
                                    DataSourceID="SqlDataSourcePlanDDL"
                                    DataTextField="Plan"
                                    DataValueField="Plan"
                                    SelectedValue='<%# Bind("Plan") %>'
                                    AppendDataBoundItems="True"
                                    runat="server">
                                </asp:DropDownList>
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Change"
                                data-content="Please describe what the specific changes are that you have identified."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Plan -->

                        <!-- Begin Change -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Change
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ChangeTextBox" runat="server" Text='<%# Bind("Change") %>' />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Change"
                                data-content="Please describe what the specific changes are that you have identified."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Change -->

                        <!-- Begin Links -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Links
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="LinksTextBox" runat="server" Text='<%# Bind("Links") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Links"
                                data-content="Please put a link to the items you are wanting to purchase."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Links -->

                        <!-- Begin IsCost -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Associated costs?
                            </label>
                            <div class="input-group col-sm-4">
                                <div class="checkbox">
                                    <asp:CheckBox ID="IsCostCheckBox" runat="server" Checked='<%# Bind("IsCost") %>' Text="Yes" />
                                </div>
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End IsCost -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-1 control-label"></label>
                                <asp:Button CssClass="btn btn-warning" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button CssClass="btn btn-success" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div>
                        <!-- End Buttons -->

                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>

                        <!-- Begin Insert Modal -->
                        <div id="planAddModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h3 id="myModalLabel">Add Plan</h3>
                                    </div>
                                    <div class="modal-body">

                                        <!-- Begin Plan -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Plan
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:DropDownList ID="EditPlan" CssClass="form-control"
                                                    DataSourceID="SqlDataSourcePlanDDL"
                                                    DataTextField="Plan"
                                                    DataValueField="Plan"
                                                    SelectedValue='<%# Bind("Plan") %>'
                                                    AppendDataBoundItems="True"
                                                    runat="server">
                                                </asp:DropDownList>
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Change"
                                                data-content="Please describe what the specific changes are that you have identified."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Plan -->

                                        <!-- Begin Change -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Change
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="ChangeTextBox" runat="server" Text='<%# Bind("Change") %>' />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Change"
                                                data-content="Please describe what the specific changes are that you have identified."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Change -->

                                        <!-- Begin Links -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Links
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="LinksTextBox" runat="server" Text='<%# Bind("Links") %>' TextMode="MultiLine" />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Links"
                                                data-content="Please put a link to the items you are wanting to purchase."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Links -->

                                        <!-- Begin IsCost -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Associated costs?
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <div class="checkbox">
                                                    <asp:CheckBox ID="IsCostCheckBox" runat="server" Checked='<%# Bind("IsCost") %>' Text="Yes" />
                                                </div>
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End IsCost -->

                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-10">
                                                <label class="col-sm-1 control-label"></label>
                                                <asp:Button CssClass="btn btn-warning" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                <button type="button" class="btn btn-warning" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                            </div>
                                        </div>
                                        <!-- End Buttons -->

                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Insert Modal -->

                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin Plan -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Plan
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:DropDownList ID="EditPlan" CssClass="form-control"
                                    DataSourceID="SqlDataSourcePlanDDL"
                                    DataTextField="Plan"
                                    DataValueField="Plan"
                                    SelectedValue='<%# Bind("Plan") %>'
                                    AppendDataBoundItems="True"
                                    runat="server" Enabled="False">
                                </asp:DropDownList>
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Change"
                                data-content="Please describe what the specific changes are that you have identified."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Plan -->

                        <!-- Begin Change -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Change
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ChangeTextBox" runat="server" Text='<%# Bind("Change") %>' Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Change"
                                data-content="Please describe what the specific changes are that you have identified."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Change -->

                        <!-- Begin Links -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Links
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="LinksTextBox" runat="server" Text='<%# Bind("Links") %>' Enabled="False" TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Links"
                                data-content="Please put a link to the items you are wanting to purchase."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Links -->

                        <!-- Begin IsCost -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Associated costs?
                            </label>
                            <div class="input-group col-sm-4">
                                <div class="checkbox">
                                    <asp:CheckBox ID="IsCostCheckBox" runat="server" Checked='<%# Bind("IsCost") %>' Text="Yes" Enabled="False" />
                                </div>
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End IsCost -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-1 control-label"></label>

                                <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" CommandName="Edit" Text="Edit" />

                                <!-- Begin Delete Button -->
                                <a href="#empDeleteModal" role="button" class="btn btn-danger" data-toggle="modal">Delete</a>

                                <div id="empDeleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3 id="myModalLabel">Are you sure?</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>This action cannot be recovered!!!</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                <asp:Button CssClass="btn btn-danger" ID="Button2" runat="server" CommandName="Delete" Text="Delete" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Delete Button -->

                            </div>
                        </div>
                        <!-- End Buttons -->

                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server"></div>
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourcePlan" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Planning] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Planning] ([ProgramID], [ReviewYear], [Plan], [Change], [Links], [IsCost]) VALUES (@ProgramID, @ReviewYear, @Plan, @Change, @Links, @IsCost)" SelectCommand="SELECT [Id], [Plan], [Change], [Links], [IsCost] FROM [Planning] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Planning] SET [Plan] = @Plan, [Change] = @Change, [Links] = @Links, [IsCost] = @IsCost WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgId" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                        <asp:Parameter Name="Plan" Type="String" />
                        <asp:Parameter Name="Change" Type="String" />
                        <asp:Parameter Name="Links" Type="String" />
                        <asp:Parameter Name="IsCost" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgId" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Plan" Type="String" />
                        <asp:Parameter Name="Change" Type="String" />
                        <asp:Parameter Name="Links" Type="String" />
                        <asp:Parameter Name="IsCost" Type="Boolean" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcePlanDDL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Planning] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Planning] ([ProgramID], [ReviewYear], [Plan], [Change], [Links], [IsCost]) VALUES (@ProgramID, @ReviewYear, @Plan, @Change, @Links, @IsCost)" SelectCommand="SELECT DISTINCT [Plan] FROM Planning WHERE ([Plan] IS NOT NULL)" UpdateCommand="UPDATE [Planning] SET [Plan] = @Plan, [Change] = @Change, [Links] = @Links, [IsCost] = @IsCost WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                        <asp:Parameter Name="Plan" Type="String" />
                        <asp:Parameter Name="Change" Type="String" />
                        <asp:Parameter Name="Links" Type="String" />
                        <asp:Parameter Name="IsCost" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Plan" Type="String" />
                        <asp:Parameter Name="Change" Type="String" />
                        <asp:Parameter Name="Links" Type="String" />
                        <asp:Parameter Name="IsCost" Type="Boolean" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:ListView ID="rccStrengthView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceStrength" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Strengths -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Strengths
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="StrengthsTextBox" runat="server" Text='<%# Bind("Strengths") %>' />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Strengths"
                                data-content="Strengths of your program."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Strengths -->

                        <!-- Begin Opportunities -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Opportunities
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="OpportunitiesTextBox" runat="server" Text='<%# Bind("Opportunities") %>' />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Opportunities"
                                data-content="Areas for improvement these new plans will assist."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Opportunities -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-1 control-label"></label>
                                <asp:Button CssClass="btn btn-warning" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button CssClass="btn btn-success" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div>
                        <!-- End Buttons -->

                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <div>No data was returned.</div>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin Strengths -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Strengths
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="StrengthsTextBox" runat="server" Text='<%# Bind("Strengths") %>' Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Strengths"
                                data-content="Strengths of your program."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Strengths -->

                        <!-- Begin Opportunities -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Opportunities
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="OpportunitiesTextBox" runat="server" Text='<%# Bind("Opportunities") %>' Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Opportunities"
                                data-content="Areas for improvement these new plans will assist."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Opportunities -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-1 control-label"></label>
                                <asp:Button CssClass="btn btn-warning" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </div>
                        </div>
                        <!-- End Buttons -->

                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </table>
                        <div style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourceStrength" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Reflection] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Reflection] ([Strengths], [Opportunities]) VALUES (@Strengths, @Opportunities)" SelectCommand="SELECT [Id], [Strengths], [Opportunities] FROM [Reflection] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Reflection] SET [Strengths] = @Strengths, [Opportunities] = @Opportunities WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Strengths" Type="String" />
                        <asp:Parameter Name="Opportunities" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgId" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Strengths" Type="String" />
                        <asp:Parameter Name="Opportunities" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <!-- More Buttons -->
                <div class="container">
                    <div class="form-group row col-sm-7">
                        <label class="col-sm-3 control-label" for="moreButton">More</label>
                        <div>
                            <a href="#fileUploadModal" role="button" class="btn btn-primary" data-toggle="modal">Attachments</a>
                        </div>
                    </div>
                </div>

                <!-- Begin File Upload -->
                <div id="fileUploadModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Attachments</h3>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="uploads">Attach File:</label>
                                    <div class="col-sm-8">
                                        <asp:FileUpload ID="rccUploadForm" runat="server" />
                                        <asp:Button ID="rccUploadButton" runat="server" OnClick="rccUploadButton_Click" Text="Upload" />
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="col-sm-12">
                                            <p>Documents</p>
                                        </div>
                                        <div class="col-sm-12" style="padding-bottom: 1em;">
                                            <asp:DropDownList ID="DropDownListDocs" runat="server" AppendDataBoundItems="True" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:Button ID="ButtonViewDoc" runat="server" Text="View" OnClick="ButtonViewDoc_Click" CssClass="btn btn-info" Auto />
                                            <a href="#confirmDelete" class="btn btn-warning" data-toggle="collapse">Delete</a>
                                        </div>
                                        <div id="confirmDelete" class="col-sm-8 collapse">
                                            <a href="#confirmDelete" class="btn btn-success" data-toggle="collapse">Cancel Delete</a>
                                            <asp:Button ID="ButtonDelConfirm" runat="server" Text="Confirm Delete" OnClick="ButtonDelConfirm_Click" CssClass="btn btn-danger" />
                                        </div>
                                    </div>

                                </div>
                                <div class="container"></div>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End File Upload -->

            </fieldset>
        </div>
    </div>


</asp:Content>

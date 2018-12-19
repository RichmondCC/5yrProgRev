<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="Two.aspx.cs" Inherits="Rcc5yrProgRev.Two" %>

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
                    <li class="active"><a href="Two.aspx">Two</a></li>
                    <li><a href="Three.aspx">Three</a></li>
                    <li><a href="Four.aspx">Four</a></li>
                    <li><a href="Five.aspx">Five</a></li>
                    <li><a href="Six.aspx">Six</a></li>
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
            <asp:DataPager ID="rccObjNav" runat="server" PagedControlID="rccObjView" PageSize="1">
                <Fields>
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="col-sm-12 disabled btn btn-pager btn-primary" NumericButtonCssClass="col-sm-12 btn-pager btn btn-primary" ButtonCount="10" NextPageText="" PreviousPageText="" RenderNonBreakingSpacesBetweenControls="false" />
                </Fields>
            </asp:DataPager>
            <asp:SqlDataSource ID="rccDescData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Programs] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Programs] ([CatalogDescription], [CatalogCorrections]) VALUES (@CatalogDescription, @CatalogCorrections)" SelectCommand="SELECT [Id], [CatalogDescription], [CatalogCorrections] FROM [Programs] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Programs] SET [CatalogDescription] = @CatalogDescription, [CatalogCorrections] = @CatalogCorrections WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CatalogDescription" Type="Boolean" />
                    <asp:Parameter Name="CatalogCorrections" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                    <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CatalogDescription" Type="Boolean" />
                    <asp:Parameter Name="CatalogCorrections" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <a href="#objAddModal" role="button" class="btn btn-success" data-toggle="modal">Add</a>

        </div>

        <div id="rccFocus" class="container col-sm-10">
            <fieldset>

                <!-- Form Name -->
                <legend>Program Matrix &amp; Description</legend>
                <div class="col-sm-12">
                    <asp:Label ID="LabelAttachError" runat="server"></asp:Label>
                </div>
                <asp:SqlDataSource ID="rccObjData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ObjectivesOutcomes] WHERE [Id] = @Id" InsertCommand="INSERT INTO [ObjectivesOutcomes] ([ProgramId], [ReviewYear], [ObjectiveOutcome], [RelationshipToMission], [Introduced], [Reinforced], [Emphasized], [Assessed]) VALUES (@ProgramId, @ReviewYear, @ObjectiveOutcome, @RelationshipToMission, @Introduced, @Reinforced, @Emphasized, @Assessed)" SelectCommand="SELECT [Id], [ObjectiveOutcome], [RelationshipToMission], [Introduced], [Reinforced], [Emphasized], [Assessed] FROM [ObjectivesOutcomes] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [ObjectivesOutcomes] SET [ObjectiveOutcome] = @ObjectiveOutcome, [RelationshipToMission] = @RelationshipToMission, [Introduced] = @Introduced, [Reinforced] = @Reinforced, [Emphasized] = @Emphasized, [Assessed] = @Assessed WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ObjectiveOutcome" Type="String" />
                        <asp:Parameter Name="RelationshipToMission" Type="String" />
                        <asp:Parameter Name="Introduced" Type="String" />
                        <asp:Parameter Name="Reinforced" Type="String" />
                        <asp:Parameter Name="Emphasized" Type="String" />
                        <asp:Parameter Name="Assessed" Type="String" />
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ObjectiveOutcome" Type="String" />
                        <asp:Parameter Name="RelationshipToMission" Type="String" />
                        <asp:Parameter Name="Introduced" Type="String" />
                        <asp:Parameter Name="Reinforced" Type="String" />
                        <asp:Parameter Name="Emphasized" Type="String" />
                        <asp:Parameter Name="Assessed" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="rccObjView" runat="server" DataSourceID="rccObjData" DataKeyNames="Id" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>

                        <!-- Begin Objective -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Objective / Outcome
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="ObjectiveOutcomeTextBox" runat="server"
                                    Text='<%# Bind("ObjectiveOutcome") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Objective/Outcome"
                                data-content="If you are an AAS program, what are the Program Learning Outcomes you would measure every graduate of your program. If you are an AA/AS/AE program these may be your student learning outcomes for your program and general education."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Objective -->


                        <!-- Begin RelToMission -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Relationship to Mission
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="RelationshipToMissionTextBox" runat="server"
                                    Text='<%# Bind("RelationshipToMission") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End RelToMission -->


                        <!-- Begin Introduced -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Introduced
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="IntroducedTextBox" runat="server"
                                    Text='<%# Bind("Introduced") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Matrix"
                                data-content="Please identify the sequence of courses for each program learning objective is introduced, emphasized, reinforced, and then assessed in your program of study. The assessment measures should be part of the program’s SPOL assessment."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Introduced -->


                        <!-- Begin Reinforced -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Reinforced
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ReinforcedTextBox" runat="server"
                                    Text='<%# Bind("Reinforced") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Reinforced -->


                        <!-- Begin Emphasized -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Emphasized
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EmphasizedTextBox" runat="server"
                                    Text='<%# Bind("Emphasized") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Emphasized -->

                        <!-- Begin Assessed -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Assessed
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="AssessedTextBox" runat="server"
                                    Text='<%# Bind("Assessed") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Assessed -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">
                                </label>
                                <asp:Button CssClass="btn btn-warning" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />

                                <!-- Begin Delete Button -->
                                <a href="#facDeleteModal" role="button" class="btn btn-danger" data-toggle="modal">Delete</a>
                                <div id="facDeleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                                <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Delete Button -->

                            </div>
                        </div>
                        <!-- End Buttons -->

                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Objective -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Objective / Outcome
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="ObjectiveOutcomeTextBox" runat="server"
                                    Text='<%# Bind("ObjectiveOutcome") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Objective/Outcome"
                                data-content="If you are an AAS program, what are the Program Learning Outcomes you would measure every graduate of your program. If you are an AA/AS/AE program these may be your student learning outcomes for your program and general education."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Objective -->


                        <!-- Begin RelToMission -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Relationship to Mission
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="RelationshipToMissionTextBox" runat="server" Text='<%# Bind("RelationshipToMission") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End RelToMission -->


                        <!-- Begin Introduced -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Introduced
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="IntroducedTextBox" runat="server"
                                    Text='<%# Bind("Introduced") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Matrix"
                                data-content="Please identify the sequence of courses for each program learning objective is introduced, emphasized, reinforced, and then assessed in your program of study. The assessment measures should be part of the program’s SPOL assessment."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Introduced -->


                        <!-- Begin Reinforced -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Reinforced
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ReinforcedTextBox" runat="server"
                                    Text='<%# Bind("Reinforced") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Reinforced -->


                        <!-- Begin Emphasized -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Emphasized
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EmphasizedTextBox" runat="server"
                                    Text='<%# Bind("Emphasized") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Emphasized -->

                        <!-- Begin Assessed -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Assessed
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="AssessedTextBox" runat="server"
                                    Text='<%# Bind("Assessed") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Assessed -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-12">
                                <label class="col-sm-2 control-label"></label>
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
                        <div id="objAddModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h3 id="myModalLabel">Add Objectives/Outcomes</h3>
                                    </div>
                                    <div class="modal-body">

                                        <!-- Begin Objective -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Objective / Outcome
                                            </label>
                                            <div class="checkbox input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="ObjectiveOutcomeTextBox" runat="server"
                                                    Text='<%# Bind("ObjectiveOutcome") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Objective/Outcome"
                                                data-content="If you are an AAS program, what are the Program Learning Outcomes you would measure every graduate of your program. If you are an AA/AS/AE program these may be your student learning outcomes for your program and general education."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Objective -->


                                        <!-- Begin RelToMission -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Relationship to Mission
                                            </label>
                                            <div class="checkbox input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="RelationshipToMissionTextBox" runat="server" Text='<%# Bind("RelationshipToMission") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End RelToMission -->


                                        <!-- Begin Introduced -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Introduced
                                            </label>
                                            <div class="checkbox input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="IntroducedTextBox" runat="server"
                                                    Text='<%# Bind("Introduced") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Matrix"
                                                data-content="Please identify the sequence of courses for each program learning objective is introduced, emphasized, reinforced, and then assessed in your program of study. The assessment measures should be part of the program’s SPOL assessment."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Introduced -->


                                        <!-- Begin Reinforced -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Reinforced
                                            </label>
                                            <div class="checkbox input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="ReinforcedTextBox" runat="server"
                                                    Text='<%# Bind("Reinforced") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Reinforced -->


                                        <!-- Begin Emphasized -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Emphasized
                                            </label>
                                            <div class="checkbox input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="EmphasizedTextBox" runat="server"
                                                    Text='<%# Bind("Emphasized") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Emphasized -->

                                        <!-- Begin Assessed -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Assessed
                                            </label>
                                            <div class="checkbox input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="AssessedTextBox" runat="server"
                                                    Text='<%# Bind("Assessed") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Assessed -->


                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-8">
                                                <label class="col-sm-4 control-label"></label>
                                                <asp:Button CssClass="btn btn-success" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
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

                        <!-- Begin Objective -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Objective / Outcome
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="ObjectiveOutcomeTextBox" runat="server"
                                    Text='<%# Bind("ObjectiveOutcome") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Objective/Outcome"
                                data-content="If you are an AAS program, what are the Program Learning Outcomes you would measure every graduate of your program. If you are an AA/AS/AE program these may be your student learning outcomes for your program and general education."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Objective -->


                        <!-- Begin RelToMission -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Relationship to Mission
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="RelationshipToMissionTextBox" runat="server"
                                    Text='<%# Bind("RelationshipToMission") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End RelToMission -->


                        <!-- Begin Introduced -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Introduced
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox ID="IntroducedTextBox" runat="server"
                                    Text='<%# Bind("Introduced") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Matrix"
                                data-content="Please identify the sequence of courses for each program learning objective is introduced, emphasized, reinforced, and then assessed in your program of study. The assessment measures should be part of the program’s SPOL assessment."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Introduced -->


                        <!-- Begin Reinforced -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Reinforced
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ReinforcedTextBox" runat="server"
                                    Text='<%# Bind("Reinforced") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Reinforced -->


                        <!-- Begin Emphasized -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Emphasized
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EmphasizedTextBox" runat="server"
                                    Text='<%# Bind("Emphasized") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Emphasized -->

                        <!-- Begin Assessed -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Assessed
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="AssessedTextBox" runat="server"
                                    Text='<%# Bind("Assessed") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Assessed -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">
                                </label>
                                <asp:Button CssClass="btn btn-warning" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />

                                <!-- Begin Delete Button -->
                                <a href="#facDeleteModal" role="button" class="btn btn-danger" data-toggle="modal">Delete</a>
                                <div id="facDeleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                                <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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

                        <!-- Begin Objective -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Objective / Outcome
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="ObjectiveOutcomeTextBox" runat="server"
                                    Text='<%# Bind("ObjectiveOutcome") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Objective/Outcome"
                                data-content="If you are an AAS program, what are the Program Learning Outcomes you would measure every graduate of your program. If you are an AA/AS/AE program these may be your student learning outcomes for your program and general education."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Objective -->


                        <!-- Begin RelToMission -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Relationship to Mission
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="RelationshipToMissionTextBox" runat="server"
                                    Text='<%# Bind("RelationshipToMission") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End RelToMission -->


                        <!-- Begin Introduced -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Introduced
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox ID="IntroducedTextBox" runat="server"
                                    Text='<%# Bind("Introduced") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Matrix"
                                data-content="Please identify the sequence of courses for each program learning objective is introduced, emphasized, reinforced, and then assessed in your program of study. The assessment measures should be part of the program’s SPOL assessment."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Introduced -->


                        <!-- Begin Reinforced -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Reinforced
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ReinforcedTextBox" runat="server"
                                    Text='<%# Bind("Reinforced") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Reinforced -->


                        <!-- Begin Emphasized -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Emphasized
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EmphasizedTextBox" runat="server"
                                    Text='<%# Bind("Emphasized") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Emphasized -->

                        <!-- Begin Assessed -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Assessed
                            </label>
                            <div class="checkbox input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="AssessedTextBox" runat="server"
                                    Text='<%# Bind("Assessed") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Assessed -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">
                                </label>
                                <asp:Button CssClass="btn btn-warning" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />

                                <!-- Begin Delete Button -->
                                <a href="#facDeleteModal" role="button" class="btn btn-danger" data-toggle="modal">Delete</a>
                                <div id="facDeleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                                <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Delete Button -->

                            </div>
                        </div>
                        <!-- End Buttons -->

                    </SelectedItemTemplate>
                </asp:ListView>
                <!-- More Buttons -->
                <div class="container">
                    <div class="form-group row col-sm-10">
                        <label class="col-sm-2 control-label" for="moreButton">More</label>
                        <a href="#catalogEditModal" role="button" class="btn btn-primary" data-toggle="modal">Catalog Description</a>
                        <a href="#fileUploadModal" role="button" class="btn btn-primary" data-toggle="modal">Attachments</a>
                    </div>
                </div>

                <!-- Begin Edit Catalog -->
                <div id="catalogEditModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Catalog Description</h3>
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Catalog Description"
                                    data-content="Please verify that the description in the course catalog for the program you are reviewing is accurate. If not, please identify the corrections below in the 'Corrections' box."><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <div class="modal-body">
                                <asp:ListView ID="rccDescView" runat="server" DataKeyNames="Id" DataSourceID="rccDescData">
                                    <AlternatingItemTemplate>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <table style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                            <tr>
                                                <td>No data was returned.</td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                    </InsertItemTemplate>
                                    <ItemTemplate>

                                        <!-- Begin CatalogDescription -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                                Description
                                            </label>
                                            <div class="checkbox input-group col-sm-4">
                                                <div class="checkbox">
                                                    <asp:CheckBox ID="CatalogDescriptionCheckBox" runat="server" Checked='<%# Bind("CatalogDescription") %>'
                                                        Text="Incorrect" />
                                                </div>
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End CatalogDescription -->


                                        <!-- Begin CatalogCorrections -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                                Corrections
                                            </label>
                                            <div class="checkbox input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="CatalogCorrectionsTextBox" runat="server"
                                                    Text='<%# Bind("CatalogCorrections") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End CatalogCorrections -->

                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label class="col-sm-2 control-label"></label>
                                                <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" CommandName="Update" Text="Update" />
                                                <button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">Cancel</button>
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
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Edit Catalog -->

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

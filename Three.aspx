<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="Three.aspx.cs" Inherits="Rcc5yrProgRev.Three" %>

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
                    <li class="active"><a href="Three.aspx">Three</a></li>
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
            <asp:DataPager ID="rccLearnNav" runat="server" PagedControlID="rccLearnView" PageSize="1">
                <Fields>
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="col-sm-12 disabled btn btn-pager btn-primary" NumericButtonCssClass="col-sm-12 btn btn-pager btn-primary" ButtonCount="10" NextPageText="" PreviousPageText="" RenderNonBreakingSpacesBetweenControls="false" />
                </Fields>
            </asp:DataPager>


        </div>

        <div id="rccFocus" class="container col-sm-10">
            <fieldset>

                <!-- Form Name -->
                <legend>Student Learning &amp; Curriculum</legend>
                <div class="col-sm-12">
                    <asp:Label ID="LabelAttachError" runat="server"></asp:Label>
                </div>
                <asp:SqlDataSource ID="rccLearnlData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ObjectivesOutcomes] WHERE [Id] = @Id" InsertCommand="INSERT INTO [ObjectivesOutcomes] ([Assessed], [Year1], [Year2], [Year3], [Year4], [Year5]) VALUES (@Assessed, @Year1, @Year2, @Year3, @Year4, @Year5)" SelectCommand="SELECT [Id], [Assessed], [Year1], [Year2], [Year3], [Year4], [Year5] FROM [ObjectivesOutcomes] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [ObjectivesOutcomes] SET [Assessed] = @Assessed, [Year1] = @Year1, [Year2] = @Year2, [Year3] = @Year3, [Year4] = @Year4, [Year5] = @Year5 WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Assessed" Type="String" />
                        <asp:Parameter Name="Year1" Type="String" />
                        <asp:Parameter Name="Year2" Type="String" />
                        <asp:Parameter Name="Year3" Type="String" />
                        <asp:Parameter Name="Year4" Type="String" />
                        <asp:Parameter Name="Year5" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Assessed" Type="String" />
                        <asp:Parameter Name="Year1" Type="String" />
                        <asp:Parameter Name="Year2" Type="String" />
                        <asp:Parameter Name="Year3" Type="String" />
                        <asp:Parameter Name="Year4" Type="String" />
                        <asp:Parameter Name="Year5" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="rccLearnView" runat="server" DataKeyNames="Id" DataSourceID="rccLearnlData">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Course -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Course(s)
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="AssessedTextBox" runat="server" Text='<%# Bind("Assessed") %>' Enabled="false" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Course(s)"
                                data-content="The course numbers identified as the assessment of the program learning outcome will show here."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Course -->

                        <!-- Begin Year1 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Performance Measures
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year1TextBox" runat="server" Text='<%# Bind("Year1") %>' />
                                <span class="input-group-addon"><%: Session["SessYr1"] %></span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Performance Measures"
                                data-content="For each of the last five years, please document the actual assessment results for the assessed course."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year1 -->

                        <!-- Begin Year2 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year2TextBox" runat="server" Text='<%# Bind("Year2") %>' />
                                <span class="input-group-addon"><%: Session["SessYr2"] %></span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year2 -->

                        <!-- Begin Year3 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year3TextBox" runat="server" Text='<%# Bind("Year3") %>' />
                                <span class="input-group-addon"><%: Session["SessYr3"] %></span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year3 -->

                        <!-- Begin Year4 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year4TextBox" runat="server" Text='<%# Bind("Year4") %>' />
                                <span class="input-group-addon"><%: Session["SessYr4"] %></span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year4 -->

                        <!-- Begin Year5 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year5TextBox" runat="server"
                                    Text='<%# Bind("Year5") %>' />
                                <span class="input-group-addon"><%: Session["SessYr5"] %></span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year5 -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">
                                </label>
                                <asp:Button CssClass="btn btn-warning" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button CssClass="btn btn-success" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div>
                        <!-- End Buttons -->

                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        No data was returned.
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin Course -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Course(s)
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="AssessedTextBox" runat="server" Text='<%# Bind("Assessed") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Course(s)"
                                data-content="The course numbers identified as the assessment of the program learning outcome will show here."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Course -->

                        <!-- Begin Year1 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Performance Measures
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year1TextBox" runat="server" Text='<%# Bind("Year1") %>' Enabled="False" />
                                <span class="input-group-addon"><%: Session["SessYr1"] %></span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Performance Measures"
                                data-content="For each of the last five years, please document the actual assessment results for the assessed course."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year1 -->

                        <!-- Begin Year2 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year2TextBox" runat="server" Text='<%# Bind("Year2") %>' Enabled="False" />
                                <span class="input-group-addon"><%: Session["SessYr2"] %></span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year2 -->

                        <!-- Begin Year3 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year3TextBox" runat="server" Text='<%# Bind("Year3") %>' Enabled="False" />
                                <span class="input-group-addon"><%: Session["SessYr3"] %></span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year3 -->

                        <!-- Begin Year4 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year4TextBox" runat="server" Text='<%# Bind("Year4") %>' Enabled="False" />
                                <span class="input-group-addon"><%: Session["SessYr4"] %></span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year4 -->

                        <!-- Begin Year5 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="Year5TextBox" runat="server"
                                    Text='<%# Bind("Year5") %>' Enabled="False" />
                                <span class="input-group-addon"><%: Session["SessYr5"] %></span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year5 -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">
                                </label>
                                <asp:Button CssClass="btn btn-warning" ID="Button2" runat="server" CommandName="Edit" Text="Edit" />
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

                <asp:SqlDataSource ID="rccSummaryData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Programs] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Programs] ([Summary], [Problems], [Effective]) VALUES (@Summary, @Problems, @Effective)" SelectCommand="SELECT [Id], [Summary], [Problems], [Effective] FROM [Programs] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Programs] SET [Summary] = @Summary, [Problems] = @Problems, [Effective] = @Effective WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Summary" Type="String" />
                        <asp:Parameter Name="Problems" Type="String" />
                        <asp:Parameter Name="Effective" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Summary" Type="String" />
                        <asp:Parameter Name="Problems" Type="String" />
                        <asp:Parameter Name="Effective" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="rccSummaryView" runat="server" DataKeyNames="Id" DataSourceID="rccSummaryData">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Summary -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Problems
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="SummaryTextBox" runat="server" Text='<%# Bind("Summary") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Summary"
                                data-content="Write a brief summary of the assessment findings across the last five years."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Summary -->

                        <!-- Begin Problems -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Problems
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ProblemsTextBox" runat="server" Text='<%# Bind("Problems") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Problems"
                                data-content="Identify areas which were more difficult for students to complete or they had more trouble. How do you plan to address these areas?"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Problems -->

                        <!-- Begin Effectiveness -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Effectiveness
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EffectiveTextBox" runat="server" Text='<%# Bind("Effective") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Effectiveness"
                                data-content="Are these assessment measures still the most effective for the program? Please explain."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Effectiveness -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">
                                </label>
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
                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin Summary -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Problems
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="SummaryTextBox" runat="server" Text='<%# Bind("Summary") %>' Enabled="False" TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Summary"
                                data-content="Write a brief summary of the assessment findings across the last five years."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Summary -->

                        <!-- Begin Problems -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Problems
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ProblemsTextBox" runat="server" Text='<%# Bind("Problems") %>' Enabled="False" TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Problems"
                                data-content="Identify areas which were more difficult for students to complete or they had more trouble. How do you plan to address these areas?"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Problems -->

                        <!-- Begin Effectiveness -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Effectiveness
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EffectiveTextBox" runat="server" Text='<%# Bind("Effective") %>' Enabled="False" TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Effectiveness"
                                data-content="Are these assessment measures still the most effective for the program? Please explain."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Effectiveness -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">
                                </label>
                                <asp:Button CssClass="btn btn-warning" ID="Button2" runat="server" CommandName="Edit" Text="Edit" />
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


                <!-- More Buttons -->
                <div class="container">
                    <div class="form-group row col-sm-10">
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

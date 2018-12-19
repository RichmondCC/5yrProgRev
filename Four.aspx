<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="Four.aspx.cs" Inherits="Rcc5yrProgRev.Four" %>

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
                    <li class="active"><a href="Four.aspx">Four</a></li>
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
            <a href="Trends.aspx" target="_blank" role="button" class="btn btn-primary">Data</a>
        </div>

        <div id="rccFocus" class="container col-sm-10">
            <fieldset>

                <!-- Form Name -->
                <legend>Enrollment Trend Analysis</legend>
                <div class="col-sm-12">
                    <asp:Label ID="LabelAttachError" runat="server"></asp:Label>
                </div>
                <asp:SqlDataSource ID="rccTrendData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Programs] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Programs] ([DLnonDL], [Enrollment], [Demographics], [Explanation]) VALUES (@DLnonDL, @Enrollment, @Demographics, @Explanation)" SelectCommand="SELECT [Id], [DLnonDL], [Enrollment], [Demographics], [Explanation] FROM [Programs] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Programs] SET [DLnonDL] = @DLnonDL, [Enrollment] = @Enrollment, [Demographics] = @Demographics, [Explanation] = @Explanation WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DLnonDL" Type="String" />
                        <asp:Parameter Name="Enrollment" Type="String" />
                        <asp:Parameter Name="Demographics" Type="String" />
                        <asp:Parameter Name="Explanation" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DLnonDL" Type="String" />
                        <asp:Parameter Name="Enrollment" Type="String" />
                        <asp:Parameter Name="Demographics" Type="String" />
                        <asp:Parameter Name="Explanation" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="rccTrendView" runat="server" DataKeyNames="Id" DataSourceID="rccTrendData">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin DLnonDL -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                DL / non-D
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="DLnonDLTextBox" runat="server" Text='<%# Bind("DLnonDL") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="DL / non-DL"
                                data-content="Looking at the data tables for the five years, please summarize the distance learning/non-dl participation for students in your program."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End DLnonDL -->

                        <!-- Begin Enrollment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Enrollment
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EnrollmentTextBox" runat="server" Text='<%# Bind("Enrollment") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Enrollment"
                                data-content="Looking at the data tables for the five years, please summarize the enrollment trends. This would include totals, load, employment status, credentials enrolled, and student residence."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Enrollment -->

                        <!-- Begin Demographics -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Demographics
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="DemographicsTextBox" runat="server" Text='<%# Bind("Demographics") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Demographics"
                                data-content="Looking at the data tables for the five years, please summarize the demographic trends. This would include gender, age, and ethnicity."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Demographics -->

                        <!-- Begin Explanation -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Explain
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ExplanationTextBox" runat="server" Text='<%# Bind("Explanation") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Explain"
                                data-content="Please identify any significant findings and items which need to be addressed in relations to enrollment and demographics over the next five years."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Explanation -->

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
                        <div>No data was returned.</div>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin DLnonDL -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                DL / non-D
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="DLnonDLTextBox" runat="server" Text='<%# Bind("DLnonDL") %>' Enabled="False" TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="DL / non-DL"
                                data-content="Looking at the data tables for the five years, please summarize the distance learning/non-dl participation for students in your program."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End DLnonDL -->

                        <!-- Begin Enrollment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Enrollment
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EnrollmentTextBox" runat="server" Text='<%# Bind("Enrollment") %>' Enabled="False" TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Enrollment"
                                data-content="Looking at the data tables for the five years, please summarize the enrollment trends. This would include totals, load, employment status, credentials enrolled, and student residence."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Enrollment -->

                        <!-- Begin Demographics -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Demographics
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="DemographicsTextBox" runat="server" Text='<%# Bind("Demographics") %>' Enabled="False" TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Demographics"
                                data-content="Looking at the data tables for the five years, please summarize the demographic trends. This would include gender, age, and ethnicity."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Demographics -->

                        <!-- Begin Explanation -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Explain
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ExplanationTextBox" runat="server" Text='<%# Bind("Explanation") %>' Enabled="False" TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Explain"
                                data-content="Please identify any significant findings and items which need to be addressed in relations to enrollment and demographics over the next five years."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Explanation -->

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

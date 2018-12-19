<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="Nine.aspx.cs" Inherits="Rcc5yrProgRev.Nine" %>

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
                    <li><a href="Six.aspx">Six</a></li>
                    <li><a href="Seven.aspx">Seven</a></li>
                    <li><a href="Eight.aspx">Eight</a></li>
                    <li class="active"><a href="Nine.aspx">Nine</a></li>
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
        </div>

        <div id="rccFocus" class="container col-sm-10">
            <fieldset>

                <!-- Form Name -->
                <legend>General Impressions & Reflections</legend>
                <div class="col-sm-12">
                    <asp:Label ID="LabelAttachError" runat="server"></asp:Label>
                </div>
                <asp:ListView ID="ActvityView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceActivity" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Activities -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Activities
                            </label>
                            <div class="input-group col-sm-8">
                                <label class="checkbox-inline col-sm-5">
                                    <span style="padding-right: .5em">&nbsp;</span><asp:CheckBox ID="CoursesCheckBox" runat="server" Checked='<%# Bind("Courses") %>' Text="Courses" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <span style="padding-right: .5em">&nbsp;</span><asp:CheckBox ID="ProgramsCheckBox" runat="server" Checked='<%# Bind("Programs") %>' Text="Programs" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="ConferenceCheckBox" runat="server" Checked='<%# Bind("Conference") %>' Text="Conference" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="DialogCheckBox" runat="server" Checked='<%# Bind("Dialog") %>' Text="Dialog" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="DocImprovementsCheckBox" runat="server" Checked='<%# Bind("DocImprovements") %>' Text="DocImprovements" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="NewDegreeCertCheckBox" runat="server" Checked='<%# Bind("NewDegreeCert") %>' Text="NewDegreeCert" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="WorkshopCheckBox" runat="server" Checked='<%# Bind("Workshop") %>' Text="Workshop" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="SuccessConCheckBox" runat="server" Checked='<%# Bind("SuccessCon") %>' Text="SuccessCon" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="DevelopmentCheckBox" runat="server" Checked='<%# Bind("Development") %>' Text="Development" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="MinutesCheckBox" runat="server" Checked='<%# Bind("Minutes") %>' Text="Minutes" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="ReorganizeCheckBox" runat="server" Checked='<%# Bind("Reorganize") %>' Text="Reorganize" />
                                </label>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Activities"
                                data-content="Please list any changes the program is expected to make over the next five years by checking the box next to the item."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Activities -->

                        <!-- Begin Other -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Other Activity
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="OtherTextBox" runat="server" Text='<%# Bind("Other") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Other -->

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
                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin Activities -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Activities
                            </label>
                            <div class="input-group col-sm-8">
                                <label class="checkbox-inline col-sm-5">
                                    <span style="padding-right: .5em">&nbsp;</span><asp:CheckBox ID="CoursesCheckBox" runat="server" Checked='<%# Bind("Courses") %>' Enabled="false" Text="Courses" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <span style="padding-right: .5em">&nbsp;</span><asp:CheckBox ID="ProgramsCheckBox" runat="server" Checked='<%# Bind("Programs") %>' Enabled="false" Text="Programs" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="ConferenceCheckBox" runat="server" Checked='<%# Bind("Conference") %>' Enabled="false" Text="Conference" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="DialogCheckBox" runat="server" Checked='<%# Bind("Dialog") %>' Enabled="false" Text="Dialog" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="DocImprovementsCheckBox" runat="server" Checked='<%# Bind("DocImprovements") %>' Enabled="false" Text="DocImprovements" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="NewDegreeCertCheckBox" runat="server" Checked='<%# Bind("NewDegreeCert") %>' Enabled="false" Text="NewDegreeCert" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="WorkshopCheckBox" runat="server" Checked='<%# Bind("Workshop") %>' Enabled="false" Text="Workshop" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="SuccessConCheckBox" runat="server" Checked='<%# Bind("SuccessCon") %>' Enabled="false" Text="SuccessCon" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="DevelopmentCheckBox" runat="server" Checked='<%# Bind("Development") %>' Enabled="false" Text="Development" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="MinutesCheckBox" runat="server" Checked='<%# Bind("Minutes") %>' Enabled="false" Text="Minutes" />
                                </label>
                                <label class="checkbox-inline col-sm-5">
                                    <asp:CheckBox ID="ReorganizeCheckBox" runat="server" Checked='<%# Bind("Reorganize") %>' Enabled="false" Text="Reorganize" />
                                </label>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Activities"
                                data-content="Please list any changes the program is expected to make over the next five years by checking the box next to the item."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Activities -->

                        <!-- Begin Other -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Other Activity
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="OtherTextBox" runat="server" Text='<%# Bind("Other") %>' TextMode="MultiLine" Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Other -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-1 control-label"></label>
                                <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" CommandName="Edit" Text="Edit" />
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
                <asp:SqlDataSource ID="SqlDataSourceActivity" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Reflection] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Reflection] ([Courses], [Programs], [Conference], [Dialog], [DocImprovements], [NewDegreeCert], [Workshop], [SuccessCon], [Development], [Minutes], [Reorganize], [Other]) VALUES (@Courses, @Programs, @Conference, @Dialog, @DocImprovements, @NewDegreeCert, @Workshop, @SuccessCon, @Development, @Minutes, @Reorganize, @Other)" SelectCommand="SELECT [Id], [Courses], [Programs], [Conference], [Dialog], [DocImprovements], [NewDegreeCert], [Workshop], [SuccessCon], [Development], [Minutes], [Reorganize], [Other] FROM [Reflection] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Reflection] SET [Courses] = @Courses, [Programs] = @Programs, [Conference] = @Conference, [Dialog] = @Dialog, [DocImprovements] = @DocImprovements, [NewDegreeCert] = @NewDegreeCert, [Workshop] = @Workshop, [SuccessCon] = @SuccessCon, [Development] = @Development, [Minutes] = @Minutes, [Reorganize] = @Reorganize, [Other] = @Other WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Courses" Type="Boolean" />
                        <asp:Parameter Name="Programs" Type="Boolean" />
                        <asp:Parameter Name="Conference" Type="Boolean" />
                        <asp:Parameter Name="Dialog" Type="Boolean" />
                        <asp:Parameter Name="DocImprovements" Type="Boolean" />
                        <asp:Parameter Name="NewDegreeCert" Type="Boolean" />
                        <asp:Parameter Name="Workshop" Type="Boolean" />
                        <asp:Parameter Name="SuccessCon" Type="Boolean" />
                        <asp:Parameter Name="Development" Type="Boolean" />
                        <asp:Parameter Name="Minutes" Type="Boolean" />
                        <asp:Parameter Name="Reorganize" Type="Boolean" />
                        <asp:Parameter Name="Other" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Courses" Type="Boolean" />
                        <asp:Parameter Name="Programs" Type="Boolean" />
                        <asp:Parameter Name="Conference" Type="Boolean" />
                        <asp:Parameter Name="Dialog" Type="Boolean" />
                        <asp:Parameter Name="DocImprovements" Type="Boolean" />
                        <asp:Parameter Name="NewDegreeCert" Type="Boolean" />
                        <asp:Parameter Name="Workshop" Type="Boolean" />
                        <asp:Parameter Name="SuccessCon" Type="Boolean" />
                        <asp:Parameter Name="Development" Type="Boolean" />
                        <asp:Parameter Name="Minutes" Type="Boolean" />
                        <asp:Parameter Name="Reorganize" Type="Boolean" />
                        <asp:Parameter Name="Other" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:ListView ID="CommentView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceComment" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Comment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Comments
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Comments"
                                data-content="Please support each of the planned changes in this section."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Comment -->

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
                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin Comment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Comments
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' TextMode="MultiLine" Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Comments"
                                data-content="Please support each of the planned changes in this section."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Comment -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-1 control-label"></label>
                                <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" CommandName="Edit" Text="Edit" />
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
                <asp:SqlDataSource ID="SqlDataSourceComment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Reflection] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Reflection] ([Comment]) VALUES (@Comment)" SelectCommand="SELECT [Id], [Comment] FROM [Reflection] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Reflection] SET [Comment] = @Comment WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Comment" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Comment" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:ListView ID="SummaryView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceSummary" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Summary -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Summary
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="SummaryTextBox" runat="server" Text='<%# Bind("Summary") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Summary"
                                data-content="Final thoughts on the program as a whole and considering all sections of the Program Review."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Summary -->

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
                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin Summary -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Summary
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="SummaryTextBox" runat="server" Text='<%# Bind("Summary") %>' TextMode="MultiLine" Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Summary"
                                data-content="Final thoughts on the program as a whole and considering all sections of the Program Review."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Summary -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-1 control-label"></label>
                                <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" CommandName="Edit" Text="Edit" />
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

                        <!-- Begin Summary -->
                        <div class="row">
                            <div class="form-group col-sm-7">
                                <label class="col-sm-3 control-label">Summary</label>
                                <asp:TextBox ID="SummaryTextBox" runat="server" Text='<%# Bind("Summary") %>' TextMode="MultiLine" Enabled="False" />
                            </div>
                            <div class="col-md-3">
                            </div>
                        </div>
                        <!-- End Summary -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-7">
                                <label class="col-sm-3 control-label"></label>
                                <asp:Button CssClass="btn btn-warning" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </div>
                        </div>
                        <!-- End Buttons -->

                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourceSummary" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Reflection] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Reflection] ([Summary]) VALUES (@Summary)" SelectCommand="SELECT [Id], [Summary] FROM [Reflection] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Reflection] SET [Summary] = @Summary WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Summary" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Summary" Type="String" />
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
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Attachments"
                                    data-content="Any supporting documentation that has not already been uploaded during the program review."><i class="glyphicon glyphicon-question-sign"></i></a>
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

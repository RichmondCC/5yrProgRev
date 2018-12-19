<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="Five.aspx.cs" Inherits="Rcc5yrProgRev.Five" %>

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
                    <li class="active"><a href="Five.aspx">Five</a></li>
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
            <div class="row">
                <a href="GradRetEmp.aspx" target="_blank" role="button" class="btn btn-primary">Data</a>
            </div>
            <div class="row">
                <p>
                    <br />
                    Employment Info by Year</p>
                <asp:SqlDataSource ID="rccEmpDDLData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Year], [Id] FROM [Employment] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))">
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="rccEmpDDL" runat="server" DataSourceID="rccEmpDDLData" DataTextField="Year" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
            </div>
            <div class="row">
                <p>
                    <br />
                    <a href="#empAddModal" role="button" class="btn btn-success" data-toggle="modal">Add</a>
                </p>
            </div>
        </div>

        <div id="rccFocus" class="container col-sm-10">
            <fieldset>

                <!-- Form Name -->
                <legend>Program Retention, Graduation, & Employment</legend>
                <div class="col-sm-12">
                    <asp:Label ID="LabelAttachError" runat="server"></asp:Label>
                </div>
                <a href="Attachments/src/img/nctower.pdf" target="_blank"><i class="glyphicon glyphicon-question-sign"></i></a>
                <asp:SqlDataSource ID="rccEmpData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Employment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Employment] ([ProgramID], [ReviewYear], [Year], [Employed], [EmployedDegree], [EmployedDiploma], [EmployedCertificate], [MeanAnnualWages], [YrDegree], [YrDiploma], [YrCertificate], [MedianAnnualWages], [PrcntDegree], [PrcntDiploma], [PrcntCertificate]) VALUES (@ProgramID, @ReviewYear, @Year, @Employed, @EmployedDegree, @EmployedDiploma, @EmployedCertificate, @MeanAnnualWages, @YrDegree, @YrDiploma, @YrCertificate, @MedianAnnualWages, @PrcntDegree, @PrcntDiploma, @PrcntCertificate)" SelectCommand="SELECT [Id], [Year], [Employed], [EmployedDegree], [EmployedDiploma], [EmployedCertificate], [MeanAnnualWages], [YrDegree], [YrDiploma], [YrCertificate], [MedianAnnualWages], [PrcntDegree], [PrcntDiploma], [PrcntCertificate] FROM [Employment] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [Employment] SET [Year] = @Year, [Employed] = @Employed, [EmployedDegree] = @EmployedDegree, [EmployedDiploma] = @EmployedDiploma, [EmployedCertificate] = @EmployedCertificate, [MeanAnnualWages] = @MeanAnnualWages, [YrDegree] = @YrDegree, [YrDiploma] = @YrDiploma, [YrCertificate] = @YrCertificate, [MedianAnnualWages] = @MedianAnnualWages, [PrcntDegree] = @PrcntDegree, [PrcntDiploma] = @PrcntDiploma, [PrcntCertificate] = @PrcntCertificate WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                        <asp:Parameter Name="Year" Type="String" />
                        <asp:Parameter Name="Employed" Type="String" />
                        <asp:Parameter Name="EmployedDegree" Type="String" />
                        <asp:Parameter Name="EmployedDiploma" Type="String" />
                        <asp:Parameter Name="EmployedCertificate" Type="String" />
                        <asp:Parameter Name="MeanAnnualWages" Type="String" />
                        <asp:Parameter Name="YrDegree" Type="String" />
                        <asp:Parameter Name="YrDiploma" Type="String" />
                        <asp:Parameter Name="YrCertificate" Type="String" />
                        <asp:Parameter Name="MedianAnnualWages" Type="String" />
                        <asp:Parameter Name="PrcntDegree" Type="String" />
                        <asp:Parameter Name="PrcntDiploma" Type="String" />
                        <asp:Parameter Name="PrcntCertificate" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="rccEmpDDL" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Year" Type="String" />
                        <asp:Parameter Name="Employed" Type="String" />
                        <asp:Parameter Name="EmployedDegree" Type="String" />
                        <asp:Parameter Name="EmployedDiploma" Type="String" />
                        <asp:Parameter Name="EmployedCertificate" Type="String" />
                        <asp:Parameter Name="MeanAnnualWages" Type="String" />
                        <asp:Parameter Name="YrDegree" Type="String" />
                        <asp:Parameter Name="YrDiploma" Type="String" />
                        <asp:Parameter Name="YrCertificate" Type="String" />
                        <asp:Parameter Name="MedianAnnualWages" Type="String" />
                        <asp:Parameter Name="PrcntDegree" Type="String" />
                        <asp:Parameter Name="PrcntDiploma" Type="String" />
                        <asp:Parameter Name="PrcntCertificate" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="rccEmpView" runat="server" DataKeyNames="Id" DataSourceID="rccEmpData" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Year -->
                        <div class="form-group col-sm-10">
                            <label class="col-sm-6 control-label">
                                Inlcude data for years <%: Session["SessYrEmploy"] %>
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                                <span class="input-group-addon">Year</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year -->

                        <!-- Begin Employed -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-6 control-label">
                                Percent employed after one year
                            </label>
                            <div class="input-group col-sm-2">
                                <asp:TextBox CssClass="form-control" ID="EmployedTextBox" runat="server" Text='<%# Bind("Employed") %>' />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Employed -->

                        <!-- Begin MeanAnnualWages -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-6 control-label">
                                Mean Annual Wages after 1 Year
                            </label>
                            <div class="input-group col-sm-2">
                                <asp:TextBox CssClass="form-control" ID="MeanAnnualWagesTextBox" runat="server" Text='<%# Bind("MeanAnnualWages") %>' />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End MeanAnnualWages -->

                        <!-- Begin MedianAnnualWages -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-6 control-label">
                                Median annual wages within 25th to 75th percentile range
                            </label>
                            <div class="input-group col-sm-2">
                                <asp:TextBox CssClass="form-control" ID="MedianAnnualWagesTextBox" runat="server" Text='<%# Bind("MedianAnnualWages") %>' />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End MedianAnnualWages -->

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

                        <div id="empAddModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h3 id="myModalLabel">Add Employment Data</h3>
                                    </div>
                                    <div class="modal-body">

                                        <!-- Begin Year -->
                                        <div class="form-group col-sm-10">
                                            <label class="col-sm-6 control-label">
                                                Inlcude data for years <%: Session["SessYrEmploy"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                                                <span class="input-group-addon">Year</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Year -->

                                        <!-- Begin Employed -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-6 control-label">
                                                Percent employed after one year
                                            </label>
                                            <div class="input-group col-sm-2">
                                                <asp:TextBox CssClass="form-control" ID="EmployedTextBox" runat="server" Text='<%# Bind("Employed") %>' />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Employed -->

                                        <!-- Begin MeanAnnualWages -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-6 control-label">
                                                Mean Annual Wages after 1 Year
                                            </label>
                                            <div class="input-group col-sm-2">
                                                <asp:TextBox CssClass="form-control" ID="MeanAnnualWagesTextBox" runat="server" Text='<%# Bind("MeanAnnualWages") %>' />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End MeanAnnualWages -->

                                        <!-- Begin MedianAnnualWages -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-6 control-label">
                                                Median annual wages within 25th to 75th percentile range
                                            </label>
                                            <div class="input-group col-sm-2">
                                                <asp:TextBox CssClass="form-control" ID="MedianAnnualWagesTextBox" runat="server" Text='<%# Bind("MedianAnnualWages") %>' />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End MedianAnnualWages -->

                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-10">
                                                <label class="col-sm-4 control-label"></label>
                                                <asp:Button CssClass="btn btn-success" ID="empInsertButton" runat="server" CommandName="Insert" Text="Insert" PostBackUrl="~/Five.aspx" />
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

                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin Year -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-8 control-label">
                                Inlcude data for years <%: Session["SessYrEmploy"] %>
                            </label>
                            <div class="input-group col-sm-3">
                                <asp:TextBox CssClass="form-control" ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' Enabled="False" />
                                <span class="input-group-addon">Year</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-4">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Year -->

                        <!-- Begin Employed -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-8 control-label">
                                Percent employed after one year
                            </label>
                            <div class="input-group col-sm-3">
                                <asp:TextBox CssClass="form-control" ID="EmployedTextBox" runat="server" Text='<%# Bind("Employed") %>' Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Employed -->

                        <!-- Begin MeanAnnualWages -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-8 control-label">
                                Mean Annual Wages after 1 Year
                            </label>
                            <div class="input-group col-sm-3">
                                <asp:TextBox CssClass="form-control" ID="MeanAnnualWagesTextBox" runat="server" Text='<%# Bind("MeanAnnualWages") %>' Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End MeanAnnualWages -->

                        <!-- Begin MedianAnnualWages -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-8 control-label">
                                Median annual wages within 25th to 75th percentile
                            </label>
                            <div class="input-group col-sm-3">
                                <asp:TextBox CssClass="form-control" ID="MedianAnnualWagesTextBox" runat="server" Text='<%# Bind("MedianAnnualWages") %>' Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End MedianAnnualWages -->


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
                <asp:SqlDataSource ID="rccSummaryData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [EnrolRecruitRetainEmploy] WHERE [Id] = @Id" InsertCommand="INSERT INTO [EnrolRecruitRetainEmploy] ([Comment], [Assess], [Enrollment], [Retention], [Recruitment]) VALUES (@Comment, @Assess, @Enrollment, @Retention, @Recruitment)" SelectCommand="SELECT [Id], [Comment], [Assess], [Enrollment], [Retention], [Recruitment] FROM [EnrolRecruitRetainEmploy] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [EnrolRecruitRetainEmploy] SET [Comment] = @Comment, [Assess] = @Assess, [Enrollment] = @Enrollment, [Retention] = @Retention, [Recruitment] = @Recruitment WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Comment" Type="String" />
                        <asp:Parameter Name="Assess" Type="String" />
                        <asp:Parameter Name="Enrollment" Type="String" />
                        <asp:Parameter Name="Retention" Type="String" />
                        <asp:Parameter Name="Recruitment" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Comment" Type="String" />
                        <asp:Parameter Name="Assess" Type="String" />
                        <asp:Parameter Name="Enrollment" Type="String" />
                        <asp:Parameter Name="Retention" Type="String" />
                        <asp:Parameter Name="Recruitment" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="rccSummaryView" runat="server" DataKeyNames="Id" DataSourceID="rccSummaryData" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Comment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Comments on employment data
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Comment -->

                        <!-- Begin Assess -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Summarize Changes
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="AssessTextBox" runat="server" Text='<%# Bind("Assess") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Assess -->

                        <!-- Begin Enrollment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Enrollment
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="EnrollmentTextBox" runat="server" Text='<%# Bind("Enrollment") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Enrollment -->

                        <!-- Begin Retention -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Retention
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="RetentionTextBox" runat="server" Text='<%# Bind("Retention") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Retention -->

                        <!-- Begin Recruitment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Retention
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="RecruitmentTextBox" runat="server" Text='<%# Bind("Recruitment") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Recruitment -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label"></label>
                                <asp:Button CssClass="btn btn-warning" ID="Button5" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button CssClass="btn btn-success" ID="Button6" runat="server" CommandName="Cancel" Text="Cancel" />
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

                        <!-- Begin Comment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Comments on employment data
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' TextMode="MultiLine" Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Comment -->

                        <!-- Begin Assess -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Summarize Changes
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="AssessTextBox" runat="server" Text='<%# Bind("Assess") %>' TextMode="MultiLine" Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Assess -->

                        <!-- Begin Enrollment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Enrollment
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="EnrollmentTextBox" runat="server" Text='<%# Bind("Enrollment") %>' TextMode="MultiLine" Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Enrollment -->

                        <!-- Begin Retention -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Retention
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="RetentionTextBox" runat="server" Text='<%# Bind("Retention") %>' TextMode="MultiLine" Enabled="false" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Retention -->

                        <!-- Begin Recruitment -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Retention
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="RecruitmentTextBox" runat="server" Text='<%# Bind("Recruitment") %>' TextMode="MultiLine" Enabled="false" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Recruitment -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label"></label>
                                <asp:Button CssClass="btn btn-warning" ID="Button3" runat="server" CommandName="Edit" Text="Edit" />
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
                    <div class="form-group row col-sm-7">
                        <label class="col-sm-3 control-label" for="moreButton">More</label>
                        <div>
                            <a href="#aaasEditModal" role="button" class="btn btn-primary" data-toggle="modal">AA/AS Only</a>
                            <a href="#articulationModal" role="button" class="btn btn-primary" data-toggle="modal">Articulation Agreements</a>
                            <a href="#fileUploadModal" role="button" class="btn btn-primary" data-toggle="modal">Attachments</a>
                        </div>
                    </div>
                </div>

                <!-- Begin Edit AAAS -->
                <div id="aaasEditModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">AA/AS Only</h3>
                            </div>
                            <div class="modal-body">

                                <asp:SqlDataSource ID="rccAAASdata" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Transfer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Transfer] ([Transferred], [GpaPreTranser], [GpaPostTransfer]) VALUES (@Transferred, @GpaPreTranser, @GpaPostTransfer)" SelectCommand="SELECT [Id], [Transferred], [GpaPreTranser], [GpaPostTransfer] FROM [Transfer] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Transfer] SET [Transferred] = @Transferred, [GpaPreTranser] = @GpaPreTranser, [GpaPostTransfer] = @GpaPostTransfer WHERE [Id] = @Id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Transferred" Type="String" />
                                        <asp:Parameter Name="GpaPreTranser" Type="String" />
                                        <asp:Parameter Name="GpaPostTransfer" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Transferred" Type="String" />
                                        <asp:Parameter Name="GpaPreTranser" Type="String" />
                                        <asp:Parameter Name="GpaPostTransfer" Type="String" />
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="rccAAASView" runat="server" DataKeyNames="Id" DataSourceID="rccAAASdata" InsertItemPosition="LastItem">
                                    <AlternatingItemTemplate>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <div>No data was returned.</div>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                    </InsertItemTemplate>
                                    <ItemTemplate>

                                        <!-- Begin Transferred -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Retention
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox ID="TransferredTextBox" runat="server" Text='<%# Bind("Transferred") %>' />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Transferred -->

                                        <!-- Begin GpaPreTranser -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Retention
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox ID="GpaPreTranserTextBox" runat="server" Text='<%# Bind("GpaPreTranser") %>' />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End GpaPreTranser -->

                                        <!-- Begin GpaPostTransfer -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Retention
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox ID="GpaPostTransferTextBox" runat="server" Text='<%# Bind("GpaPostTransfer") %>' />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End GpaPostTransfer -->

                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-8">
                                                <label class="col-sm-4 control-label"></label>
                                                <asp:Button CssClass="btn btn-warning" ID="Button4" runat="server" CommandName="Update" Text="Update" />
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
                <!-- End Edit AAAS -->

                <!-- Begin Articulation -->
                <div id="articulationModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Articulation Agreements</h3>
                            </div>
                            <div class="modal-body">

                                <asp:SqlDataSource ID="rccArticData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Articulation] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Articulation] ([AppalachianStateUniversity], [EastCarolinaUniversity], [ElizabethCityStateUniversity], [FayettevilleStateUniversity], [NCAgriculturalandTechnicalStateUniversity], [NCStateUniversity], [NorthCarolinaCentralUniversity], [UNCAsheville], [UNCChapelHill], [UNCCharlotte], [UNCGreensboro], [UNCPembroke], [UNCWilmington], [UNCSchooloftheArts], [WesternCarolinaUniversity], [WinstonSalemStateUniversity], [OtherPrivUni], [OtherStateUni]) VALUES (@AppalachianStateUniversity, @EastCarolinaUniversity, @ElizabethCityStateUniversity, @FayettevilleStateUniversity, @NCAgriculturalandTechnicalStateUniversity, @NCStateUniversity, @NorthCarolinaCentralUniversity, @UNCAsheville, @UNCChapelHill, @UNCCharlotte, @UNCGreensboro, @UNCPembroke, @UNCWilmington, @UNCSchooloftheArts, @WesternCarolinaUniversity, @WinstonSalemStateUniversity, @OtherPrivUni, @OtherStateUni)" SelectCommand="SELECT [Id], [AppalachianStateUniversity], [EastCarolinaUniversity], [ElizabethCityStateUniversity], [FayettevilleStateUniversity], [NCAgriculturalandTechnicalStateUniversity], [NCStateUniversity], [NorthCarolinaCentralUniversity], [UNCAsheville], [UNCChapelHill], [UNCCharlotte], [UNCGreensboro], [UNCPembroke], [UNCWilmington], [UNCSchooloftheArts], [WesternCarolinaUniversity], [WinstonSalemStateUniversity], [OtherPrivUni], [OtherStateUni] FROM [Articulation] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Articulation] SET [AppalachianStateUniversity] = @AppalachianStateUniversity, [EastCarolinaUniversity] = @EastCarolinaUniversity, [ElizabethCityStateUniversity] = @ElizabethCityStateUniversity, [FayettevilleStateUniversity] = @FayettevilleStateUniversity, [NCAgriculturalandTechnicalStateUniversity] = @NCAgriculturalandTechnicalStateUniversity, [NCStateUniversity] = @NCStateUniversity, [NorthCarolinaCentralUniversity] = @NorthCarolinaCentralUniversity, [UNCAsheville] = @UNCAsheville, [UNCChapelHill] = @UNCChapelHill, [UNCCharlotte] = @UNCCharlotte, [UNCGreensboro] = @UNCGreensboro, [UNCPembroke] = @UNCPembroke, [UNCWilmington] = @UNCWilmington, [UNCSchooloftheArts] = @UNCSchooloftheArts, [WesternCarolinaUniversity] = @WesternCarolinaUniversity, [WinstonSalemStateUniversity] = @WinstonSalemStateUniversity, [OtherPrivUni] = @OtherPrivUni, [OtherStateUni] = @OtherStateUni WHERE [Id] = @Id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="AppalachianStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="EastCarolinaUniversity" Type="Boolean" />
                                        <asp:Parameter Name="ElizabethCityStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="FayettevilleStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="NCAgriculturalandTechnicalStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="NCStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="NorthCarolinaCentralUniversity" Type="Boolean" />
                                        <asp:Parameter Name="UNCAsheville" Type="Boolean" />
                                        <asp:Parameter Name="UNCChapelHill" Type="Boolean" />
                                        <asp:Parameter Name="UNCCharlotte" Type="Boolean" />
                                        <asp:Parameter Name="UNCGreensboro" Type="Boolean" />
                                        <asp:Parameter Name="UNCPembroke" Type="Boolean" />
                                        <asp:Parameter Name="UNCWilmington" Type="Boolean" />
                                        <asp:Parameter Name="UNCSchooloftheArts" Type="Boolean" />
                                        <asp:Parameter Name="WesternCarolinaUniversity" Type="Boolean" />
                                        <asp:Parameter Name="WinstonSalemStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="OtherPrivUni" Type="String" />
                                        <asp:Parameter Name="OtherStateUni" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="AppalachianStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="EastCarolinaUniversity" Type="Boolean" />
                                        <asp:Parameter Name="ElizabethCityStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="FayettevilleStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="NCAgriculturalandTechnicalStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="NCStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="NorthCarolinaCentralUniversity" Type="Boolean" />
                                        <asp:Parameter Name="UNCAsheville" Type="Boolean" />
                                        <asp:Parameter Name="UNCChapelHill" Type="Boolean" />
                                        <asp:Parameter Name="UNCCharlotte" Type="Boolean" />
                                        <asp:Parameter Name="UNCGreensboro" Type="Boolean" />
                                        <asp:Parameter Name="UNCPembroke" Type="Boolean" />
                                        <asp:Parameter Name="UNCWilmington" Type="Boolean" />
                                        <asp:Parameter Name="UNCSchooloftheArts" Type="Boolean" />
                                        <asp:Parameter Name="WesternCarolinaUniversity" Type="Boolean" />
                                        <asp:Parameter Name="WinstonSalemStateUniversity" Type="Boolean" />
                                        <asp:Parameter Name="OtherPrivUni" Type="String" />
                                        <asp:Parameter Name="OtherStateUni" Type="String" />
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:ListView ID="rccArticView" runat="server" DataKeyNames="Id" DataSourceID="rccArticData">
                                    <AlternatingItemTemplate>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <div>No data was returned.</div>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                    </InsertItemTemplate>
                                    <ItemTemplate>

                                        <div class="col-sm-12">
                                            <div class="checkbox">
                                                <asp:CheckBox ID="AppStateCheckBox" runat="server" Checked='<%# Bind("AppalachianStateUniversity") %>'
                                                    Text="Appalachian State University" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="EastCarolinaCheckBox" runat="server" Checked='<%# Bind("EastCarolinaUniversity") %>'
                                                    Text="East Carolina University" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="ElizabethCityCheckBox" runat="server" Checked='<%# Bind("ElizabethCityStateUniversity") %>'
                                                    Text="Elizabeth City State University" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="FayettevilleStateCheckBox" runat="server" Checked='<%# Bind("FayettevilleStateUniversity") %>'
                                                    Text="Fayetteville State University" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="NCAandTCheckBox" runat="server" Checked='<%# Bind("NCAgriculturalandTechnicalStateUniversity") %>'
                                                    Text="NC Agricultural and Technical State University" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="NCStateCheckBox" runat="server" Checked='<%# Bind("NCStateUniversity") %>'
                                                    Text="NC State University" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="NCCentralCheckBox" runat="server" Checked='<%# Bind("NorthCarolinaCentralUniversity") %>'
                                                    Text="North Carolina Central University" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="UNCAshevilleCheckBox" runat="server" Checked='<%# Bind("UNCAsheville") %>'
                                                    Text="UNC Asheville" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="UNCChapelHillCheckBox" runat="server" Checked='<%# Bind("UNCChapelHill") %>'
                                                    Text="UNC Chapel Hill" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="UNCCharlotteCheckBox" runat="server" Checked='<%# Bind("UNCCharlotte") %>'
                                                    Text="UNC Charlotte" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="UNCGreensboroCheckBox" runat="server" Checked='<%# Bind("UNCGreensboro") %>'
                                                    Text="UNCGreensboro" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="UNCPembrokeCheckBox" runat="server" Checked='<%# Bind("UNCPembroke") %>'
                                                    Text="UNC Pembroke" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="UNCWilmingtonCheckBox" runat="server" Checked='<%# Bind("UNCWilmington") %>'
                                                    Text="UNC Wilmington" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="UNCArtsCheckBox" runat="server" Checked='<%# Bind("UNCSchooloftheArts") %>'
                                                    Text="UNC School of the Arts" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="WesternCarolinaCheckBox" runat="server" Checked='<%# Bind("WesternCarolinaUniversity") %>'
                                                    Text="Western Carolina University" />
                                            </div>

                                            <div class="checkbox">
                                                <asp:CheckBox ID="WinstonSalemCheckBox" runat="server" Checked='<%# Bind("WinstonSalemStateUniversity") %>'
                                                    Text="Winston Salem State University" />
                                            </div>
                                        </div>

                                        <!-- Begin OtherPrivUni -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                                Private University(Other)
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="OtherPrivUniTextBox" runat="server" Text='<%# Bind("OtherPrivUni") %>' />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End OtherPrivUni -->

                                        <!-- Begin OtherStateUni -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                                State University(Other)
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="OtherStateUniTextBox" runat="server" Text='<%# Bind("OtherStateUni") %>' />
                                                <span class="hidden input-group-addon">appended</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End OtherStateUni -->

                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-8">
                                                <label class="col-sm-4 control-label"></label>
                                                <asp:Button CssClass="btn btn-warning" ID="Button4" runat="server" CommandName="Update" Text="Update" />
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

                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="uploads">Attach New Agreements:</label>
                                    <div class="col-sm-7">
                                        <asp:FileUpload ID="FileUploadArt" runat="server" />
                                        <asp:Button ID="rccUploadArtButton" runat="server" OnClick="rccUploadArtButton_Click" Text="Upload" />
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="col-sm-12">
                                            <p><strong>New Articulation Agreements:</strong></p>
                                        </div>
                                        <div class="col-sm-12" style="padding-bottom: 1em;">
                                            <asp:DropDownList ID="DropDownListArt" runat="server" AppendDataBoundItems="True" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:Button ID="ButtonViewArt" runat="server" Text="View" OnClick="ButtonViewArt_Click" CssClass="btn btn-info" Auto />
                                            <a href="#confirmDeleteArt" class="btn btn-warning" data-toggle="collapse">Delete</a>
                                        </div>
                                        <div id="confirmDeleteArt" class="col-sm-8 collapse">
                                            <a href="#confirmDeleteArt" class="btn btn-success" data-toggle="collapse">Cancel Delete</a>
                                            <asp:Button ID="ButtonDelConfirmArt" runat="server" Text="Confirm Delete" OnClick="ButtonDelConfirmArt_Click" CssClass="btn btn-danger" />
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
                <!-- End Articulation -->


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

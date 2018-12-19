<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="Eight.aspx.cs" Inherits="Rcc5yrProgRev.Eight" %>

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
                    <li class="active"><a href="Eight.aspx">Eight</a></li>
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

    <div class="container">
        <div id="rccSubNav" class="container col-sm-2">
            <asp:SqlDataSource ID="SqlDataSourceMembers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Committee] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                    <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownListMembers" runat="server" DataSourceID="SqlDataSourceMembers" AutoPostBack="True" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
            <div class="add-btn">
                <br />
                <a href="#commAddModal" role="button" class="btn btn-success" data-toggle="modal">Add</a>
            </div>
        </div>

        <div id="rccFocus" class="container col-sm-10">
            <fieldset>

                <!-- Form Name -->
                <legend>Program Advisory Committee</legend>
                <div class="col-sm-12">
                    <asp:Label ID="LabelAttachError" runat="server"></asp:Label>
                </div>
                <asp:ListView ID="committeeView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceCommittee" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Name -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Name
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" Text='<%# Bind("Name") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Name"
                                data-content="First and Last Name of the advisory member.  Each advisory member needs to be entered separately."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Name -->

                        <!-- Begin Title -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Title
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" Text='<%# Bind("Title") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Title"
                                data-content="Professional title of member related to program."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Title -->

                        <!-- Begin Affiliation -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Affiliation
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" Text='<%# Bind("Affiliation") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Affiliation"
                                data-content="Organization that advisory member represents on the committee."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Affiliation -->

                        <!-- Begin Contact -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Contact
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" Text='<%# Bind("Contact") %>' TextMode="MultiLine" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Contact"
                                data-content="Email; phone; address"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Contact -->

                        <!-- Begin Joined -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Joined
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="JoinedTextBox" runat="server" Text='<%# Bind("Joined") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Joined"
                                data-content="This is the date they became a member of program’s advisory committee."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Joined -->

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

                        <!-- Begin CommitteeModal -->
                        <div id="commAddModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h3 id="myModalLabel">Attachments</h3>
                                    </div>
                                    <div class="modal-body">

                                        <!-- Begin Name -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Name
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" Text='<%# Bind("Name") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Name"
                                                data-content="First and Last Name of the advisory member.  Each advisory member needs to be entered separately."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Name -->

                                        <!-- Begin Title -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Title
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" Text='<%# Bind("Title") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Title"
                                                data-content="Professional title of member related to program."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Title -->

                                        <!-- Begin Affiliation -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Affiliation
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" Text='<%# Bind("Affiliation") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Affiliation"
                                                data-content="Organization that advisory member represents on the committee."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Affiliation -->

                                        <!-- Begin Contact -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Contact
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" Text='<%# Bind("Contact") %>' TextMode="MultiLine" />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Contact"
                                                data-content="Email; phone; address"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Contact -->

                                        <!-- Begin Joined -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Joined
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="JoinedTextBox" runat="server" Text='<%# Bind("Joined") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Joined"
                                                data-content="This is the date they became a member of program’s advisory committee."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Joined -->

                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-10">
                                                <label class="col-sm-4 control-label">
                                                </label>
                                                <asp:Button CssClass="btn btn-warning" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                <button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                            </div>
                                        </div>
                                        <!-- End Buttons -->

                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End CommitteeModal -->

                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin Name -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Name
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" Text='<%# Bind("Name") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Name"
                                data-content="First and Last Name of the advisory member.  Each advisory member needs to be entered separately."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Name -->

                        <!-- Begin Title -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Title
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" Text='<%# Bind("Title") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Title"
                                data-content="Professional title of member related to program."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Title -->

                        <!-- Begin Affiliation -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Affiliation
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" Text='<%# Bind("Affiliation") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Affiliation"
                                data-content="Organization that advisory member represents on the committee."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Affiliation -->

                        <!-- Begin Contact -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Contact
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" Text='<%# Bind("Contact") %>' Enabled="False" TextMode="MultiLine" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Contact"
                                data-content="Email; phone; address"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Contact -->

                        <!-- Begin Joined -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Joined
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="JoinedTextBox" runat="server" Text='<%# Bind("Joined") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Joined"
                                data-content="This is the date they became a member of program’s advisory committee."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Joined -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">
                                </label>
                                <asp:Button CssClass="btn btn-warning" ID="Button3" runat="server" CommandName="Edit" Text="Edit" />
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
                                                <asp:Button CssClass="btn btn-danger" ID="Button4" runat="server" CommandName="Delete" Text="Delete" />
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
                <asp:SqlDataSource ID="SqlDataSourceCommittee" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Committee] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Committee] ([Name], [Title], [Affiliation], [Contact], [Joined]) VALUES (@Name, @Title, @Affiliation, @Contact, @Joined)" SelectCommand="SELECT [Id], [Name], [Title], [Affiliation], [Contact], [Joined] FROM [Committee] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [Committee] SET [Name] = @Name, [Title] = @Title, [Affiliation] = @Affiliation, [Contact] = @Contact, [Joined] = @Joined WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Affiliation" Type="String" />
                        <asp:Parameter Name="Contact" Type="String" />
                        <asp:Parameter Name="Joined" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListMembers" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Affiliation" Type="String" />
                        <asp:Parameter Name="Contact" Type="String" />
                        <asp:Parameter Name="Joined" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>




                <!-- More Buttons -->
                <div class="container">
                    <div class="form-group row col-sm-7">
                        <label class="col-sm-3 control-label" for="moreButton">More</label>
                        <div>
                            <a href="#meetingsModal" role="button" class="btn btn-primary" data-toggle="modal">Meetings</a>
                            <a href="#discussionsModal" role="button" class="btn btn-primary" data-toggle="modal">Discussions</a>
                            <a href="#reccomendationsModal" role="button" class="btn btn-primary" data-toggle="modal">Reccomendations</a>
                            <a href="#fileUploadModal" role="button" class="btn btn-primary" data-toggle="modal">Attachments</a>
                        </div>
                    </div>
                </div>

                <!-- Begin Meetings -->
                <div id="meetingsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Meetings</h3>
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Meetings"
                                    data-content="Please identify the number of meetings and the number of attendees for each identified year.">
                                    <i class="glyphicon glyphicon-question-sign"></i></a>

                            </div>
                            <div class="modal-body">
                                <asp:ListView ID="MeetingsView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceMeetings" InsertItemPosition="LastItem">
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

                                        <div class="row">
                                            <div class="container col-sm-4">
                                                <h4>Academic Year</h4>
                                            </div>
                                            <div class="container col-sm-4">
                                                <h4>Number of Meetings</h4>
                                            </div>
                                            <div class="container col-sm-4">
                                                <h4>Number in Attendance</h4>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-4">
                                                <strong>
                                                    <%= Session["SessYr1"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="NumMeetingsYr1TextBox" runat="server" Text='<%# Bind("NumMeetingsYr1") %>' />
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="AttendanceYr1TextBox" runat="server" Text='<%# Bind("AttendanceYr1") %>' />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-4">
                                                <strong>
                                                    <%= Session["SessYr2"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="NumMeetingsYr2TextBox" runat="server" Text='<%# Bind("NumMeetingsYr2") %>' />
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="AttendanceYr2TextBox" runat="server" Text='<%# Bind("AttendanceYr2") %>' />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-4">
                                                <strong>
                                                    <%= Session["SessYr3"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="NumMeetingsYr3TextBox" runat="server" Text='<%# Bind("NumMeetingsYr3") %>' />
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="AttendanceYr3TextBox" runat="server" Text='<%# Bind("AttendanceYr3") %>' />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-4">
                                                <strong>
                                                    <%= Session["SessYr4"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="NumMeetingsYr4TextBox" runat="server" Text='<%# Bind("NumMeetingsYr4") %>' />
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="AttendanceYr4TextBox" runat="server" Text='<%# Bind("AttendanceYr4") %>' />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-4">
                                                <strong>
                                                    <%= Session["SessYr5"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="NumMeetingsYr5TextBox" runat="server" Text='<%# Bind("NumMeetingsYr5") %>' />
                                            </div>
                                            <div class="container col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="AttendanceYr5TextBox" runat="server" Text='<%# Bind("AttendanceYr5") %>' />
                                            </div>
                                        </div>

                                        <!-- Begin Buttons -->
                                        <div class="row" style="margin-top: 1em;">
                                            <div class="form-group col-sm-12">
                                                <label class="col-sm-4 control-label">
                                                </label>
                                                <asp:Button CssClass="btn btn-warning" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">Cancel</button>
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
                                <asp:SqlDataSource ID="SqlDataSourceMeetings" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [CommitteeData] WHERE [Id] = @Id" InsertCommand="INSERT INTO [CommitteeData] ([NumMeetingsYr1], [AttendanceYr1], [NumMeetingsYr2], [AttendanceYr2], [NumMeetingsYr3], [AttendanceYr3], [NumMeetingsYr4], [AttendanceYr4], [NumMeetingsYr5], [AttendanceYr5]) VALUES (@NumMeetingsYr1, @AttendanceYr1, @NumMeetingsYr2, @AttendanceYr2, @NumMeetingsYr3, @AttendanceYr3, @NumMeetingsYr4, @AttendanceYr4, @NumMeetingsYr5, @AttendanceYr5)" SelectCommand="SELECT [Id], [NumMeetingsYr1], [AttendanceYr1], [NumMeetingsYr2], [AttendanceYr2], [NumMeetingsYr3], [AttendanceYr3], [NumMeetingsYr4], [AttendanceYr4], [NumMeetingsYr5], [AttendanceYr5] FROM [CommitteeData] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [CommitteeData] SET [NumMeetingsYr1] = @NumMeetingsYr1, [AttendanceYr1] = @AttendanceYr1, [NumMeetingsYr2] = @NumMeetingsYr2, [AttendanceYr2] = @AttendanceYr2, [NumMeetingsYr3] = @NumMeetingsYr3, [AttendanceYr3] = @AttendanceYr3, [NumMeetingsYr4] = @NumMeetingsYr4, [AttendanceYr4] = @AttendanceYr4, [NumMeetingsYr5] = @NumMeetingsYr5, [AttendanceYr5] = @AttendanceYr5 WHERE [Id] = @Id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="NumMeetingsYr1" Type="String" />
                                        <asp:Parameter Name="AttendanceYr1" Type="String" />
                                        <asp:Parameter Name="NumMeetingsYr2" Type="String" />
                                        <asp:Parameter Name="AttendanceYr2" Type="String" />
                                        <asp:Parameter Name="NumMeetingsYr3" Type="String" />
                                        <asp:Parameter Name="AttendanceYr3" Type="String" />
                                        <asp:Parameter Name="NumMeetingsYr4" Type="String" />
                                        <asp:Parameter Name="AttendanceYr4" Type="String" />
                                        <asp:Parameter Name="NumMeetingsYr5" Type="String" />
                                        <asp:Parameter Name="AttendanceYr5" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="NumMeetingsYr1" Type="String" />
                                        <asp:Parameter Name="AttendanceYr1" Type="String" />
                                        <asp:Parameter Name="NumMeetingsYr2" Type="String" />
                                        <asp:Parameter Name="AttendanceYr2" Type="String" />
                                        <asp:Parameter Name="NumMeetingsYr3" Type="String" />
                                        <asp:Parameter Name="AttendanceYr3" Type="String" />
                                        <asp:Parameter Name="NumMeetingsYr4" Type="String" />
                                        <asp:Parameter Name="AttendanceYr4" Type="String" />
                                        <asp:Parameter Name="NumMeetingsYr5" Type="String" />
                                        <asp:Parameter Name="AttendanceYr5" Type="String" />
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Meetings -->

                <!-- Begin Discussions -->
                <div id="discussionsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Discussions</h3>
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Discussions"
                                    data-content="Please document the major discussions the committee had regarding the program over the last five years.">
                                    <i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <div class="modal-body">
                                <asp:ListView ID="discussionsView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceDiscussions" InsertItemPosition="LastItem">
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

                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>Academic Year</strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <strong>Major Discussions</strong>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr1"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox CssClass="form-control" ID="DiscussYr1TextBox" runat="server" Text='<%# Bind("DiscussYr1") %>' TextMode="MultiLine" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr2"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox CssClass="form-control" ID="DiscussYr2TextBox" runat="server" Text='<%# Bind("DiscussYr2") %>' TextMode="MultiLine" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr3"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox CssClass="form-control" ID="DiscussYr3TextBox" runat="server" Text='<%# Bind("DiscussYr3") %>' TextMode="MultiLine" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr4"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox CssClass="form-control" ID="DiscussYr4TextBox" runat="server" Text='<%# Bind("DiscussYr5") %>' TextMode="MultiLine" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr5"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox CssClass="form-control" ID="DiscussYr5TextBox" runat="server" Text='<%# Bind("DiscussYr5") %>' TextMode="MultiLine" />
                                            </div>
                                        </div>

                                        <!-- Begin Buttons -->
                                        <div class="row" style="margin-top: 1em;">
                                            <div class="form-group col-sm-12">
                                                <label class="col-sm-6 control-label">
                                                </label>
                                                <asp:Button CssClass="btn btn-warning" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">Cancel</button>
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
                                <asp:SqlDataSource ID="SqlDataSourceDiscussions" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [CommitteeData] WHERE [Id] = @Id" InsertCommand="INSERT INTO [CommitteeData] ([DiscussYr1], [DiscussYr2], [DiscussYr3], [DiscussYr4], [DiscussYr5]) VALUES (@DiscussYr1, @DiscussYr2, @DiscussYr3, @DiscussYr4, @DiscussYr5)" SelectCommand="SELECT [Id], [DiscussYr1], [DiscussYr2], [DiscussYr3], [DiscussYr4], [DiscussYr5] FROM [CommitteeData] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [CommitteeData] SET [DiscussYr1] = @DiscussYr1, [DiscussYr2] = @DiscussYr2, [DiscussYr3] = @DiscussYr3, [DiscussYr4] = @DiscussYr4, [DiscussYr5] = @DiscussYr5 WHERE [Id] = @Id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DiscussYr1" Type="String" />
                                        <asp:Parameter Name="DiscussYr2" Type="String" />
                                        <asp:Parameter Name="DiscussYr3" Type="String" />
                                        <asp:Parameter Name="DiscussYr4" Type="String" />
                                        <asp:Parameter Name="DiscussYr5" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DiscussYr1" Type="String" />
                                        <asp:Parameter Name="DiscussYr2" Type="String" />
                                        <asp:Parameter Name="DiscussYr3" Type="String" />
                                        <asp:Parameter Name="DiscussYr4" Type="String" />
                                        <asp:Parameter Name="DiscussYr5" Type="String" />
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Discussions -->

                <!-- Begin Reccomendations -->
                <div id="reccomendationsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Reccomendations</h3>
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Reccomendations"
                                    data-content="Suggestions the committee made for the program to do in the future.">
                                    <i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <div class="modal-body">
                                <asp:ListView ID="reccomendationsView" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceReccomendations" InsertItemPosition="LastItem">
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

                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>Academic Year</strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <strong>Reccomendations</strong>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr1"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox ID="ReccomendYr1TextBox" runat="server" Text='<%# Bind("ReccomendYr1") %>' CssClass="form-control" TextMode="MultiLine" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr2"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox ID="ReccomendYr2TextBox" runat="server" Text='<%# Bind("ReccomendYr2") %>' CssClass="form-control" TextMode="MultiLine" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr3"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox ID="ReccomendYr3TextBox" runat="server" Text='<%# Bind("ReccomendYr3") %>' CssClass="form-control" TextMode="MultiLine" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr4"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox ID="ReccomendYr4TextBox" runat="server" Text='<%# Bind("ReccomendYr4") %>' CssClass="form-control" TextMode="MultiLine" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="container col-sm-6">
                                                <strong>
                                                    <%= Session["SessYr5"] %>
                                                </strong>
                                            </div>
                                            <div class="container col-sm-6">
                                                <asp:TextBox ID="ReccomendYr5TextBox" runat="server" Text='<%# Bind("ReccomendYr5") %>' CssClass="form-control" TextMode="MultiLine" />
                                            </div>
                                        </div>
                                        <!-- Begin Buttons -->
                                        <div class="row" style="margin-top: 1em;">
                                            <div class="form-group col-sm-12">
                                                <label class="col-sm-6 control-label">
                                                </label>
                                                <asp:Button CssClass="btn btn-warning" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">Cancel</button>
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
                                <asp:SqlDataSource ID="SqlDataSourceReccomendations" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [CommitteeData] WHERE [Id] = @Id" InsertCommand="INSERT INTO [CommitteeData] ([ReccomendYr1], [ReccomendYr2], [ReccomendYr3], [ReccomendYr4], [ReccomendYr5]) VALUES (@ReccomendYr1, @ReccomendYr2, @ReccomendYr3, @ReccomendYr4, @ReccomendYr5)" SelectCommand="SELECT [Id], [ReccomendYr1], [ReccomendYr2], [ReccomendYr3], [ReccomendYr4], [ReccomendYr5] FROM [CommitteeData] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [CommitteeData] SET [ReccomendYr1] = @ReccomendYr1, [ReccomendYr2] = @ReccomendYr2, [ReccomendYr3] = @ReccomendYr3, [ReccomendYr4] = @ReccomendYr4, [ReccomendYr5] = @ReccomendYr5 WHERE [Id] = @Id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="ReccomendYr1" Type="String" />
                                        <asp:Parameter Name="ReccomendYr2" Type="String" />
                                        <asp:Parameter Name="ReccomendYr3" Type="String" />
                                        <asp:Parameter Name="ReccomendYr4" Type="String" />
                                        <asp:Parameter Name="ReccomendYr5" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="ReccomendYr1" Type="String" />
                                        <asp:Parameter Name="ReccomendYr2" Type="String" />
                                        <asp:Parameter Name="ReccomendYr3" Type="String" />
                                        <asp:Parameter Name="ReccomendYr4" Type="String" />
                                        <asp:Parameter Name="ReccomendYr5" Type="String" />
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Reccomendations -->

                <!-- Begin File Upload -->
                <div id="fileUploadModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Attachments</h3>
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Attachments"
                                    data-content="Please upload the meeting notes over last five years.">
                                    <i class="glyphicon glyphicon-question-sign"></i></a>
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

<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="One.aspx.cs" Inherits="Rcc5yrProgRev.One" %>

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
            <li class="active"><a href="One.aspx">One</a></li>
            <li><a href="Two.aspx">Two</a></li>
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
                <asp:SqlDataSource ID="rccFacList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [Faculty] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))">
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList CssClass="form-control" ID="rccFacDDL" runat="server" DataSourceID="rccFacList" DataTextField="Name" DataValueField="ID" AutoPostBack="True"></asp:DropDownList>
                <div class="add-btn"><a href="#facAddModal" role="button" class="btn btn-success" data-toggle="modal">Add</a></div>

            </div>

            <div id="rccFocus" class="container col-sm-10">
                <fieldset>
                    <!-- Form Name -->
                    <legend>Faculty</legend>
                    <div class="col-sm-12">
                        <asp:Label ID="LabelAttachError" runat="server"></asp:Label>
                    </div>
                    <asp:SqlDataSource ID="rccFacData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Faculty] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Faculty] ([ProgramId], [ReviewYear], [Name], [FullTime], [Credentials], [CredentialDate], [CredentialInstitution], [Courses], [Affiliations], [StartDate], [EndDate], [LeadFaculty]) VALUES (@ProgramId, @ReviewYear, @Name, @FullTime, @Credentials, @CredentialDate, @CredentialInstitution, @Courses, @Affiliations, @StartDate, @EndDate, @LeadFaculty)" SelectCommand="SELECT [ID], [Name], [FullTime], [Credentials], [CredentialDate], [CredentialInstitution], [Courses], [Affiliations], [StartDate], [EndDate], [LeadFaculty] FROM [Faculty] WHERE ([ID] = @ID)" UpdateCommand="UPDATE [Faculty] SET [Name] = @Name, [FullTime] = @FullTime, [Credentials] = @Credentials, [CredentialDate] = @CredentialDate, [CredentialInstitution] = @CredentialInstitution, [Courses] = @Courses, [Affiliations] = @Affiliations, [StartDate] = @StartDate, [EndDate] = @EndDate, [LeadFaculty] = @LeadFaculty WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="FullTime" Type="Boolean" />
                            <asp:Parameter Name="Credentials" Type="String" />
                            <asp:Parameter DbType="Date" Name="CredentialDate" />
                            <asp:Parameter Name="CredentialInstitution" Type="String" />
                            <asp:Parameter Name="Courses" Type="String" />
                            <asp:Parameter Name="Affiliations" Type="String" />
                            <asp:Parameter DbType="Date" Name="StartDate" />
                            <asp:Parameter DbType="Date" Name="EndDate" />
                            <asp:Parameter Name="LeadFaculty" Type="Boolean" />
                            <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                            <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="rccFacDDL" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="FullTime" Type="Boolean" />
                            <asp:Parameter Name="Credentials" Type="String" />
                            <asp:Parameter DbType="Date" Name="CredentialDate" />
                            <asp:Parameter Name="CredentialInstitution" Type="String" />
                            <asp:Parameter Name="Courses" Type="String" />
                            <asp:Parameter Name="Affiliations" Type="String" />
                            <asp:Parameter DbType="Date" Name="StartDate" />
                            <asp:Parameter DbType="Date" Name="EndDate" />
                            <asp:Parameter Name="LeadFaculty" Type="Boolean" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="RccFacView" runat="server" DataKeyNames="ID" DataSourceID="rccFacData" InsertItemPosition="LastItem">
                        <AlternatingItemTemplate>

                            <!-- Begin Name -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Name
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" placeholder="First Last" ID="NameTextBox" runat="server" 
                                        Text='<%# Bind("Name") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Name -->

                            <!-- Begin FullTime -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Full-time
                                </label>
                                <div class="checkbox input-group col-sm-4">
                                    <asp:CheckBox ID="FullTimeCheckBox" runat="server" 
                                        Checked='<%# Bind("FullTime") %>' Text="Yes" Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End FullTime -->

                            <!-- Begin Credentials -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Credentials
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialsTextBox" runat="server" 
                                        Text='<%# Bind("Credentials") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Credentials" 
                                    data-content="Please list the highest credential related to the position the instructor is teaching.  For example, if an instructor holds a Bachelor’s in Mechanical Engineering and a Master’s in Religion and they are teaching in Mechanical Engineering, please put the Mechanical Engineering degree down because that is the degree relevant to the position." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Credentials -->

                            <!-- Begin CredentialDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialDateTextBox" runat="server" 
                                        Text='<%# Bind("CredentialDate") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Date" 
                                    data-content="This is the date the credentials were awarded. Please put the date in the following format MM/DD/YYYY" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End CredentialDate -->

                            <!-- Begin CredentialInstitution -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Institution
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialInstitutionTextBox" runat="server" 
                                        Text='<%# Bind("CredentialInstitution") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Institution" 
                                    data-content="The college/university which awarded the credentials" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End CredentialInstitution -->

                            <!-- Begin Courses -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Courses
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CoursesTextBox" runat="server" 
                                        Text='<%# Bind("Courses") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Course" 
                                    data-content="These are the courses in which the instructor teaches related to the credential identified for the program you are completed the five year program review." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Courses -->

                            <!-- Begin Affiliations -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Affiliations
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="AffiliationsTextBox" runat="server" 
                                        Text='<%# Bind("Affiliations") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Affiliations" 
                                    data-content="These are professional memberships, etc. which are related to the program in which they are an instructor." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Affiliations -->

                            <!-- Begin StartDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Start Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="StartDateTextBox" runat="server" 
                                        Text='<%# Bind("StartDate") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Start Date" 
                                    data-content="This is the date in which the instructor began teaching in the program being reviewed. Please put the date in the following format MM/DD/YYYY." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End StartDate -->

                            <!-- Begin EndDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    End Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="EndDateTextBox" runat="server" 
                                        Text='<%# Bind("EndDate") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="End Date" 
                                    data-content="This is the date in which the instructor stopped teaching in the program being reviewed. If they are still teaching in the program, please leave blank. Please put the date in the following format MM/DD/YYYY." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Name -->

                            <!-- Begin LeadFaculty -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Lead Faculty
                                </label>
                                <div class="checkbox input-group col-sm-4">
                                    <asp:CheckBox ID="LeadFacultyCheckBox" runat="server" Checked='<%# Bind("LeadFaculty") %>' 
                                        Text="Yes" Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End LeadFaculty -->

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

                            <!-- Begin Name -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Name
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" placeholder="First Last" ID="NameTextBox" runat="server" 
                                        Text='<%# Bind("Name") %>' />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Name -->

                            <!-- Begin FullTime -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Full-time
                                </label>
                                <div class="checkbox input-group col-sm-4">
                                    <asp:CheckBox ID="FullTimeCheckBox" runat="server" 
                                        Checked='<%# Bind("FullTime") %>' Text="Yes" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End FullTime -->

                            <!-- Begin Credentials -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Credentials
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialsTextBox" runat="server" 
                                        Text='<%# Bind("Credentials") %>' />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Credentials" 
                                    data-content="Please list the highest credential related to the position the instructor is teaching.  For example, if an instructor holds a Bachelor’s in Mechanical Engineering and a Master’s in Religion and they are teaching in Mechanical Engineering, please put the Mechanical Engineering degree down because that is the degree relevant to the position." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Credentials -->

                            <!-- Begin CredentialDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialDateTextBox" runat="server" 
                                        Text='<%# Bind("CredentialDate") %>' />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Date" 
                                    data-content="This is the date the credentials were awarded. Please put the date in the following format MM/DD/YYYY" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End CredentialDate -->

                            <!-- Begin CredentialInstitution -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Institution
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialInstitutionTextBox" runat="server" 
                                        Text='<%# Bind("CredentialInstitution") %>' />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Institution" 
                                    data-content="The college/university which awarded the credentials" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End CredentialInstitution -->

                            <!-- Begin Courses -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Courses
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CoursesTextBox" runat="server" 
                                        Text='<%# Bind("Courses") %>' />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Course" 
                                    data-content="These are the courses in which the instructor teaches related to the credential identified for the program you are completed the five year program review." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Courses -->

                            <!-- Begin Affiliations -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Affiliations
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="AffiliationsTextBox" runat="server" 
                                        Text='<%# Bind("Affiliations") %>' />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Affiliations" 
                                    data-content="These are professional memberships, etc. which are related to the program in which they are an instructor." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Affiliations -->

                            <!-- Begin StartDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Start Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="StartDateTextBox" runat="server" 
                                        Text='<%# Bind("StartDate") %>' />
                                    <span class="input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Start Date" 
                                    data-content="This is the date in which the instructor began teaching in the program being reviewed. Please put the date in the following format MM/DD/YYYY." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End StartDate -->

                            <!-- Begin EndDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    End Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="EndDateTextBox" runat="server" 
                                        Text='<%# Bind("EndDate") %>' />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="End Date" 
                                    data-content="This is the date in which the instructor stopped teaching in the program being reviewed. If they are still teaching in the program, please leave blank. Please put the date in the following format MM/DD/YYYY." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Name -->

                            <!-- Begin LeadFaculty -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Lead Faculty
                                </label>
                                <div class="checkbox input-group col-sm-4">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("LeadFaculty") %>' 
                                        Text="Yes" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End LeadFaculty -->

                            <!-- Begin Buttons -->
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">

                                </label>
                                <asp:Button CssClass="btn btn-warning" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button CssClass="btn btn-success" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </div>
                            <!-- End Buttons -->
                                
                        </EditItemTemplate>
                        <EmptyDataTemplate>

                            Error! No data.

                        </EmptyDataTemplate>
                        <InsertItemTemplate>

                            <!-- Begin Insert Modal -->
                            <div id="facAddModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h3 id="myModalLabel">Add Faculty</h3>
                                </div>
                                <div class="modal-body">

                                    <!-- Begin Name -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            Name
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" placeholder="First Last" ID="NameTextBox" runat="server" 
                                                Text='<%# Bind("Name") %>' />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="hidden col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="title" 
                                            data-content="content" 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End Name -->

                                    <!-- Begin FullTime -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            Full-time
                                        </label>
                                        <div class="checkbox input-group col-sm-4">
                                            <asp:CheckBox ID="FullTimeCheckBox" runat="server" 
                                                Checked='<%# Bind("FullTime") %>' Text="Yes" />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="hidden col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="title" 
                                            data-content="content" 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End FullTime -->

                                    <!-- Begin Credentials -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            Credentials
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="CredentialsTextBox" runat="server" 
                                                Text='<%# Bind("Credentials") %>' />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="Credentials" 
                                            data-content="Please list the highest credential related to the position the instructor is teaching.  For example, if an instructor holds a Bachelor’s in Mechanical Engineering and a Master’s in Religion and they are teaching in Mechanical Engineering, please put the Mechanical Engineering degree down because that is the degree relevant to the position." 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End Credentials -->

                                    <!-- Begin CredentialDate -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            Date
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="CredentialDateTextBox" runat="server" 
                                                Text='<%# Bind("CredentialDate") %>' />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="Date" 
                                            data-content="This is the date the credentials were awarded. Please put the date in the following format MM/DD/YYYY" 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End CredentialDate -->

                                    <!-- Begin CredentialInstitution -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            Institution
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="CredentialInstitutionTextBox" runat="server" 
                                                Text='<%# Bind("CredentialInstitution") %>' />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="Institution" 
                                            data-content="The college/university which awarded the credentials" 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End CredentialInstitution -->

                                    <!-- Begin Courses -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            Courses
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="CoursesTextBox" runat="server" 
                                                Text='<%# Bind("Courses") %>' />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="Course" 
                                            data-content="These are the courses in which the instructor teaches related to the credential identified for the program you are completed the five year program review." 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End Courses -->

                                    <!-- Begin Affiliations -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            Affiliations
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="AffiliationsTextBox" runat="server" 
                                                Text='<%# Bind("Affiliations") %>' />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="Affiliations" 
                                            data-content="These are professional memberships, etc. which are related to the program in which they are an instructor." 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End Affiliations -->

                                    <!-- Begin StartDate -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            Start Date
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="StartDateTextBox" runat="server" 
                                                Text='<%# Bind("StartDate") %>' />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="Start Date" 
                                            data-content="This is the date in which the instructor began teaching in the program being reviewed. Please put the date in the following format MM/DD/YYYY." 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End StartDate -->

                                    <!-- Begin EndDate -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            End Date
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="EndDateTextBox" runat="server" 
                                                Text='<%# Bind("EndDate") %>' />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="End Date" 
                                            data-content="This is the date in which the instructor stopped teaching in the program being reviewed. If they are still teaching in the program, please leave blank. Please put the date in the following format MM/DD/YYYY." 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End EndDate -->

                                    <!-- Begin LeadFaculty -->
                                    <div class="form-group col-sm-8">
                                        <label class="col-sm-4 control-label">
                                            Lead Faculty
                                        </label>
                                        <div class="checkbox input-group col-sm-4">
                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("LeadFaculty") %>' 
                                                Text="Yes" />
                                            <span class="hidden input-group-addon">append</span>
                                        </div>
                                    </div>
                                    <div class="hidden col-sm-2">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="title" 
                                            data-content="content" 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End LeadFaculty -->

                                    <!-- Begin Buttons -->
                                    <div class="form-group col-sm-10">
                                        <label class="col-sm-4 control-label"></label>
                                        <asp:Button CssClass="btn btn-success"  ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <button type="button" class="btn btn-warning" data-dismiss="modal" aria-hidden="true">Cancel</button>
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

                            <!-- Begin Name -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Name
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" placeholder="First Last" ID="NameTextBox" runat="server" 
                                        Text='<%# Bind("Name") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Name -->

                            <!-- Begin FullTime -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Full-time
                                </label>
                                <div class="checkbox input-group col-sm-4">
                                    <asp:CheckBox ID="FullTimeCheckBox" runat="server" 
                                        Checked='<%# Bind("FullTime") %>' Text="Yes" Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End FullTime -->

                            <!-- Begin Credentials -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Credentials
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialsTextBox" runat="server" 
                                        Text='<%# Bind("Credentials") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Credentials" 
                                    data-content="Please list the highest credential related to the position the instructor is teaching.  For example, if an instructor holds a Bachelor’s in Mechanical Engineering and a Master’s in Religion and they are teaching in Mechanical Engineering, please put the Mechanical Engineering degree down because that is the degree relevant to the position." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Credentials -->

                            <!-- Begin CredentialDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialDateTextBox" runat="server" 
                                        Text='<%# Bind("CredentialDate") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Date" 
                                    data-content="This is the date the credentials were awarded. Please put the date in the following format MM/DD/YYYY" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End CredentialDate -->

                            <!-- Begin CredentialInstitution -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Institution
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialInstitutionTextBox" runat="server" 
                                        Text='<%# Bind("CredentialInstitution") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Institution" 
                                    data-content="The college/university which awarded the credentials" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End CredentialInstitution -->

                            <!-- Begin Courses -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Courses
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CoursesTextBox" runat="server" 
                                        Text='<%# Bind("Courses") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Course" 
                                    data-content="These are the courses in which the instructor teaches related to the credential identified for the program you are completed the five year program review." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Courses -->

                            <!-- Begin Affiliations -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Affiliations
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="AffiliationsTextBox" runat="server" 
                                        Text='<%# Bind("Affiliations") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Affiliations" 
                                    data-content="These are professional memberships, etc. which are related to the program in which they are an instructor." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Affiliations -->

                            <!-- Begin StartDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Start Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="StartDateTextBox" runat="server" 
                                        Text='<%# Bind("StartDate") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Start Date" 
                                    data-content="This is the date in which the instructor began teaching in the program being reviewed. Please put the date in the following format MM/DD/YYYY." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End StartDate -->

                            <!-- Begin EndDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    End Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="EndDateTextBox" runat="server" 
                                        Text='<%# Bind("EndDate") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="End Date" 
                                    data-content="This is the date in which the instructor stopped teaching in the program being reviewed. If they are still teaching in the program, please leave blank. Please put the date in the following format MM/DD/YYYY." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Name -->

                            <!-- Begin LeadFaculty -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Lead Faculty
                                </label>
                                <div class="checkbox input-group col-sm-4">
                                    <asp:CheckBox ID="LeadFacultyCheckBox" runat="server" Checked='<%# Bind("LeadFaculty") %>' 
                                        Text="Yes" Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End LeadFaculty -->

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

                                <div class="container" id="itemPlaceholderContainer" runat="server">
                                    <div id="itemPlaceholder" runat="server"></div>
                                </div>

                        </LayoutTemplate>
                        <SelectedItemTemplate>

                            <!-- Begin Name -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Name
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" placeholder="First Last" ID="NameTextBox" runat="server" 
                                        Text='<%# Bind("Name") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Name -->

                            <!-- Begin FullTime -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Full-time
                                </label>
                                <div class="checkbox input-group col-sm-4">
                                    <asp:CheckBox ID="FullTimeCheckBox" runat="server" 
                                        Checked='<%# Bind("FullTime") %>' Text="Yes" Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End FullTime -->

                            <!-- Begin Credentials -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Credentials
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialsTextBox" runat="server" 
                                        Text='<%# Bind("Credentials") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Credentials" 
                                    data-content="Please list the highest credential related to the position the instructor is teaching.  For example, if an instructor holds a Bachelor’s in Mechanical Engineering and a Master’s in Religion and they are teaching in Mechanical Engineering, please put the Mechanical Engineering degree down because that is the degree relevant to the position." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Credentials -->

                            <!-- Begin CredentialDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialDateTextBox" runat="server" 
                                        Text='<%# Bind("CredentialDate") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Date" 
                                    data-content="This is the date the credentials were awarded. Please put the date in the following format MM/DD/YYYY" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End CredentialDate -->

                            <!-- Begin CredentialInstitution -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Institution
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CredentialInstitutionTextBox" runat="server" 
                                        Text='<%# Bind("CredentialInstitution") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Institution" 
                                    data-content="The college/university which awarded the credentials" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End CredentialInstitution -->

                            <!-- Begin Courses -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Courses
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="CoursesTextBox" runat="server" 
                                        Text='<%# Bind("Courses") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Course" 
                                    data-content="These are the courses in which the instructor teaches related to the credential identified for the program you are completed the five year program review." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Courses -->

                            <!-- Begin Affiliations -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Affiliations
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="AffiliationsTextBox" runat="server" 
                                        Text='<%# Bind("Affiliations") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Affiliations" 
                                    data-content="These are professional memberships, etc. which are related to the program in which they are an instructor." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End Affiliations -->

                            <!-- Begin StartDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Start Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="StartDateTextBox" runat="server" 
                                        Text='<%# Bind("StartDate") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="Start Date" 
                                    data-content="This is the date in which the instructor began teaching in the program being reviewed. Please put the date in the following format MM/DD/YYYY." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End StartDate -->

                            <!-- Begin EndDate -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    End Date
                                </label>
                                <div class="input-group col-sm-4">
                                    <asp:TextBox CssClass="form-control" ID="EndDateTextBox" runat="server" 
                                        Text='<%# Bind("EndDate") %>' Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="End Date" 
                                    data-content="This is the date in which the instructor stopped teaching in the program being reviewed. If they are still teaching in the program, please leave blank. Please put the date in the following format MM/DD/YYYY." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End EndDate -->

                            <!-- Begin LeadFaculty -->
                            <div class="form-group col-sm-8">
                                <label class="col-sm-4 control-label">
                                    Lead Faculty
                                </label>
                                <div class="checkbox input-group col-sm-4">
                                    <asp:CheckBox ID="LeadFacultyCheckBox" runat="server" Checked='<%# Bind("LeadFaculty") %>' 
                                        Text="Yes" Enabled="False" />
                                    <span class="hidden input-group-addon">append</span>
                                </div>
                            </div>
                            <div class="hidden col-sm-2">
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                    title="title" 
                                    data-content="content" 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <!-- End LeadFaculty -->

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
                    <div class="form-group row col-sm-12">
                        <label class="col-sm-4 control-label" for="moreButton">More</label>
                        <div>
                        <a href="#workloadEditModal" role="button" class="btn btn-primary" data-toggle="modal">Workload</a>
                        <a href="#commitmentsEditModal" role="button" class="btn btn-primary" data-toggle="modal">Commitments</a>
                        <a href="#fileUploadModal" role="button" class="btn btn-primary" data-toggle="modal">Attachments</a>
                        </div>
                    </div>

                    <!-- Begin Edit Workload -->
                    <div id="workloadEditModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Workload</h3>
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Workload" 
                                    data-content="Total sections taught each year and the total number of students taught each year." 
                                    ><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <div class="modal-body">

                            <asp:SqlDataSource ID="RccFacWorkload" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Faculty] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Faculty] ([SectionsYr1], [StudentsYr1], [SectionsYr2], [StudentsYr2], [SectionsYr3], [StudentsYr3], [SectionsYr4], [StudentsYr4], [SectionsYr5], [StudentsYr5]) VALUES (@SectionsYr1, @StudentsYr1, @SectionsYr2, @StudentsYr2, @SectionsYr3, @StudentsYr3, @SectionsYr4, @StudentsYr4, @SectionsYr5, @StudentsYr5)" SelectCommand="SELECT [ID], [SectionsYr1], [StudentsYr1], [SectionsYr2], [StudentsYr2], [SectionsYr3], [StudentsYr3], [SectionsYr4], [StudentsYr4], [SectionsYr5], [StudentsYr5] FROM [Faculty] WHERE ([ID] = @ID)" UpdateCommand="UPDATE [Faculty] SET [SectionsYr1] = @SectionsYr1, [StudentsYr1] = @StudentsYr1, [SectionsYr2] = @SectionsYr2, [StudentsYr2] = @StudentsYr2, [SectionsYr3] = @SectionsYr3, [StudentsYr3] = @StudentsYr3, [SectionsYr4] = @SectionsYr4, [StudentsYr4] = @StudentsYr4, [SectionsYr5] = @SectionsYr5, [StudentsYr5] = @StudentsYr5 WHERE [ID] = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="SectionsYr1" Type="String" />
                                    <asp:Parameter Name="StudentsYr1" Type="String" />
                                    <asp:Parameter Name="SectionsYr2" Type="String" />
                                    <asp:Parameter Name="StudentsYr2" Type="String" />
                                    <asp:Parameter Name="SectionsYr3" Type="String" />
                                    <asp:Parameter Name="StudentsYr3" Type="String" />
                                    <asp:Parameter Name="SectionsYr4" Type="String" />
                                    <asp:Parameter Name="StudentsYr4" Type="String" />
                                    <asp:Parameter Name="SectionsYr5" Type="String" />
                                    <asp:Parameter Name="StudentsYr5" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="rccFacDDL" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="SectionsYr1" Type="String" />
                                    <asp:Parameter Name="StudentsYr1" Type="String" />
                                    <asp:Parameter Name="SectionsYr2" Type="String" />
                                    <asp:Parameter Name="StudentsYr2" Type="String" />
                                    <asp:Parameter Name="SectionsYr3" Type="String" />
                                    <asp:Parameter Name="StudentsYr3" Type="String" />
                                    <asp:Parameter Name="SectionsYr4" Type="String" />
                                    <asp:Parameter Name="StudentsYr4" Type="String" />
                                    <asp:Parameter Name="SectionsYr5" Type="String" />
                                    <asp:Parameter Name="StudentsYr5" Type="String" />
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" DataSourceID="RccFacWorkload">
                                <AlternatingItemTemplate>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                Error! No Data.
                                </EmptyDataTemplate>
                                <InsertItemTemplate>
                                </InsertItemTemplate>
                                <ItemTemplate>

                                    <div class="row">
                                        <!-- Begin SectionsYr1 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                                <%: Session["SessYr1"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="SectionsYr1TextBox" runat="server" 
                                                    Text='<%# Bind("SectionsYr1") %>' />
                                                <span class="input-group-addon">Sections</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End SectionsYr1 -->

                                        <!-- Begin StudentsYr1 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                            
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="StudentsYr1TextBox" runat="server" 
                                                    Text='<%# Bind("StudentsYr1") %>' />
                                                <span class="input-group-addon">Students</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End StudentsYr1 -->

                                        <!-- Begin SectionsYr2 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                                <%: Session["SessYr2"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="SectionsYr2TextBox" runat="server" 
                                                    Text='<%# Bind("SectionsYr2") %>' />
                                                <span class="input-group-addon">Sections</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End SectionsYr2 -->

                                        <!-- Begin StudentsYr2 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                            
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="StudentsYr2TextBox" runat="server" 
                                                    Text='<%# Bind("StudentsYr2") %>' />
                                                <span class="input-group-addon">Students</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End StudentsYr2 -->

                                        <!-- Begin SectionsY3 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                                <%: Session["SessYr3"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="SectionsYr3TextBox" runat="server" 
                                                    Text='<%# Bind("SectionsYr3") %>' />
                                                <span class="input-group-addon">Sections</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End SectionsYr3 -->

                                        <!-- Begin StudentsYr3 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                            
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="StudentsYr3TextBox" runat="server" 
                                                    Text='<%# Bind("StudentsYr3") %>' />
                                                <span class="input-group-addon">Students</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End StudentsYr3 -->

                                        <!-- Begin SectionsY4 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                                <%: Session["SessYr4"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="SectionsYr4TextBox" runat="server" 
                                                    Text='<%# Bind("SectionsYr4") %>' />
                                                <span class="input-group-addon">Sections</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End SectionsYr4 -->

                                        <!-- Begin StudentsYr4 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                            
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="StudentsYr4TextBox" runat="server" 
                                                    Text='<%# Bind("StudentsYr4") %>' />
                                                <span class="input-group-addon">Students</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End StudentsYr4 -->

                                        <!-- Begin SectionsYr5 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                                <%: Session["SessYr5"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="SectionsYr5TextBox" runat="server" 
                                                    Text='<%# Bind("SectionsYr5") %>' />
                                                <span class="input-group-addon">Sections</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End SectionsYr5 -->

                                        <!-- Begin StudentsYr5 -->
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">
                                            
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="StudentsYr5TextBox" runat="server" 
                                                    Text='<%# Bind("StudentsYr5") %>' />
                                                <span class="input-group-addon">Students</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-4">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title" 
                                                data-content="content" 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End StudentsYr5 -->

                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label class="col-sm-4 control-label"></label>
                                                <asp:Button CssClass="btn btn-warning" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                            </div>
                                        </div>
                                        <!-- End Buttons -->
                                    </div>

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
                    <!-- End Edit Workload -->

                    <!-- Begin Edit Commitments -->
                    <div id="commitmentsEditModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Commitments</h3>
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                                title="Commitments" 
                                                data-content="Advisees, committees, special projects, and other work-related items the instructor has participated in outside of the classroom." 
                                                ><i class="glyphicon glyphicon-question-sign"></i></a>

                        </div>
                        <div class="modal-body">
                            <asp:SqlDataSource ID="rccFacCommitments" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Faculty] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Faculty] ([Advisees], [Committees], [SpecialProjects], [Other]) VALUES (@Advisees, @Committees, @SpecialProjects, @Other)" SelectCommand="SELECT [ID], [Advisees], [Committees], [SpecialProjects], [Other] FROM [Faculty] WHERE ([ID] = @ID)" UpdateCommand="UPDATE [Faculty] SET [Advisees] = @Advisees, [Committees] = @Committees, [SpecialProjects] = @SpecialProjects, [Other] = @Other WHERE [ID] = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Advisees" Type="String" />
                                    <asp:Parameter Name="Committees" Type="String" />
                                    <asp:Parameter Name="SpecialProjects" Type="String" />
                                    <asp:Parameter Name="Other" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="rccFacDDL" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Advisees" Type="String" />
                                    <asp:Parameter Name="Committees" Type="String" />
                                    <asp:Parameter Name="SpecialProjects" Type="String" />
                                    <asp:Parameter Name="Other" Type="String" />
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="rccFacCommitments">
                                <AlternatingItemTemplate>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    Error! No data.
                                </EmptyDataTemplate>
                                <InsertItemTemplate>
                                </InsertItemTemplate>
                                <ItemTemplate>

                                    <!-- Begin Advisees -->
                                    <div class="form-group col-sm-12">
                                        <label class="col-sm-4 control-label">
                                            Advisees
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="AdviseesLabel" runat="server" 
                                                Text='<%# Bind("Advisees") %>' />
                                            <span class="hidden input-group-addon">Apended</span>
                                        </div>
                                    </div>
                                    <div class="hidden col-sm-4">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="title" 
                                            data-content="content" 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End Advisees -->

                                    <!-- Begin Committees -->
                                    <div class="form-group col-sm-12">
                                        <label class="col-sm-4 control-label">
                                            Committees
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="CommitteesLabel" runat="server" 
                                                Text='<%# Bind("Committees") %>' />
                                            <span class="hidden input-group-addon">Apended</span>
                                        </div>
                                    </div>
                                    <div class="hidden col-sm-4">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="title" 
                                            data-content="content" 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End Committees -->

                                    <!-- Begin SpecialProjects -->
                                    <div class="form-group col-sm-12">
                                        <label class="col-sm-4 control-label">
                                            Special Projects
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="SpecialProjectsLabel" runat="server" 
                                                Text='<%# Bind("SpecialProjects") %>' />
                                            <span class="hidden input-group-addon">Apended</span>
                                        </div>
                                    </div>
                                    <div class="hidden col-sm-4">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="title" 
                                            data-content="content" 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End SpecialProjects -->

                                    <!-- Begin Other -->
                                    <div class="form-group col-sm-12">
                                        <label class="col-sm-4 control-label">
                                            Other
                                        </label>
                                        <div class="input-group col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="OtherLabel" runat="server" 
                                                Text='<%# Bind("Other") %>' />
                                            <span class="hidden input-group-addon">Apended</span>
                                        </div>
                                    </div>
                                    <div class="hidden col-sm-4">
                                        <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                            title="title" 
                                            data-content="content" 
                                            ><i class="glyphicon glyphicon-question-sign"></i></a>
                                    </div>
                                    <!-- End Other -->

                                    <!-- Begin Buttons -->
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4 control-label">

                                            </label>
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
                    <!-- End Edit Commitments -->


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

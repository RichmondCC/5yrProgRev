<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="Seven.aspx.cs" Inherits="Rcc5yrProgRev.Seven" %>

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
                    <li class="active"><a href="Seven.aspx">Seven</a></li>
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
            <p>Accreditation</p>
            <p>
                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                    title="Accreditation, Approval and Licensing"
                    data-content='If your program is thinking about, been asked to get, or has to have accreditation from an outside professional organization or licensing board, please add them here.  If not, please complete the "Expenditures" section.'>
                    <i class="glyphicon glyphicon-question-sign"></i></a>
            </p>

            <asp:DropDownList ID="DropDownListEntity" runat="server" DataSourceID="SqlDataSourceEntity" DataTextField="Entity" DataValueField="Id"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceEntity" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Entity] FROM [AccredEntities] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                    <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="add-btn">
                <br />
                <a href="#EntityModal" role="button" class="btn btn-success" data-toggle="modal">Add</a>
            </div>

        </div>

        <div id="rccFocus" class="container col-sm-10">
            <fieldset>

                <!-- Form Name -->
                <!--legend>Accreditation/Licensing and Needs and Estimated Costs for Proposed Program Changes</!--legend-->
                <div class="col-sm-12">
                    <asp:Label ID="LabelAttachError" runat="server"></asp:Label>
                </div>
                <asp:ListView ID="ListViewAccred" runat="server" DataSourceID="SqlDataSourceAccred" DataKeyNames="Id" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <!-- Begin New -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                New credential?
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("New") %>' Text="Yes" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End New -->

                        <!-- Begin Entity -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Accrediting Entity
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EntityTextBox" runat="server" Text='<%# Bind("Entity") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Accrediting Entity"
                                data-content="Please type in the full name of the organization."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Entity -->

                        <!-- Begin Renewal -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Renewal Date
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="RenewalTextBox" runat="server" Text='<%# Bind("Renewal") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Renewal Date"
                                data-content="Please provide if you are currently accredited."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Renewal -->

                        <!-- Begin Expenses -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Annual Expenses
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ExpensesTextBox" runat="server" Text='<%# Bind("Expenses") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Annual Expenses"
                                data-content="These are only the expense related to acquiring and maintaining the accreditation"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Expenses -->

                        <!-- Begin Faculty -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Faculty Representative
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="FacultyTextBox" runat="server" Text='<%# Bind("Faculty") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Faculty Representative"
                                data-content="Who is the contact person for the accreditation?"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Faculty -->

                        <!-- Begin Visits -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Site Visits
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="VisitsTextBox" runat="server" Text='<%# Bind("Visits") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Site Visits"
                                data-content="How often is the accrediting body required to visit the College/Program?"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Visits -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-7">
                                <label class="col-sm-3 control-label"></label>

                                <asp:Button CssClass="btn btn-warning" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button CssClass="btn btn-success" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />

                            </div>
                        </div>
                        <!-- End Buttons -->

                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <!-- Begin EntityModal -->
                        <div id="EntityModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h3 id="myModalLabel">Attachments</h3>
                                    </div>
                                    <div class="modal-body">

                                        <!-- Begin New -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                New credential?
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("New") %>' Text="Yes" />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End New -->

                                        <!-- Begin Entity -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Accrediting Entity
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="EntityTextBox" runat="server" Text='<%# Bind("Entity") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Accrediting Entity"
                                                data-content="Please type in the full name of the organization."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Entity -->

                                        <!-- Begin Renewal -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Renewal Date
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="RenewalTextBox" runat="server" Text='<%# Bind("Renewal") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Renewal Date"
                                                data-content="Please provide if you are currently accredited."><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Renewal -->

                                        <!-- Begin Expenses -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Annual Expenses
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="ExpensesTextBox" runat="server" Text='<%# Bind("Expenses") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Annual Expenses"
                                                data-content="These are only the expense related to acquiring and maintaining the accreditation"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Expenses -->

                                        <!-- Begin Faculty -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Faculty Representative
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="FacultyTextBox" runat="server" Text='<%# Bind("Faculty") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Faculty Representative"
                                                data-content="Who is the contact person for the accreditation?"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Faculty -->

                                        <!-- Begin Visits -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                Site Visits
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="VisitsTextBox" runat="server" Text='<%# Bind("Visits") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="Site Visits"
                                                data-content="How often is the accrediting body required to visit the College/Program?"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End Visits -->

                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-7">
                                                <label class="col-sm-3 control-label"></label>

                                                <asp:Button CssClass="btn btn-warning" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                <asp:Button CssClass="btn btn-success" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />

                                            </div>
                                        </div>
                                        <!-- End Buttons -->



                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End EntityModal -->

                    </InsertItemTemplate>
                    <ItemTemplate>

                        <!-- Begin New -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                New credential?
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("New") %>' Text="Yes" Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End New -->

                        <!-- Begin Entity -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Accrediting Entity
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="EntityTextBox" runat="server" Text='<%# Bind("Entity") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Accrediting Entity"
                                data-content="Please type in the full name of the organization."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Entity -->

                        <!-- Begin Renewal -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Renewal Date
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="RenewalTextBox" runat="server" Text='<%# Bind("Renewal") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Renewal Date"
                                data-content="Please provide if you are currently accredited."><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Renewal -->

                        <!-- Begin Expenses -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Annual Expenses
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ExpensesTextBox" runat="server" Text='<%# Bind("Expenses") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Annual Expenses"
                                data-content="These are only the expense related to acquiring and maintaining the accreditation"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Expenses -->

                        <!-- Begin Faculty -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Faculty Representative
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="FacultyTextBox" runat="server" Text='<%# Bind("Faculty") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Faculty Representative"
                                data-content="Who is the contact person for the accreditation?"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Faculty -->

                        <!-- Begin Visits -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Site Visits
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="VisitsTextBox" runat="server" Text='<%# Bind("Visits") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="Site Visits"
                                data-content="How often is the accrediting body required to visit the College/Program?"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Visits -->

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
                        <legend>Accreditation / Licensing</legend>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server"></div>
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourceAccred" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AccredEntities] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AccredEntities] ([ProgramId], [ReviewYear], [New], [Entity], [Renewal], [Expenses], [Faculty], [Visits]) VALUES (@ProgramID, @ReviewYear, @New, @Entity, @Renewal, @Expenses, @Faculty, @Visits)" SelectCommand="SELECT [Id], [New], [Entity], [Renewal], [Expenses], [Faculty], [Visits] FROM [AccredEntities] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [AccredEntities] SET [New] = @New, [Entity] = @Entity, [Renewal] = @Renewal, [Expenses] = @Expenses, [Faculty] = @Faculty, [Visits] = @Visits WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="New" Type="Boolean" />
                        <asp:Parameter Name="Entity" Type="String" />
                        <asp:Parameter Name="Renewal" Type="String" />
                        <asp:Parameter Name="Expenses" Type="String" />
                        <asp:Parameter Name="Faculty" Type="String" />
                        <asp:Parameter Name="Visits" Type="String" />
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListEntity" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="New" Type="Boolean" />
                        <asp:Parameter Name="Entity" Type="String" />
                        <asp:Parameter Name="Renewal" Type="String" />
                        <asp:Parameter Name="Expenses" Type="String" />
                        <asp:Parameter Name="Faculty" Type="String" />
                        <asp:Parameter Name="Visits" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <legend>Needs and Estimated Costs for Proposed Program Changes</legend>
                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                    title="Budget"
                    data-content="What are your needed budget items over the next three years in personnel, software, instructional supports, etc.?">
                    <i class="glyphicon glyphicon-question-sign"></i></a>
                <asp:ListView ID="ListViewBudget" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceBudget">
                    <AlternatingItemTemplate>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>

                        <!-- Begin Plan -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Plan
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="PlanTextBox" runat="server" Text='<%# Bind("Plan") %>' />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Plan -->

                        <!-- Begin NeedYr1 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                <%: Session["SessYr6"] %>
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("NeedYr1") %>' />
                                <span class="input-group-addon">Need</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End NeedYr1 -->

                        <!-- Begin CostYr1 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("CostY1") %>' />
                                <span class="input-group-addon">Cost</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End CostYr1 -->

                        <!-- Begin PriorityYr1 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="DDLYr1" SelectedValue='<%# Bind("PriorityY1") %>'>
                                    <asp:ListItem Text="<< Select >>" Value="<< Select >>"></asp:ListItem>
                                    <asp:ListItem Text="Need" Value="Need"></asp:ListItem>
                                    <asp:ListItem Text="Improve" Value="Improve"></asp:ListItem>
                                    <asp:ListItem Text="Extra" Value="Extra"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">Priority</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End PriorityYr1 -->

                        <!-- Begin NeedYr2 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                <%: Session["SessYr7"] %>
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("NeedYr2") %>' />
                                <span class="input-group-addon">Need</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End NeedYr2 -->

                        <!-- Begin CostYr2 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("CostY2") %>' />
                                <span class="input-group-addon">Cost</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End CostYr2 -->

                        <!-- Begin PriorityYr2 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="DDLYr2" SelectedValue='<%# Bind("PriorityY2") %>'>
                                    <asp:ListItem Text="<< Select >>" Value="<< Select >>"></asp:ListItem>
                                    <asp:ListItem Text="Need" Value="Need"></asp:ListItem>
                                    <asp:ListItem Text="Improve" Value="Improve"></asp:ListItem>
                                    <asp:ListItem Text="Extra" Value="Extra"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">Priority</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End PriorityYr2 -->

                        <!-- Begin NeedYr3 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                <%: Session["SessYr8"] %>
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBoxNeedYr3" runat="server" Text='<%# Bind("NeedYr3") %>' />
                                <span class="input-group-addon">Need</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End NeedYr3 -->

                        <!-- Begin CostY3 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBoxCostY3" runat="server" Text='<%# Bind("CostY3") %>' />
                                <span class="input-group-addon">Cost</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End CostY3 -->

                        <!-- Begin PriorityY3 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="DDLYr3" SelectedValue='<%# Bind("PriorityY3") %>'>
                                    <asp:ListItem Text="<< Select >>" Value="<< Select >>"></asp:ListItem>
                                    <asp:ListItem Text="Need" Value="Need"></asp:ListItem>
                                    <asp:ListItem Text="Improve" Value="Improve"></asp:ListItem>
                                    <asp:ListItem Text="Extra" Value="Extra"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">Priority</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End PriorityY3 -->

                        <!-- Begin Explain -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Explain
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" Text='<%# Bind("Explain") %>' />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Explain -->

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

                        <!-- Begin Plan -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Plan
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="PlanTextBox" runat="server" Text='<%# Bind("Plan") %>' Enabled="False" />
                                <span class="hidden input-group-addon">appended</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Plan -->

                        <!-- Begin NeedYr1 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                <%: Session["SessYr6"] %>
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("NeedYr1") %>' Enabled="False" />
                                <span class="input-group-addon">Need</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End NeedYr1 -->

                        <!-- Begin CostYr1 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("CostY1") %>' Enabled="False" />
                                <span class="input-group-addon">Cost</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End CostYr1 -->

                        <!-- Begin PriorityYr1 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="DDLYr1" SelectedValue='<%# Bind("PriorityY1") %>' Enabled="false">
                                    <asp:ListItem Text="<< Select >>" Value="<< Select >>"></asp:ListItem>
                                    <asp:ListItem Text="Need" Value="Need"></asp:ListItem>
                                    <asp:ListItem Text="Improve" Value="Improve"></asp:ListItem>
                                    <asp:ListItem Text="Extra" Value="Extra"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">Priority</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End PriorityYr1 -->

                        <!-- Begin NeedYr2 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                <%: Session["SessYr7"] %>
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("NeedYr2") %>' Enabled="False" />
                                <span class="input-group-addon">Need</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End NeedYr2 -->

                        <!-- Begin CostYr2 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("CostY2") %>' Enabled="False" />
                                <span class="input-group-addon">Cost</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End CostYr2 -->

                        <!-- Begin PriorityYr2 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="DDLYr2" SelectedValue='<%# Bind("PriorityY2") %>' Enabled="false">
                                    <asp:ListItem Text="<< Select >>" Value="<< Select >>"></asp:ListItem>
                                    <asp:ListItem Text="Need" Value="Need"></asp:ListItem>
                                    <asp:ListItem Text="Improve" Value="Improve"></asp:ListItem>
                                    <asp:ListItem Text="Extra" Value="Extra"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">Priority</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End PriorityYr2 -->

                        <!-- Begin NeedYr3 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                <%: Session["SessYr8"] %>
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBoxNeedYr3" runat="server" Text='<%# Bind("NeedYr3") %>' Enabled="False" />
                                <span class="input-group-addon">Need</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End NeedYr3 -->

                        <!-- Begin CostY3 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox ID="TextBoxCostY3" runat="server" Text='<%# Bind("CostY3") %>' Enabled="False" />
                                <span class="input-group-addon">Cost</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End CostY3 -->

                        <!-- Begin PriorityY3 -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="DDLYr3" SelectedValue='<%# Bind("PriorityY3") %>' Enabled="false">
                                    <asp:ListItem Text="<< Select >>" Value="<< Select >>"></asp:ListItem>
                                    <asp:ListItem Text="Need" Value="Need"></asp:ListItem>
                                    <asp:ListItem Text="Improve" Value="Improve"></asp:ListItem>
                                    <asp:ListItem Text="Extra" Value="Extra"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">Priority</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End PriorityY3 -->

                        <!-- Begin Explain -->
                        <div class="form-group col-sm-8">
                            <label class="col-sm-4 control-label">
                                Explain
                            </label>
                            <div class="input-group col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" Text='<%# Bind("Explain") %>' Enabled="False" />
                                <span class="hidden input-group-addon">append</span>
                            </div>
                        </div>
                        <div class="hidden col-sm-2">
                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                title="title"
                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                        </div>
                        <!-- End Explain -->

                        <!-- Begin Buttons -->
                        <div class="row">
                            <div class="form-group col-sm-10">
                                <label class="col-sm-4 control-label">
                                </label>
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
                        <div class="container">
                            <div class="row" style="padding-bottom: 1em">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
                                        <Fields>
                                            <asp:NumericPagerField CurrentPageLabelCssClass="btn btn-primary" NumericButtonCssClass="btn btn-default" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </div>
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourceBudget" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Planning] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Planning] ([Plan], [NeedYr1], [CostY1], [PriorityY1], [NeedYr2], [CostY2], [PriorityY2], [NeedYr3], [CostY3], [PriorityY3], [Explain]) VALUES (@Plan, @NeedYr1, @CostY1, @PriorityY1, @NeedYr2, @CostY2, @PriorityY2, @NeedYr3, @CostY3, @PriorityY3, @Explain)" SelectCommand="SELECT [Id], [Plan], [NeedYr1], [CostY1], [PriorityY1], [NeedYr2], [CostY2], [PriorityY2], [NeedYr3], [CostY3], [PriorityY3], [Explain] FROM [Planning] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Planning] SET [Plan] = @Plan, [NeedYr1] = @NeedYr1, [CostY1] = @CostY1, [PriorityY1] = @PriorityY1, [NeedYr2] = @NeedYr2, [CostY2] = @CostY2, [PriorityY2] = @PriorityY2, [NeedYr3] = @NeedYr3, [CostY3] = @CostY3, [PriorityY3] = @PriorityY3, [Explain] = @Explain WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Plan" Type="String" />
                        <asp:Parameter Name="NeedYr1" Type="String" />
                        <asp:Parameter Name="CostY1" Type="String" />
                        <asp:Parameter Name="PriorityY1" Type="String" />
                        <asp:Parameter Name="NeedYr2" Type="String" />
                        <asp:Parameter Name="CostY2" Type="String" />
                        <asp:Parameter Name="PriorityY2" Type="String" />
                        <asp:Parameter Name="NeedYr3" Type="String" />
                        <asp:Parameter Name="CostY3" Type="String" />
                        <asp:Parameter Name="PriorityY3" Type="String" />
                        <asp:Parameter Name="Explain" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Plan" Type="String" />
                        <asp:Parameter Name="NeedYr1" Type="String" />
                        <asp:Parameter Name="CostY1" Type="String" />
                        <asp:Parameter Name="PriorityY1" Type="String" />
                        <asp:Parameter Name="NeedYr2" Type="String" />
                        <asp:Parameter Name="CostY2" Type="String" />
                        <asp:Parameter Name="PriorityY2" Type="String" />
                        <asp:Parameter Name="NeedYr3" Type="String" />
                        <asp:Parameter Name="CostY3" Type="String" />
                        <asp:Parameter Name="PriorityY3" Type="String" />
                        <asp:Parameter Name="Explain" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <!-- More Buttons -->
                <div class="container">
                    <div class="form-group row col-sm-7">
                        <label class="col-sm-3 control-label" for="moreButton">More</label>
                        <div>
                            <a href="#requirementsUploadModal" role="button" class="btn btn-primary" data-toggle="modal">Requirements</a>
                            <a href="#expendModal" role="button" class="btn btn-primary" data-toggle="modal">Expenditures</a>
                            <a href="#fileUploadModal" role="button" class="btn btn-primary" data-toggle="modal">Attachments</a>
                        </div>
                    </div>
                </div>

                <!-- Begin requirementsUploadModal -->
                <div id="requirementsUploadModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Requirements</h3>
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Requirements"
                                    data-content="Please upload the documentation about the accreditation.">
                                    <i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="uploads">Attach File:</label>
                                    <div class="col-sm-8">
                                        <asp:FileUpload ID="FileUploadReq" runat="server" />
                                        <asp:Button ID="rccUploadReqBtn" runat="server" OnClick="rccUploadReqButton_Click" Text="Upload" />
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="col-sm-12">
                                            <p><strong>Documents:</strong></p>
                                        </div>
                                        <div class="col-sm-12" style="padding-bottom: 1em;">
                                            <asp:DropDownList ID="DropDownListReq" runat="server" AppendDataBoundItems="True" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:Button ID="ButtonViewReq" runat="server" Text="View" OnClick="ButtonViewReq_Click" CssClass="btn btn-info" Auto />
                                            <a href="#confirmDeleteReq" class="btn btn-warning" data-toggle="collapse">Delete</a>
                                        </div>
                                        <div id="confirmDeleteReq" class="col-sm-8 collapse">
                                            <a href="#confirmDeleteReq" class="btn btn-success" data-toggle="collapse">Cancel Delete</a>
                                            <asp:Button ID="ButtonDelConfirmReq" runat="server" Text="Confirm Delete" OnClick="ButtonDelConfirmReq_Click" CssClass="btn btn-danger" />
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
                <!-- End requirementsUploadModal -->

                <!-- Begin expendModal -->
                <div id="expendModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Expenditures</h3>
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Expenditures"
                                    data-content="Please document your expenditures (major) for your program over the last five years.">
                                    <i class="glyphicon glyphicon-question-sign"></i></a>
                            </div>
                            <div class="modal-body">

                                <asp:ListView ID="ListViewExpend" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceExpend" InsertItemPosition="LastItem">
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

                                        <!-- Begin ExpendYr1 -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                <%= Session["SessYr1"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" Text='<%# Bind("ExpendYr1") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End ExpendYr1 -->

                                        <!-- Begin ExpendYr2 -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                <%= Session["SessYr2"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" Text='<%# Bind("ExpendYr2") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End ExpendYr2 -->

                                        <!-- Begin ExpendYr3 -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                <%= Session["SessYr3"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" Text='<%# Bind("ExpendYr3") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End ExpendYr3 -->

                                        <!-- Begin ExpendYr4 -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                <%= Session["SessYr4"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" Text='<%# Bind("ExpendYr4") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End ExpendYr4 -->

                                        <!-- Begin ExpendYr5 -->
                                        <div class="form-group col-sm-8">
                                            <label class="col-sm-4 control-label">
                                                <%= Session["SessYr5"] %>
                                            </label>
                                            <div class="input-group col-sm-4">
                                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" Text='<%# Bind("ExpendYr5") %>' />
                                                <span class="hidden input-group-addon">append</span>
                                            </div>
                                        </div>
                                        <div class="hidden col-sm-2">
                                            <a href="#" data-toggle="popover" data-trigger="hover" data-placement="left"
                                                title="title"
                                                data-content="content"><i class="glyphicon glyphicon-question-sign"></i></a>
                                        </div>
                                        <!-- End ExpendYr5 -->

                                        <!-- Begin Buttons -->
                                        <div class="row">
                                            <div class="form-group col-sm-10">
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
                                <asp:SqlDataSource ID="SqlDataSourceExpend" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Budget] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Budget] ([ExpendYr1], [ExpendYr2], [ExpendYr3], [ExpendYr4], [ExpendYr5]) VALUES (@ExpendYr1, @ExpendYr2, @ExpendYr3, @ExpendYr4, @ExpendYr5)" SelectCommand="SELECT [Id], [ExpendYr1], [ExpendYr2], [ExpendYr3], [ExpendYr4], [ExpendYr5] FROM [Budget] WHERE (([ProgramID] = @ProgramID) AND ([ReviewYear] = @ReviewYear))" UpdateCommand="UPDATE [Budget] SET [ExpendYr1] = @ExpendYr1, [ExpendYr2] = @ExpendYr2, [ExpendYr3] = @ExpendYr3, [ExpendYr4] = @ExpendYr4, [ExpendYr5] = @ExpendYr5 WHERE [Id] = @Id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="ExpendYr1" Type="String" />
                                        <asp:Parameter Name="ExpendYr2" Type="String" />
                                        <asp:Parameter Name="ExpendYr3" Type="String" />
                                        <asp:Parameter Name="ExpendYr4" Type="String" />
                                        <asp:Parameter Name="ExpendYr5" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                                        <asp:SessionParameter Name="ReviewYear" SessionField="SessRevYr" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="ExpendYr1" Type="String" />
                                        <asp:Parameter Name="ExpendYr2" Type="String" />
                                        <asp:Parameter Name="ExpendYr3" Type="String" />
                                        <asp:Parameter Name="ExpendYr4" Type="String" />
                                        <asp:Parameter Name="ExpendYr5" Type="String" />
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>

                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End expendModal -->

                <!-- Begin File Upload -->
                <div id="fileUploadModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Attachments</h3>
                                <a href="#" data-toggle="popover" data-trigger="hover" data-placement="right"
                                    title="Attachments"
                                    data-content="Please upload supporting documentation related to budgeted items such as an item description with costs from Amazon.">
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

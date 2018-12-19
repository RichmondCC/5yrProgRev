<%@ Page Title="" Language="C#" MasterPageFile="~/rcc5yr.Master" AutoEventWireup="true" CodeBehind="import.aspx.cs" Inherits="Rcc5yrProgRev.import" %>
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
        <div class="Jumbotron text-center">
            <h2>Select the program name and review period to import from:</h2>
        </div>
        <div class="col-sm-12">
            <asp:Label ID="LabelImportMessage" runat="server"></asp:Label>
        </div>
    <div class="col-sm-4 col-sm-offset-4">
        <asp:DropDownList CssClass="form-control" ID="DropDownListProgramID" runat="server" DataSourceID="SqlDataSourceProgramID" DataTextField="ProgramName" DataValueField="ProgramID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceProgramID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [ProgramID], [ProgramName] FROM [Programs]"></asp:SqlDataSource>
    </div>
    <div class="col-sm-4">
        <asp:Button CssClass="btn btn-primary" ID="ButtonProgramID" runat="server" Text="Select"  OnClick="ButtonProgramID_Click"/>
    </div>
    <div class="col-sm-4 col-sm-offset-4" style="padding-top: 2em;">
        <asp:DropDownList CssClass="form-control" ID="DropDownListReviewYear" runat="server" DataSourceID="SqlDataSourceReviewYear" DataTextField="ReviewYear" DataValueField="ReviewYear" Visible="False" Enabled="False">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceReviewYear" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [ReviewYear] FROM [Programs] WHERE ([ProgramID] = @ProgramID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="LabelProgramID" Name="ProgramID" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-sm-4" style="padding-top: 2em;">
        <asp:Button CssClass="btn btn-primary" ID="ButtonReviewYear" runat="server" Text="Select" OnClick="ButtonReviewYear_Click" Enabled="False" Visible="False" />
    </div>
    <div style="padding-top: 2em;" class="col-sm-2 col-sm-offset-4">
        <asp:Label ID="LabelProgramID" runat="server" Text="Label" CssClass="hidden"></asp:Label>
        <asp:Label ID="LabelReviewYear" runat="server" Text="Label" CssClass="hidden"></asp:Label>
        <asp:HyperLink ID="HyperLinkImportFac" runat="server" CssClass="btn btn-lg btn-block btn-default disabled" NavigateUrl="#importFacModal">Import Faculty</asp:HyperLink>
    </div>
    <div style="padding-top: 2em;" class="col-sm-2">
        <asp:Button CssClass="btn btn-lg btn-block btn-default disabled" ID="ButtonImportData" runat="server" Text="Import Data" OnClick="ButtonImportData_Click" />
    </div>
    </div>
    <!-- Begin Faculty Import Modal -->
    <div id="importFacModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Import Faculty</h3>
                </div>
                <div class="modal-body">
                    <p>There are <asp:Label ID="LabelNumFac" runat="server" Text="Label"></asp:Label> faculty 
                        for <asp:Label ID="LabelLoginProgram" runat="server" Text="Label"></asp:Label> 
                        - <asp:Label ID="LabelLoginReviewYear" runat="server" Text="Label"></asp:Label>. 
                        Would you like to:
                        <ul>
                            <li>ADD to faculty from import</li>
                            <li>REPLACE current faculty with faculty from import</li>
                            <li>CANCEL import</li>
                        </ul>
                    </p>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-warning" ID="ImportFacAdd" runat="server" Text="Add" OnClick="ButtonImportFac_Click" />
                    <asp:Button CssClass="btn btn-danger" ID="ImportFacOverwrite" runat="server" Text="Replace" OnClick="ButtonOverwriteFac_Click" />
                    <asp:Button CssClass="btn btn-success" ID="ImportFacCancel" runat="server" Text="Cancel" />
                </div>
            </div>
        </div>
    </div>
    <!-- End Faculty Import Modal -->







</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Rcc5yrProgRev.Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--  Bootstrap CSS(minified) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <!--  Bootstap Theme CSS(minified) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <!-- jQuery Javascript(minified) -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <!--  Bootstrap JavaScript(minified) -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Panel ID="PanelLogin" runat="server">
                <div class="col-sm-4 col-sm-offset-4">
                    <h2><strong>5-Year Program Review</strong></h2>
                    <h2>Login</h2>
                    <label for="Username">
                        <asp:TextBox ID="Username" runat="server" CssClass="form-control"></asp:TextBox>
                    </label>
                    <label for="Password">
                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </label>
                    <asp:Button ID="Login" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="Login_Click" />
                    <asp:Label ID="LabelLoginError" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelLoggedIn" runat="server" Visible="False">
                <div class="Jumbotron text-center col-sm-12">
                    <h2>Select your program name and review period to begin:</h2>
                </div>
                <asp:Panel ID="PanelProgIDAll" runat="server" Visible="False">
                    <div class="col-sm-4 col-sm-offset-4">
                        <asp:DropDownList CssClass="form-control" ID="DropDownListProgramName" runat="server" DataSourceID="SqlDataSourceProgramID" DataTextField="ProgramName" DataValueField="ProgramID" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownListProgramName_SelectedIndexChanged">
                            <asp:ListItem><< Select your Program >> </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceProgramID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [ProgramID], [ProgramName] FROM [Programs]"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-4">
                        <asp:Button CssClass="btn btn-primary" ID="ButtonProgramID" runat="server" OnClick="BtnProgID_Click" Text="Select" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelProgOther" runat="server" Visible="False">
                    <div class="col-sm-4 col-sm-offset-4">
                        <asp:DropDownList CssClass="form-control" ID="DropDownListProgramNameOther" runat="server" DataSourceID="SqlDataSourceProgramIDOther" DataTextField="programName" DataValueField="programID" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownListProgramNameOther_SelectedIndexChanged">
                            <asp:ListItem><< Select your Program >> </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceProgramIDOther" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [programName], [programID] FROM [Users] WHERE ([name] = @name)">
                            <SelectParameters>
                                <asp:SessionParameter Name="name" SessionField="SessName" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-sm-4">
                        <asp:Button CssClass="btn btn-primary" ID="ButtonProgramIDOther" runat="server" OnClick="BtnProgIDOther_Click" Text="Select" />
                    </div>

                </asp:Panel>
                <div class="col-sm-4 col-sm-offset-4" style="padding-top: 2em;">
                    <asp:DropDownList CssClass="form-control" ID="DropDownListReviewYear" runat="server" DataSourceID="SqlDataSourceReviewPeriod" DataTextField="ReviewYear" DataValueField="ReviewYear" Enabled="false" Visible="False">
                        <asp:ListItem><< Select Review Year >> </asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceReviewPeriod" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ReviewYear] FROM [Programs] WHERE ([ProgramID] = @ProgramID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblSelectedProgram" Name="ProgramID" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-sm-4" style="padding-top: 2em;">
                    <asp:Button CssClass="btn btn-primary" ID="BtnRevYr" runat="server" OnClick="BtnRevYr_Click" Text="Select" Visible="False" />
                </div>
                <br />
                <div style="padding-top: 2em;" class="col-sm-4 col-sm-offset-4">
                    <asp:Button CssClass="btn btn-lg btn-block btn-default" ID="ButtonGo" runat="server" Text="Begin!" OnClick="ButtonGo_Click" Enabled="False" />
                </div>
                <div class="hidden">
                    <asp:Label ID="lblSelectedProgram" runat="server" Text="Label"></asp:Label><asp:Label ID="lblSelectedYear" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

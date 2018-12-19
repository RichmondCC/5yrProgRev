<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_test.aspx.cs" Inherits="Rcc5yrProgRev.Login_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                <asp:Panel ID="PanelLogin" runat="server" CssClass="col-sm-4 col-sm-offset-4">
                    <h3>Login</h3>
                    <label for="Username">
                        <asp:TextBox ID="Username" runat="server" CssClass="form-control"></asp:TextBox>
                    </label>
                    <label for="Password">
                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </label>
                    <asp:Button ID="Login" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="Login_Click" />
                </asp:Panel>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>

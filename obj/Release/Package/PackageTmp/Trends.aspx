<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trends.aspx.cs" Inherits="Rcc5yrProgRev.Trends" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<h3>Enrollment</h3>
        <table align="center" class="auto-style4">
            <tr>
                <th>
                    <asp:Label ID="LabelEnrollment1" runat="server" Text=""><%: Session["SessYr1"] %></asp:Label>
                </th>
                <th>
                    <asp:Label ID="LabelEnrollment2" runat="server" Text=""><%: Session["SessYr2"] %></asp:Label>
                </th>
                <th>
                    <asp:Label ID="LabelEnrollment3" runat="server" Text=""><%: Session["SessYr3"] %></asp:Label>
                </th>
                <th>
                    <asp:Label ID="LabelEnrollment4" runat="server" Text=""><%: Session["SessYr4"] %></asp:Label>
                </th>
                <th>
                    <asp:Label ID="LabelEnrollment5" runat="server" Text=""><%: Session["SessYr5"] %></asp:Label>
                </th>
            </tr>
            <tr>
                <td>

            <asp:ListView ID="ListViewEnrollmentYr1" runat="server" DataSourceID="SqlDataSourceEnrollmentYr1">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">Term</th>
                                        <th runat="server">DL</th>
                                        <th runat="server">NonDL</th>
                                        <th runat="server">Total</th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSourceEnrollmentYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Term, SUM(DL) AS DL, SUM(NonDL) AS NonDL, SUM(DL + NonDL) AS Total FROM Enrollment WHERE (ProgramID = @SessProgID) AND (ReviewYear = @SessYr1) GROUP BY Term">
                <SelectParameters>
                    <asp:SessionParameter Name="SessProgID" SessionField="SessProgID" />
                    <asp:SessionParameter Name="SessYr1" SessionField="SessYr1" />
                </SelectParameters>
            </asp:SqlDataSource>

                </td>
                <td>
                    <asp:ListView ID="ListViewEnrollmentYr2" runat="server" DataSourceID="SqlDataSourceEnrollmentYr2">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Term</th>
                                                <th runat="server">DL</th>
                                                <th runat="server">NonDL</th>
                                                <th runat="server">Total</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSourceEnrollmentYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Term, SUM(DL) AS DL, SUM(NonDL) AS NonDL, SUM(DL + NonDL) AS Total FROM Enrollment WHERE (ProgramID = @SessProgID) AND (ReviewYear = @SessYr2) GROUP BY Term">
                <SelectParameters>
                    <asp:SessionParameter Name="SessProgID" SessionField="SessProgID" />
                    <asp:SessionParameter Name="SessYr2" SessionField="SessYr2" />
                </SelectParameters>
            </asp:SqlDataSource>

                </td>
                <td>
                    <asp:ListView ID="ListViewEnrollmentYr3" runat="server" DataSourceID="SqlDataSourceEnrollmentYr3">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Term</th>
                                                <th runat="server">DL</th>
                                                <th runat="server">NonDL</th>
                                                <th runat="server">Total</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSourceEnrollmentYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Term, SUM(DL) AS DL, SUM(NonDL) AS NonDL, SUM(DL + NonDL) AS Total FROM Enrollment WHERE (ProgramID = @SessProgID) AND (ReviewYear = @SessYr3) GROUP BY Term">
                <SelectParameters>
                    <asp:SessionParameter Name="SessProgID" SessionField="SessProgID" />
                    <asp:SessionParameter Name="SessYr3" SessionField="SessYr3" />
                </SelectParameters>
            </asp:SqlDataSource>

                </td>
                <td>
                    <asp:ListView ID="ListViewEnrollmentYr4" runat="server" DataSourceID="SqlDataSourceEnrollmentYr4">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Term</th>
                                                <th runat="server">DL</th>
                                                <th runat="server">NonDL</th>
                                                <th runat="server">Total</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSourceEnrollmentYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Term, SUM(DL) AS DL, SUM(NonDL) AS NonDL, SUM(DL + NonDL) AS Total FROM Enrollment WHERE (ProgramID = @SessProgID) AND (ReviewYear = @SessYr4) GROUP BY Term">
                <SelectParameters>
                    <asp:SessionParameter Name="SessProgID" SessionField="SessProgID" />
                    <asp:SessionParameter Name="SessYr4" SessionField="SessYr4" />
                </SelectParameters>
            </asp:SqlDataSource>

                </td>
                <td>
                    <asp:ListView ID="ListViewEnrollmentYr5" runat="server" DataSourceID="SqlDataSourceEnrollmentYr5">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TermTextBox" runat="server" Text='<%# Bind("Term") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DLTextBox" runat="server" Text='<%# Bind("DL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NonDLTextBox" runat="server" Text='<%# Bind("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Term</th>
                                                <th runat="server">DL</th>
                                                <th runat="server">NonDL</th>
                                                <th runat="server">Total</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="TermLabel" runat="server" Text='<%# Eval("Term") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DLLabel" runat="server" Text='<%# Eval("DL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NonDLLabel" runat="server" Text='<%# Eval("NonDL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSourceEnrollmentYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Term, SUM(DL) AS DL, SUM(NonDL) AS NonDL, SUM(DL + NonDL) AS Total FROM Enrollment WHERE (ProgramID = @SessProgID) AND (ReviewYear = @SessYr5) GROUP BY Term">
                <SelectParameters>
                    <asp:SessionParameter Name="SessProgID" SessionField="SessProgID" />
                    <asp:SessionParameter Name="SessYr5" SessionField="SessYr5" />
                </SelectParameters>
            </asp:SqlDataSource>

                </td>
            </tr>
        </table>
        <h3>Demographics</h3>
        <table class="auto-style4">
            <tr>
                <th>
                    <asp:Label ID="LabelDemo1" runat="server" Text=""><%: Session["SessYr1"] %></asp:Label>
                </th>
                <th>
                    <asp:Label ID="LabelDemo2" runat="server" Text=""><%: Session["SessYr2"] %></asp:Label>
                </th>
                <th>
                    <asp:Label ID="LabelDemo3" runat="server" Text=""><%: Session["SessYr3"] %></asp:Label>
                </th>
                <th>
                    <asp:Label ID="LabelDemo4" runat="server" Text=""><%: Session["SessYr4"] %></asp:Label>
                </th>
                <th>
                    <asp:Label ID="LabelDemo5" runat="server" Text=""><%: Session["SessYr5"] %></asp:Label>
                </th>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="GridViewGender1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoGenderYr1">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoGenderYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, COUNT(Gender) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewEthnicity1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoEthnicityYr1">
            <Columns>
                <asp:BoundField DataField="Ethnic" HeaderText="Ethnic" SortExpression="Ethnic" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoEthnicityYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Ethnic, COUNT(Ethnic) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Ethnic">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAvgAge1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgeYr1">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgeYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, AVG(Age) AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAverageAges1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgesYr1">
            <Columns>
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                <asp:BoundField DataField="Average" HeaderText="Average" ReadOnly="True" SortExpression="Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgesYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 'Total' AS Total, AVG(Age) AS Average FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAgeRange1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAgeRangeYr1">
            <Columns>
                <asp:BoundField DataField="Age Range" HeaderText="Age Range" SortExpression="Age Range" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceAgeRangeYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Range AS 'Age Range', COUNT(Range) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Range">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewLoad1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLoadYr1">
            <Columns>
                <asp:BoundField DataField="Load" HeaderText="Load" SortExpression="Load" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceLoadYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Load], COUNT([Load]) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY [Load]">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewDegree1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDegreeYr1">
            <Columns>
                <asp:BoundField DataField="Degree" HeaderText="Degree" SortExpression="Degree" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDegreeYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Degree, COUNT(Degree) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Degree">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:GridView ID="GridViewEmploymentYr1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceEmploymentYr1">
                        <Columns>
                            <asp:BoundField DataField="Employment" HeaderText="Employment" SortExpression="Employment" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEmploymentYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Employment, COUNT(Employment) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Employment">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:GridView ID="GridViewCountyYr1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCountyYr1">
                        <Columns>
                            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCountyYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT County, COUNT(County) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY County">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
                <td>
        <asp:GridView ID="GridViewGender2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoGenderYr2">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoGenderYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, COUNT(Gender) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewEthnicity2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoEthnicityYr2">
            <Columns>
                <asp:BoundField DataField="Ethnic" HeaderText="Ethnic" SortExpression="Ethnic" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoEthnicityYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Ethnic, COUNT(Ethnic) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Ethnic">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAvgAge2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgeYr2">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgeYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, AVG(Age) AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAverageAges2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgesYr2">
            <Columns>
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                <asp:BoundField DataField="Average" HeaderText="Average" ReadOnly="True" SortExpression="Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgesYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 'Total' AS Total, AVG(Age) AS Average FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAgeRange2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAgeRangeYr2">
            <Columns>
                <asp:BoundField DataField="Age Range" HeaderText="Age Range" SortExpression="Age Range" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceAgeRangeYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Range AS 'Age Range', COUNT(Range) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Range">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewLoad2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLoadYr2">
            <Columns>
                <asp:BoundField DataField="Load" HeaderText="Load" SortExpression="Load" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceLoadYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Load], COUNT([Load]) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY [Load]">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewDegree2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDegreeYr2">
            <Columns>
                <asp:BoundField DataField="Degree" HeaderText="Degree" SortExpression="Degree" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDegreeYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Degree, COUNT(Degree) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Degree">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

                    <asp:GridView ID="GridViewEmploymentYr2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceEmploymentYr2">
                        <Columns>
                            <asp:BoundField DataField="Employment" HeaderText="Employment" SortExpression="Employment" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEmploymentYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Employment, COUNT(Employment) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Employment">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:GridView ID="GridViewCountyYr2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCountyYr2">
                        <Columns>
                            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCountyYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT County, COUNT(County) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY County">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr1" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>


                </td>
                <td>
        <asp:GridView ID="GridViewGender3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoGenderYr3">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoGenderYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, COUNT(Gender) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr3" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewEthnicity3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoEthnicityYr3">
            <Columns>
                <asp:BoundField DataField="Ethnic" HeaderText="Ethnic" SortExpression="Ethnic" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoEthnicityYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Ethnic, COUNT(Ethnic) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Ethnic">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr3" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAvgAge3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgeYr3">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgeYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, AVG(Age) AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr3" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAverageAges3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgesYr3">
            <Columns>
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                <asp:BoundField DataField="Average" HeaderText="Average" ReadOnly="True" SortExpression="Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgesYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 'Total' AS Total, AVG(Age) AS Average FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr3" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAgeRange3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAgeRangeYr3">
            <Columns>
                <asp:BoundField DataField="Age Range" HeaderText="Age Range" SortExpression="Age Range" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceAgeRangeYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Range AS 'Age Range', COUNT(Range) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Range">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr3" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewLoad3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLoadYr3">
            <Columns>
                <asp:BoundField DataField="Load" HeaderText="Load" SortExpression="Load" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceLoadYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Load], COUNT([Load]) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY [Load]">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr3" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewDegree3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDegreeYr3">
            <Columns>
                <asp:BoundField DataField="Degree" HeaderText="Degree" SortExpression="Degree" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDegreeYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Degree, COUNT(Degree) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Degree">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr3" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                    
                    <asp:GridView ID="GridViewEmploymentYr3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceEmploymentYr3">
                        <Columns>
                            <asp:BoundField DataField="Employment" HeaderText="Employment" SortExpression="Employment" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEmploymentYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Employment, COUNT(Employment) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Employment">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr3" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:GridView ID="GridViewCountyYr3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCountyYr3">
                        <Columns>
                            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCountyYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT County, COUNT(County) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY County">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

                </td>
                <td>
        <asp:GridView ID="GridViewGender4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoGenderYr4">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoGenderYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, COUNT(Gender) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr4" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewEthnicity4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoEthnicityYr4">
            <Columns>
                <asp:BoundField DataField="Ethnic" HeaderText="Ethnic" SortExpression="Ethnic" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoEthnicityYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Ethnic, COUNT(Ethnic) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Ethnic">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr4" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAvgAge4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgeYr4">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgeYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, AVG(Age) AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr4" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAverageAges4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgesYr4">
            <Columns>
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                <asp:BoundField DataField="Average" HeaderText="Average" ReadOnly="True" SortExpression="Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgesYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 'Total' AS Total, AVG(Age) AS Average FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr4" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAgeRange4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAgeRangeYr4">
            <Columns>
                <asp:BoundField DataField="Age Range" HeaderText="Age Range" SortExpression="Age Range" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceAgeRangeYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Range AS 'Age Range', COUNT(Range) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Range">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr4" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewLoad4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLoadYr4">
            <Columns>
                <asp:BoundField DataField="Load" HeaderText="Load" SortExpression="Load" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceLoadYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Load], COUNT([Load]) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY [Load]">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr4" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewDegree4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDegreeYr4">
            <Columns>
                <asp:BoundField DataField="Degree" HeaderText="Degree" SortExpression="Degree" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDegreeYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Degree, COUNT(Degree) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Degree">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr4" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:GridView ID="GridViewEmploymentYr4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceEmploymentYr4">
                        <Columns>
                            <asp:BoundField DataField="Employment" HeaderText="Employment" SortExpression="Employment" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEmploymentYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Employment, COUNT(Employment) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Employment">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr4" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:GridView ID="GridViewCountyYr4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCountyYr4">
                        <Columns>
                            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCountyYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT County, COUNT(County) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY County">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr3" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

                </td>
                <td>
        <asp:GridView ID="GridViewGender5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoGenderYr5">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoGenderYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, COUNT(Gender) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr5" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewEthnicity5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoEthnicityYr5">
            <Columns>
                <asp:BoundField DataField="Ethnic" HeaderText="Ethnic" SortExpression="Ethnic" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoEthnicityYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Ethnic, COUNT(Ethnic) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Ethnic">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr5" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAvgAge5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgeYr5">
            <Columns>
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgeYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gender, AVG(Age) AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Gender">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr5" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAverageAges5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDemoAvgAgesYr5">
            <Columns>
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                <asp:BoundField DataField="Average" HeaderText="Average" ReadOnly="True" SortExpression="Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDemoAvgAgesYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 'Total' AS Total, AVG(Age) AS Average FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr5" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewAgeRange5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAgeRangeYr5">
            <Columns>
                <asp:BoundField DataField="Age Range" HeaderText="Age Range" SortExpression="Age Range" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceAgeRangeYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Range AS 'Age Range', COUNT(Range) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Range">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr5" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewLoad5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLoadYr5">
            <Columns>
                <asp:BoundField DataField="Load" HeaderText="Load" SortExpression="Load" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceLoadYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Load], COUNT([Load]) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY [Load]">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr5" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewDegree5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDegreeYr5">
            <Columns>
                <asp:BoundField DataField="Degree" HeaderText="Degree" SortExpression="Degree" />
                <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDegreeYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Degree, COUNT(Degree) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Degree">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr5" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                    
                    <asp:GridView ID="GridViewEmploymentYr5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceEmploymentYr5">
                        <Columns>
                            <asp:BoundField DataField="Employment" HeaderText="Employment" SortExpression="Employment" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEmploymentYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Employment, COUNT(Employment) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY Employment">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr5" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:GridView ID="GridViewCountyYr5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCountyYr5">
                        <Columns>
                            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                            <asp:BoundField DataField="2 Semester Average" HeaderText="2 Semester Average" ReadOnly="True" SortExpression="2 Semester Average" />
                        </Columns>
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCountyYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT County, COUNT(County) / 2 AS [2 Semester Average] FROM Demographics WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear) GROUP BY County">
            <SelectParameters>
                <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                <asp:SessionParameter Name="ReviewYear" SessionField="SessYr5" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

                </td>
            </tr>
        </table>    </div>
    </form>
</body>
</html>

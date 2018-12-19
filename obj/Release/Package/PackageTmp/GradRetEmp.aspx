<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradRetEmp.aspx.cs" Inherits="Rcc5yrProgRev.GradRetEmp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="auto-style2">
            <tr>
                <td>Year</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelPassRateYr1" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView14" runat="server" DataSourceID="SqlDataSourcePassRate1">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Semester</th>
                                                <th runat="server">PassRate</th>
                                                <th runat="server">GradeAverage</th>
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
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourcePassRate1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Semester, FORMAT((SUM(Pass) * 1.0) / (SUM(Pass) + SUM(Fail)), '0%') AS PassRate, FORMAT(AVG(GrdValue), '0.00') AS GradeAverage FROM CoursePerformance WHERE (CourseName IN (SELECT CourseName FROM CourseMatrix WHERE (ProgramID = @ProgramId))) AND (Years = @RevYear) GROUP BY Semester">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" />
                    <asp:ControlParameter ControlID="LabelPassRateYr1" Name="RevYear" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelPassRateYr2" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView44" runat="server" DataSourceID="SqlDataSourcePassRate2">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Semester</th>
                                                <th runat="server">PassRate</th>
                                                <th runat="server">GradeAverage</th>
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
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourcePassRate2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Semester, FORMAT((SUM(Pass) * 1.0 / (SUM(Pass) + SUM(Fail))),'0%') AS PassRate, FORMAT(AVG(GrdValue),'0.00') AS GradeAverage FROM CoursePerformance WHERE (CourseName IN (SELECT CourseName FROM CourseMatrix WHERE (ProgramID = @ProgramId))) AND (Years = @RevYear) GROUP BY Semester">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" />
                    <asp:ControlParameter ControlID="LabelPassRateYr2" Name="RevYear" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelPassRateYr3" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView45" runat="server" DataSourceID="SqlDataSourcePassRate3">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Semester</th>
                                                <th runat="server">PassRate</th>
                                                <th runat="server">GradeAverage</th>
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
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourcePassRate3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Semester, FORMAT((SUM(Pass) * 1.0 / (SUM(Pass) + SUM(Fail))),'0%') AS PassRate, FORMAT(AVG(GrdValue),'0.00') AS GradeAverage FROM CoursePerformance WHERE (CourseName IN (SELECT CourseName FROM CourseMatrix WHERE (ProgramID = @ProgramId))) AND (Years = @RevYear) GROUP BY Semester">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" />
                    <asp:ControlParameter ControlID="LabelPassRateYr3" Name="RevYear" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelPassRateYr4" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView46" runat="server" DataSourceID="SqlDataSourcePassRate4">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Semester</th>
                                                <th runat="server">PassRate</th>
                                                <th runat="server">GradeAverage</th>
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
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourcePassRate4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Semester, FORMAT((SUM(Pass) * 1.0 / (SUM(Pass) + SUM(Fail))),'0%') AS PassRate, FORMAT(AVG(GrdValue),'0.00') AS GradeAverage FROM CoursePerformance WHERE (CourseName IN (SELECT CourseName FROM CourseMatrix WHERE (ProgramID = @ProgramId))) AND (Years = @RevYear) GROUP BY Semester">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" />
                    <asp:ControlParameter ControlID="LabelPassRateYr4" Name="RevYear" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelPassRateYr5" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView47" runat="server" DataSourceID="SqlDataSourcePassRate5">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
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
                                    <asp:TextBox ID="SemesterTextBox" runat="server" Text='<%# Bind("Semester") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PassRateTextBox" runat="server" Text='<%# Bind("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradeAverageTextBox" runat="server" Text='<%# Bind("GradeAverage") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Semester</th>
                                                <th runat="server">PassRate</th>
                                                <th runat="server">GradeAverage</th>
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
                                    <asp:Label ID="SemesterLabel" runat="server" Text='<%# Eval("Semester") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PassRateLabel" runat="server" Text='<%# Eval("PassRate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradeAverageLabel" runat="server" Text='<%# Eval("GradeAverage") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourcePassRate5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Semester, FORMAT((SUM(Pass) * 1.0 / (SUM(Pass) + SUM(Fail))),'0%') AS PassRate, FORMAT(AVG(GrdValue),'0.00') AS GradeAverage FROM CoursePerformance WHERE (CourseName IN (SELECT CourseName FROM CourseMatrix WHERE (ProgramID = @ProgramId))) AND (Years = @RevYear) GROUP BY Semester">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" />
                    <asp:ControlParameter ControlID="LabelPassRateYr5" Name="RevYear" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table class="auto-style2">
            <tr>
                <td>Year</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelGradRetYr1" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView39" runat="server" DataSourceID="SqlDataSourceCohortYr1">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Cohort</th>
                                                <th runat="server">Graduated</th>
                                                <th runat="server">Returned</th>
                                                <th runat="server">Total</th>
                                                <th runat="server">GradRetRate</th>
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
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceCohortYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(Cohort) AS Cohort, SUM(Graduated) AS Graduated, SUM(Retained) AS Returned, SUM(Graduated) + SUM(Retained) AS Total, FORMAT(((SUM(Graduated) + SUM(Retained) * 1.0) / COUNT(Cohort)),'0%') AS GradRetRate FROM GraduateRetain AS GR WHERE (ProgramId = @ProgramId) AND (ReviewYear = @ReviewYear) GROUP BY Cohort">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" Type="String" />
                    <asp:ControlParameter ControlID="LabelGradRetYr1" Name="ReviewYear" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelGradRetYr2" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView40" runat="server" DataSourceID="SqlDataSourceCohortYr2">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Cohort</th>
                                                <th runat="server">Graduated</th>
                                                <th runat="server">Returned</th>
                                                <th runat="server">Total</th>
                                                <th runat="server">GradRetRate</th>
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
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceCohortYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(Cohort) as Cohort, SUM(Graduated) AS Graduated, SUM(Retained) AS Returned, SUM(Graduated) + SUM(Retained) AS Total, FORMAT(((SUM(Graduated) + SUM(Retained) * 1.0) / COUNT(Cohort)),'0%') AS GradRetRate FROM GraduateRetain AS GR WHERE (ProgramId = @ProgramId) AND (ReviewYear = @ReviewYear) GROUP BY Cohort">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" Type="String" />
                    <asp:ControlParameter ControlID="LabelGradRetYr2" Name="ReviewYear" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelGradRetYr3" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView41" runat="server" DataSourceID="SqlDataSourceCohortYr3">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Cohort</th>
                                                <th runat="server">Graduated</th>
                                                <th runat="server">Returned</th>
                                                <th runat="server">Total</th>
                                                <th runat="server">GradRetRate</th>
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
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceCohortYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(Cohort) as Cohort, SUM(Graduated) AS Graduated, SUM(Retained) AS Returned, SUM(Graduated) + SUM(Retained) AS Total, FORMAT(((SUM(Graduated) + SUM(Retained) * 1.0) / COUNT(Cohort)),'0%') AS GradRetRate FROM GraduateRetain AS GR WHERE (ProgramId = @ProgramId) AND (ReviewYear = @ReviewYear) GROUP BY Cohort">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" Type="String" />
                    <asp:ControlParameter ControlID="LabelGradRetYr3" Name="ReviewYear" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelGradRetYr4" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView42" runat="server" DataSourceID="SqlDataSourceCohortYr4">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Cohort</th>
                                                <th runat="server">Graduated</th>
                                                <th runat="server">Returned</th>
                                                <th runat="server">Total</th>
                                                <th runat="server">GradRetRate</th>
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
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceCohortYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(Cohort) as Cohort, SUM(Graduated) AS Graduated, SUM(Retained) AS Returned, SUM(Graduated) + SUM(Retained) AS Total, FORMAT(((SUM(Graduated) + SUM(Retained) * 1.0) / COUNT(Cohort)),'0%') AS GradRetRate FROM GraduateRetain AS GR WHERE (ProgramId = @ProgramId) AND (ReviewYear = @ReviewYear) GROUP BY Cohort">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" Type="String" />
                    <asp:ControlParameter ControlID="LabelGradRetYr4" Name="ReviewYear" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelGradRetYr5" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView43" runat="server" DataSourceID="SqlDataSourceCohortYr5">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
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
                                    <asp:TextBox ID="CohortTextBox" runat="server" Text='<%# Bind("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GraduatedTextBox" runat="server" Text='<%# Bind("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ReturnedTextBox" runat="server" Text='<%# Bind("Returned") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GradRetRateTextBox" runat="server" Text='<%# Bind("GradRetRate") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Cohort</th>
                                                <th runat="server">Graduated</th>
                                                <th runat="server">Returned</th>
                                                <th runat="server">Total</th>
                                                <th runat="server">GradRetRate</th>
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
                                    <asp:Label ID="CohortLabel" runat="server" Text='<%# Eval("Cohort") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GraduatedLabel" runat="server" Text='<%# Eval("Graduated") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ReturnedLabel" runat="server" Text='<%# Eval("Returned") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GradRetRateLabel" runat="server" Text='<%# Eval("GradRetRate") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceCohortYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(Cohort) as Cohort, SUM(Graduated) AS Graduated, SUM(Retained) AS Returned, SUM(Graduated) + SUM(Retained) AS Total, FORMAT(((SUM(Graduated) + SUM(Retained) * 1.0) / COUNT(Cohort)),'0%') AS GradRetRate FROM GraduateRetain AS GR WHERE (ProgramId = @ProgramId) AND (ReviewYear = @ReviewYear) GROUP BY Cohort">
                <SelectParameters>
                    <asp:SessionParameter Name="ProgramId" SessionField="SessProgID" Type="String" />
                    <asp:ControlParameter ControlID="LabelGradRetYr5" Name="ReviewYear" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <table class="auto-style2">
            <tr>
                <td>Year</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelDegDipCertYr1" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView48" runat="server" DataSourceID="SqlDataSourceDegDipCertYr1">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                                <th runat="server">Degrees</th>
                                                <th runat="server">Diplomas</th>
                                                <th runat="server">Certificates</th>
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
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceDegDipCertYr1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(Degree) AS Degrees, SUM(Diploma) AS Diplomas, SUM(Certificate) AS Certificates, SUM(Degree) + SUM(Diploma) + SUM(Certificate) AS Total FROM DegDipCert WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                            <asp:ControlParameter ControlID="LabelDegDipCertYr1" Name="ReviewYear" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelDegDipCertYr2" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView49" runat="server" DataSourceID="SqlDataSourceDegDipCertYr2">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                                <th runat="server">Degrees</th>
                                                <th runat="server">Diplomas</th>
                                                <th runat="server">Certificates</th>
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
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceDegDipCertYr2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(Degree) AS Degrees, SUM(Diploma) AS Diplomas, SUM(Certificate) AS Certificates, SUM(Degree) + SUM(Diploma) + SUM(Certificate) AS Total FROM DegDipCert WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                            <asp:ControlParameter ControlID="LabelDegDipCertYr2" Name="ReviewYear" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelDegDipCertYr3" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView50" runat="server" DataSourceID="SqlDataSourceDegDipCertYr3">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                                <th runat="server">Degrees</th>
                                                <th runat="server">Diplomas</th>
                                                <th runat="server">Certificates</th>
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
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceDegDipCertYr3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(Degree) AS Degrees, SUM(Diploma) AS Diplomas, SUM(Certificate) AS Certificates, SUM(Degree) + SUM(Diploma) + SUM(Certificate) AS Total FROM DegDipCert WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                            <asp:ControlParameter ControlID="LabelDegDipCertYr3" Name="ReviewYear" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelDegDipCertYr4" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView51" runat="server" DataSourceID="SqlDataSourceDegDipCertYr4">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                                <th runat="server">Degrees</th>
                                                <th runat="server">Diplomas</th>
                                                <th runat="server">Certificates</th>
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
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceDegDipCertYr4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(Degree) AS Degrees, SUM(Diploma) AS Diplomas, SUM(Certificate) AS Certificates, SUM(Degree) + SUM(Diploma) + SUM(Certificate) AS Total FROM DegDipCert WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                            <asp:ControlParameter ControlID="LabelDegDipCertYr4" Name="ReviewYear" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelDegDipCertYr5" runat="server" Text='Label'></asp:Label>
                </td>
                <td>
                    <asp:ListView ID="ListView52" runat="server" DataSourceID="SqlDataSourceDegDipCertYr5">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
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
                                    <asp:TextBox ID="DegreesTextBox" runat="server" Text='<%# Bind("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="DiplomasTextBox" runat="server" Text='<%# Bind("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CertificatesTextBox" runat="server" Text='<%# Bind("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
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
                                                <th runat="server">Degrees</th>
                                                <th runat="server">Diplomas</th>
                                                <th runat="server">Certificates</th>
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
                                    <asp:Label ID="DegreesLabel" runat="server" Text='<%# Eval("Degrees") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DiplomasLabel" runat="server" Text='<%# Eval("Diplomas") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CertificatesLabel" runat="server" Text='<%# Eval("Certificates") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceDegDipCertYr5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(Degree) AS Degrees, SUM(Diploma) AS Diplomas, SUM(Certificate) AS Certificates, SUM(Degree) + SUM(Diploma) + SUM(Certificate) AS Total FROM DegDipCert WHERE (ProgramID = @ProgramID) AND (ReviewYear = @ReviewYear)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProgramID" SessionField="SessProgID" Type="String" />
                            <asp:ControlParameter ControlID="LabelDegDipCertYr5" Name="ReviewYear" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

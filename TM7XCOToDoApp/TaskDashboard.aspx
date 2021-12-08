<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskDashboard.aspx.cs" Inherits="TM7XCOToDoApp.TaskDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="m-3">Dashboard</h2>
    
    <div class="container">
        <div class="row">
            <div class="col mx-auto" style="width: 300px;">
                <h3>Daily</h3>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDaily" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="TaskName" HeaderText="Task" SortExpression="TaskName">
                            <ItemStyle BackColor="#17a2b8" ForeColor="White" Height="50px" Width="70%" BorderWidth="2px" CssClass="border-right-0 p-1"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TaskDueDate" HeaderText="Deadline" SortExpression="TaskDueDate">
                            <ItemStyle BackColor="#17a2b8" ForeColor="White" Height="50px" Width="30%" BorderWidth="2px" CssClass="border-left-0"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceDaily" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TaskName], [TaskDueDate] FROM [Tasks] WHERE (([TaskIsCompleted] = @TaskIsCompleted) AND ([TaskDueDate] &lt; GETDATE()+1)) ORDER BY [TaskDueDate]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="TaskIsCompleted" Type="Boolean" />
                        <asp:Parameter DefaultValue="30" Name="TaskID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="col mx-auto" style="width: 300px;">
                <h3>Weekly</h3>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceWeekly" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="TaskName" HeaderText="Task" SortExpression="TaskName">
                            <ItemStyle BackColor="#17a2b8" ForeColor="White" Height="50px" Width="70%" BorderWidth="2px" CssClass="border-right-0 p-1"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TaskDueDate" HeaderText="Deadline" SortExpression="TaskDueDate">
                            <ItemStyle BackColor="#17a2b8" ForeColor="White" Height="50px" Width="30%" BorderWidth="2px" CssClass="border-left-0"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceWeekly" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TaskName], [TaskDueDate] FROM [Tasks] WHERE (([TaskIsCompleted] = @TaskIsCompleted) AND ([TaskDueDate] &gt;= GETDATE()+1) AND ([TaskDueDate] &lt; GETDATE()+7)) ORDER BY [TaskDueDate]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="TaskIsCompleted" Type="Boolean" />
                        <asp:Parameter DefaultValue="30" Name="TaskID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="col mx-auto" style="width: 300px;">
                <h3>Monthly</h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTasksMonthly" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="TaskName" HeaderText="Task" SortExpression="TaskName">
                            <ItemStyle BackColor="#17a2b8" ForeColor="White" Height="50px" Width="70%" BorderWidth="2px" CssClass="border-right-0 p-1"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TaskDueDate" HeaderText="Deadline" SortExpression="TaskDueDate">
                            <ItemStyle BackColor="#17a2b8" ForeColor="White" Height="50px" Width="30%" BorderWidth="2px" CssClass="border-left-0"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceTasksMonthly" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TaskName], [TaskDueDate] FROM [Tasks] WHERE (([TaskIsCompleted] = @TaskIsCompleted) AND ([TaskDueDate] &gt;= GETDATE()+7) AND ([TaskDueDate] &lt;= GETDATE()+30)) ORDER BY [TaskDueDate]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="TaskIsCompleted" Type="Boolean" />
                        <asp:Parameter DefaultValue="30" Name="TaskID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

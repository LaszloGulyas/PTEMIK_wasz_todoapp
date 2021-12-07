<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskDashboard.aspx.cs" Inherits="TM7XCOToDoApp.TaskDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Dashboard</h2>
    <div class="body-content">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTasks">
            <Columns>
                <asp:BoundField DataField="TaskName" HeaderText="TaskName" SortExpression="TaskName" />
                <asp:BoundField DataField="TaskDueDate" HeaderText="TaskDueDate" SortExpression="TaskDueDate" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceTasks" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TaskName], [TaskDueDate] FROM [Tasks] ORDER BY [TaskDueDate]"></asp:SqlDataSource>
    </div>
</asp:Content>

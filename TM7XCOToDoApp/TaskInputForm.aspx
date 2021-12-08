<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskInputForm.aspx.cs" Inherits="TM7XCOToDoApp.TaskInputForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="m-3">Create new task</h2>
    <div class="mx-auto" style="width: 300px;">
        <asp:FormView ID="FormView1" CssClass="m-3" runat="server" DataSourceID="SqlDataSourceTasksInsert" DefaultMode="Insert" DataKeyNames="TaskID">
            <InsertItemTemplate>
                Task:<br />
                <asp:TextBox ID="TaskNameTextBox" style="height:80px; width:100%;"  runat="server" Text='<%# Bind("TaskName") %>' TextMode="MultiLine" />
                <br /><br />
                Description:<br />
                <asp:TextBox ID="TaskDescriptionTextBox" style="height:200px; width:100%" runat="server" Text='<%# Bind("TaskDescription") %>' TextMode="MultiLine" />
                <br /><br />
                Deadline:<br />
                <asp:TextBox ID="TaskDueDateTextBox" style="height:40px; width:100%;" runat="server" Text='<%# Bind("TaskDueDate") %>' TextMode="DateTime" />
                <asp:TextBox ID="TaskDateOfCreationTextBox" runat="server" Text='<%# Bind("TaskDateOfCreation") %>' TextMode="DateTime" Visible="False" />
                <br />
                <div class="col text-center" style="width:280px;">
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Create" CssClass="btn btn-info m-5" OnClick="InsertButton_Click" />
                </div>
            </InsertItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSourceTasksInsert" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Tasks] ([TaskName], [TaskDescription], [TaskDateOfCreation], [TaskDueDate], [TaskIsCompleted]) VALUES (@TaskName, @TaskDescription, @TaskDateOfCreation, @TaskDueDate, @TaskIsCompleted)" OldValuesParameterFormatString="original_{0}" >
            <InsertParameters>
                <asp:Parameter Name="TaskName" Type="String" />
                <asp:Parameter Name="TaskDescription" Type="String" />
                <asp:Parameter Name="TaskDateOfCreation" Type="DateTime" />
                <asp:Parameter Name="TaskDueDate" Type="DateTime" />
                <asp:Parameter Name="TaskIsCompleted" Type="Boolean" DefaultValue="false" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

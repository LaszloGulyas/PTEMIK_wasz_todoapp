<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskInputForm.aspx.cs" Inherits="TM7XCOToDoApp.TaskInputForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="m-3">Create new task</h2>
    <div class="mx-auto" style="width: 300px;">
        <asp:FormView ID="FormViewTaskInput" CssClass="m-3" runat="server" DataSourceID="SqlDataSourceTasksInsert" DefaultMode="Insert" DataKeyNames="TaskID">
            <InsertItemTemplate>
                <p class="font-weight-bold">Task:</p>
                <asp:TextBox ID="TaskNameTextBox" style="height:80px; width:100%;"  runat="server" Text='<%# Bind("TaskName") %>' TextMode="MultiLine" />
                <asp:CustomValidator ID="CVTaskName" runat="server" CssClass="text-danger" Display="Dynamic" ControlToValidate="TaskNameTextBox"
                    ErrorMessage="Task name can't be empty or longer than 50 characters"
                    OnServerValidate="TaskNameTextBox_Validate" ValidateEmptyText="true" >
                </asp:CustomValidator>
                <br /><br />
                <p class="font-weight-bold">Description:</p>
                <asp:TextBox ID="TaskDescriptionTextBox" style="height:200px; width:100%" runat="server" Text='<%# Bind("TaskDescription") %>' TextMode="MultiLine" />
                <asp:CustomValidator ID="CVTaskDescription" runat="server" CssClass="text-danger" Display="Dynamic" ControlToValidate="TaskDescriptionTextBox"
                    ErrorMessage="Description can't be longer than 500 characters"
                    OnServerValidate="TaskDescriptionTextBox_Validate" ValidateEmptyText="false" >
                </asp:CustomValidator>
                <br /><br />
                <p class="font-weight-bold">Deadline:</p>
                <asp:TextBox ID="TaskDueDateTextBox" style="height:40px; width:100%;" runat="server" Text='<%# Bind("TaskDueDate") %>' TextMode="DateTime" />
                <asp:CustomValidator ID="CVTaskDueDate" runat="server" CssClass="text-danger" Display="Dynamic" ControlToValidate="TaskDueDateTextBox"
                    ErrorMessage="Deadline can't be empty and must have valid date/time format"
                    OnServerValidate="TaskDueDateTextBox_Validate" ValidateEmptyText="true" >
                </asp:CustomValidator>
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

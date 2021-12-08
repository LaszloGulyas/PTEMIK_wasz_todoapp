<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskDetails.aspx.cs" Inherits="TM7XCOToDoApp.TaskDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="m-3">Details</h2>
    <div class="mx-auto" style="width: 300px;">
        <asp:FormView ID="FormViewTaskDetails" runat="server" DataKeyNames="TaskID" DataSourceID="SqlDataSourceTaskDetails">
            <EditItemTemplate>
                TaskName:
                <asp:TextBox ID="TaskNameTextBox" runat="server" Text='<%# Bind("TaskName") %>' />
                <br />
                TaskDescription:
                <asp:TextBox ID="TaskDescriptionTextBox" runat="server" Text='<%# Bind("TaskDescription") %>' />
                <br />
                TaskDateOfCreation:
                <asp:TextBox ID="TaskDateOfCreationTextBox" runat="server" Text='<%# Bind("TaskDateOfCreation") %>' ReadOnly="true"/>
                <br />
                TaskDueDate:
                <asp:TextBox ID="TaskDueDateTextBox" runat="server" Text='<%# Bind("TaskDueDate") %>' />
                <br />
                TaskIsCompleted:
                <asp:CheckBox ID="TaskIsCompletedCheckBox" runat="server" Checked='<%# Bind("TaskIsCompleted") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandArgument='<%# Bind("TaskID") %>' CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <ItemTemplate>
                TaskName:
                <asp:Label ID="TaskNameLabel" runat="server" Text='<%# Bind("TaskName") %>' />
                <br />
                TaskDescription:
                <asp:Label ID="TaskDescriptionLabel" runat="server" Text='<%# Bind("TaskDescription") %>' />
                <br />
                TaskDateOfCreation:
                <asp:Label ID="TaskDateOfCreationLabel" runat="server" Text='<%# Bind("TaskDateOfCreation") %>' />
                <br />
                TaskDueDate:
                <asp:Label ID="TaskDueDateLabel" runat="server" Text='<%# Bind("TaskDueDate") %>' />
                <br />
                TaskIsCompleted:
                <asp:CheckBox ID="TaskIsCompletedCheckBox" runat="server" Checked='<%# Bind("TaskIsCompleted") %>' Enabled="false" />
                <br />
                <div class="col text-center" style="width:280px;">
                    <asp:LinkButton ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-info m-5" OnClick="EditButton_Click" />
                </div>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSourceTaskDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [Tasks] WHERE ([TaskID] = @TaskID)"
            UpdateCommand="UPDATE [Tasks] SET [TaskName] = @TaskName, [TaskDescription] = @TaskDescription, [TaskDueDate] = @TaskDueDate, [TaskIsCompleted] = @TaskIsCompleted WHERE [TaskID] = @TaskID">
            <UpdateParameters>
                <asp:Parameter Name="TaskID" Type="Int32"/>
                <asp:Parameter Name="TaskName" Type="String" />
                <asp:Parameter Name="TaskDescription" Type="String" />
                <asp:Parameter Name="TaskDueDate" Type="DateTime" />
                <asp:Parameter Name="TaskIsCompleted" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskDetails.aspx.cs" Inherits="TM7XCOToDoApp.TaskDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="m-3">Details</h2>
    <div class="mx-auto" style="width: 300px;">
        <asp:FormView ID="FormViewTaskDetails" runat="server" DataKeyNames="TaskID" DataSourceID="SqlDataSourceTaskDetails">
            <EditItemTemplate>
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Task:</p>
                <asp:TextBox ID="TaskNameTextBox" runat="server" CssClass="mb-3 mt-1 p-1 w-100 border-secondary" Text='<%# Bind("TaskName") %>' TextMode="MultiLine" />
                <br />
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Description:</p>
                <asp:TextBox ID="TaskDescriptionTextBox" runat="server" CssClass="mb-3 mt-1 p-1 w-100 border-secondary" style="height:200px;" Text='<%# Bind("TaskDescription") %>' TextMode="MultiLine" />
                <br />
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Created:</p>
                <asp:TextBox ID="TaskDateOfCreationTextBox" runat="server" CssClass="border-0 mb-3 mt-1 p-1 w-100" Text='<%# Bind("TaskDateOfCreation") %>' ReadOnly="true" Enabled="false" />
                <br />
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Deadline:</p>
                <asp:TextBox ID="TaskDueDateTextBox" runat="server" CssClass="mb-3 mt-1 p-1 w-100" Text='<%# Bind("TaskDueDate") %>' TextMode="DateTime" />
                <br />                
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Completed:</p>
                <asp:CheckBox ID="TaskIsCompletedCheckBox" runat="server" CssClass="m-2 p-1 border-secondary" Checked='<%# Bind("TaskIsCompleted") %>' TextMode="DateTime" />               
                <br />
                <div class="col text-center my-4" style="width:280px;">                    
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandArgument='<%# Bind("TaskID") %>' CommandName="Update" Text="Update" CssClass="btn btn-info mx-1 d-inline" />
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-info mx-1 d-inline" />
                </div>
            </EditItemTemplate>
            <ItemTemplate>
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Task:</p>
                <asp:TextBox ID="TaskNameLabel" runat="server" CssClass="border-0 mb-3 mt-1 p-1 w-100" Text='<%# Bind("TaskName") %>' Enabled="False" TextMode="MultiLine" />
                <br />
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Description:</p>
                <asp:TextBox ID="TaskDescriptionLabel" runat="server" CssClass="border-0 mb-3 mt-1 p-1 w-100" style="height:200px;" Text='<%# Bind("TaskDescription") %>' Enabled="False" TextMode="MultiLine" />
                <br />
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Created:</p>
                <asp:TextBox ID="TaskDateOfCreationLabel" runat="server" CssClass="border-0 mb-3 mt-1 p-1 w-100" Text='<%# Bind("TaskDateOfCreation") %>' Enabled="False" TextMode="DateTime" />
                <br />
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Deadline:</p>
                <asp:TextBox ID="TaskDueDateLabel" runat="server" CssClass="border-0 mb-3 mt-1 p-1 w-100" Text='<%# Bind("TaskDueDate") %>' Enabled="False" TextMode="DateTime" />
                <br />
                <p class="m-0 font-weight-bold text-light pl-1" style="background-color:slategray">Completed:</p>
                <asp:CheckBox ID="TaskIsCompletedCheckBox" runat="server" CssClass="m-2 p-1" Checked='<%# Bind("TaskIsCompleted") %>' Enabled="false" />
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

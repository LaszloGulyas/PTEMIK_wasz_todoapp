<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskDashboard.aspx.cs" Inherits="TM7XCOToDoApp.TaskDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="m-3">Dashboard</h2>
    <div class="container">
        <div class="row">
            <div class="col mx-auto mb-5" style="width: 300px;">
                <h3 class="p-1" style="background-color: #17a2b8; color: aliceblue;">Daily</h3>
                <asp:GridView ID="GridViewTasksDaily" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTasksDaily" GridLines="None">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:TextBox ID="TaskID" runat="server" Text='<%# Bind("TaskID") %>' Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TaskName" HeaderText="Task" SortExpression="TaskName">
                            <ItemStyle BackColor="SlateGray" ForeColor="White" Height="50px" Width="70%" BorderWidth="2px" CssClass="border-right-0 p-1"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TaskDueDate" HeaderText="Deadline" SortExpression="TaskDueDate">
                            <ItemStyle BackColor="SlateGray" Font-Size="Small" ForeColor="White" Height="50px" Width="30%" BorderWidth="2px" CssClass="border-left-0"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField>
                           <ItemTemplate>
                               <asp:LinkButton ID="BtnTaskDetails" runat="server" CommandArgument='<%# Bind("TaskID") %>' OnClick="taskDetailsButton_Click" CssClass="btn btn-light rounded px-0 py-0 font-weight-bold">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 18">
                                  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                  <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                                </svg>
                               </asp:LinkButton>
                           </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                           <ItemTemplate>
                               <asp:LinkButton ID="BtnTaskDone" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-light rounded px-0 py-0 font-weight-bold">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check2-square" viewBox="0 0 18 18">
                                  <path d="M3 14.5A1.5 1.5 0 0 1 1.5 13V3A1.5 1.5 0 0 1 3 1.5h8a.5.5 0 0 1 0 1H3a.5.5 0 0 0-.5.5v10a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V8a.5.5 0 0 1 1 0v5a1.5 1.5 0 0 1-1.5 1.5H3z"/>
                                  <path d="m8.354 10.354 7-7a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z"/>
                                </svg>
                               </asp:LinkButton>
                           </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceTasksDaily" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [TaskID], [TaskName], [TaskDueDate] FROM [Tasks] WHERE (([TaskIsCompleted] = @TaskIsCompleted) AND ([TaskDueDate] &lt; GETDATE()+1)) ORDER BY [TaskDueDate]"
                    UpdateCommand="UPDATE [Tasks] SET [TaskIsCompleted] = @TaskIsCompleted WHERE [TaskID] = @TaskID">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="TaskIsCompleted" Type="Boolean" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TaskID" Type="Int32"/>
                        <asp:Parameter Name="TaskIsCompleted" Type="Boolean" DefaultValue="True" />
                    </UpdateParameters>
                </asp:SqlDataSource>  
            </div>

            <div class="col mx-auto mb-5" style="width: 300px;">
                <h3 class="p-1" style="background-color: #17a2b8; color: aliceblue;">Weekly</h3>
                <asp:GridView ID="GridViewTasksWeekly" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTasksWeekly" GridLines="None">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:TextBox ID="TaskID" runat="server" Text='<%# Bind("TaskID") %>' Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TaskName" HeaderText="Task" SortExpression="TaskName">
                            <ItemStyle BackColor="SlateGray" ForeColor="White" Height="50px" Width="70%" BorderWidth="2px" CssClass="border-right-0 p-1"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TaskDueDate" HeaderText="Deadline" SortExpression="TaskDueDate">
                            <ItemStyle BackColor="SlateGray" Font-Size="Small" ForeColor="White" Height="50px" Width="30%" BorderWidth="2px" CssClass="border-left-0"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField>
                           <ItemTemplate>
                               <asp:LinkButton ID="BtnTaskDetails" runat="server" CommandArgument='<%# Bind("TaskID") %>' OnClick="taskDetailsButton_Click" CssClass="btn btn-light rounded px-0 py-0 font-weight-bold">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 18">
                                  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                  <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                                </svg>
                               </asp:LinkButton>
                           </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                           <ItemTemplate>
                               <asp:LinkButton ID="BtnTaskDone" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-light rounded px-0 py-0 font-weight-bold">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check2-square" viewBox="0 0 18 18">
                                  <path d="M3 14.5A1.5 1.5 0 0 1 1.5 13V3A1.5 1.5 0 0 1 3 1.5h8a.5.5 0 0 1 0 1H3a.5.5 0 0 0-.5.5v10a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V8a.5.5 0 0 1 1 0v5a1.5 1.5 0 0 1-1.5 1.5H3z"/>
                                  <path d="m8.354 10.354 7-7a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z"/>
                                </svg>
                               </asp:LinkButton>
                           </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceTasksWeekly" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [TaskID], [TaskName], [TaskDueDate] FROM [Tasks] WHERE (([TaskIsCompleted] = @TaskIsCompleted) AND ([TaskDueDate] &gt;= GETDATE()+1) AND ([TaskDueDate] &lt; GETDATE()+7)) ORDER BY [TaskDueDate]"
                    UpdateCommand="UPDATE [Tasks] SET [TaskIsCompleted] = @TaskIsCompleted WHERE [TaskID] = @TaskID">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="TaskIsCompleted" Type="Boolean" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TaskID" Type="Int32"/>
                        <asp:Parameter Name="TaskIsCompleted" Type="Boolean" DefaultValue="True" />
                    </UpdateParameters>
                </asp:SqlDataSource>   
            </div>

            <div class="col mx-auto mb-5" style="width: 300px;">
                <h3 class="p-1" style="background-color: #17a2b8; color: aliceblue;">Monthly</h3>
                <asp:GridView ID="GridViewTasksMonthly" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTasksMonthly" GridLines="None">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:TextBox ID="TaskID" runat="server" Text='<%# Bind("TaskID") %>' Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TaskName" HeaderText="Task" SortExpression="TaskName">
                            <ItemStyle BackColor="SlateGray" ForeColor="White" Height="50px" Width="70%" BorderWidth="2px" CssClass="border-right-0 p-1"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TaskDueDate" HeaderText="Deadline" SortExpression="TaskDueDate">
                            <ItemStyle BackColor="SlateGray" Font-Size="Small" ForeColor="White" Height="50px" Width="30%" BorderWidth="2px" CssClass="border-left-0"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField>
                           <ItemTemplate>
                               <asp:LinkButton ID="BtnTaskDetails" runat="server" CommandArgument='<%# Bind("TaskID") %>' OnClick="taskDetailsButton_Click" CssClass="btn btn-light rounded px-0 py-0 font-weight-bold">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 18">
                                  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                  <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                                </svg>
                               </asp:LinkButton>
                           </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                           <ItemTemplate>
                               <asp:LinkButton ID="BtnTaskDone" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-light rounded px-0 py-0 font-weight-bold">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check2-square" viewBox="0 0 18 18">
                                  <path d="M3 14.5A1.5 1.5 0 0 1 1.5 13V3A1.5 1.5 0 0 1 3 1.5h8a.5.5 0 0 1 0 1H3a.5.5 0 0 0-.5.5v10a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V8a.5.5 0 0 1 1 0v5a1.5 1.5 0 0 1-1.5 1.5H3z"/>
                                  <path d="m8.354 10.354 7-7a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z"/>
                                </svg>
                               </asp:LinkButton>
                           </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceTasksMonthly" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [TaskID], [TaskName], [TaskDueDate] FROM [Tasks] WHERE (([TaskIsCompleted] = @TaskIsCompleted) AND ([TaskDueDate] &gt;= GETDATE()+7) AND ([TaskDueDate] &lt;= GETDATE()+30)) ORDER BY [TaskDueDate]"
                    UpdateCommand="UPDATE [Tasks] SET [TaskIsCompleted] = @TaskIsCompleted WHERE [TaskID] = @TaskID">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="TaskIsCompleted" Type="Boolean" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TaskID" Type="Int32"/>
                        <asp:Parameter Name="TaskIsCompleted" Type="Boolean" DefaultValue="True" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

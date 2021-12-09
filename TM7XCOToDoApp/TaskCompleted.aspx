<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskCompleted.aspx.cs" Inherits="TM7XCOToDoApp.TaskCompleted" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="m-3">Completed</h2>
    <div class="m-5" >
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTasksCompleted" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TaskName" HeaderText="Task" SortExpression="TaskName" >
                    <ItemStyle BorderStyle="None" Height="50px" Width="400px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="TaskDateOfCreation" HeaderText="Created" SortExpression="TaskDateOfCreation" >
                    <ItemStyle Width="200px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="TaskDueDate" HeaderText="Due" SortExpression="TaskDueDate" >
                    <ItemStyle Width="200px"></ItemStyle>
                </asp:BoundField>
            </Columns>

            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#17a2b8" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceTasksCompleted" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [TaskName], [TaskDateOfCreation], [TaskDueDate], [TaskIsCompleted] FROM [Tasks] WHERE ([TaskIsCompleted] = @TaskIsCompleted) ORDER BY [TaskDateOfCreation] DESC" >
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="TaskIsCompleted" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

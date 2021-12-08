using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TM7XCOToDoApp
{
    public partial class TaskDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void taskDetailsButton_Click(object sender, EventArgs e)
        {
            String taskID = ((LinkButton) sender).CommandArgument;
            Response.Redirect("TaskDetails.aspx?id=" + taskID);
        }
    }
}
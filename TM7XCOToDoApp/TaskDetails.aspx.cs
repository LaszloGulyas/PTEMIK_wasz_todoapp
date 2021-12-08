using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TM7XCOToDoApp
{
    public partial class TaskDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                String taskID = Request.QueryString["id"];

                SqlDataSourceTaskDetails.SelectParameters.Add("TaskID", taskID);
            }

        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            FormViewTaskDetails.ChangeMode(FormViewMode.Edit);
        }
    }
}
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

        protected void TaskNameTextBox_Validate(object sender, ServerValidateEventArgs args)
        {
            TextBox textBox = ((TextBox)FormViewTaskDetails.FindControl("TaskNameTextBox"));
            int textLength = textBox.Text.Length;

            if (textLength <= 0 || textLength > 50 || String.IsNullOrEmpty(textBox.Text))
            {
                args.IsValid = false;
            }
        }

        protected void TaskDescriptionTextBox_Validate(object sender, ServerValidateEventArgs args)
        {
            TextBox textBox = ((TextBox)FormViewTaskDetails.FindControl("TaskDescriptionTextBox"));
            int textLength = textBox.Text.Length;

            if (textLength > 500)
            {
                args.IsValid = false;
            }
        }

        protected void TaskDueDateTextBox_Validate(object sender, ServerValidateEventArgs args)
        {
            TextBox textBox = ((TextBox)FormViewTaskDetails.FindControl("TaskDueDateTextBox"));
            int textLength = textBox.Text.Length;
            DateTime dateTime;
            DateTime.TryParse(textBox.Text, out dateTime);

            if (textLength <= 0 || dateTime.Year < 1000)
            {
                args.IsValid = false;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TM7XCOToDoApp
{
    public partial class TaskInputForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            ((TextBox)FormViewTaskInput.FindControl("TaskDateOfCreationTextBox")).Text = DateTime.Now.ToString();
        }

        protected void TaskNameTextBox_Validate(object sender, ServerValidateEventArgs args)
        {
            TextBox textBox = ((TextBox)FormViewTaskInput.FindControl("TaskNameTextBox"));
            int textLength = textBox.Text.Length;

            if (textLength <= 0 || textLength > 50 || String.IsNullOrEmpty(textBox.Text))
            {
                args.IsValid = false;
            }
        }

        protected void TaskDescriptionTextBox_Validate(object sender, ServerValidateEventArgs args)
        {
            TextBox textBox = ((TextBox)FormViewTaskInput.FindControl("TaskDescriptionTextBox"));
            int textLength = textBox.Text.Length;

            if (textLength > 500)
            {
                args.IsValid = false;
            }
        }

        protected void TaskDueDateTextBox_Validate(object sender, ServerValidateEventArgs args)
        {
            TextBox textBox = ((TextBox)FormViewTaskInput.FindControl("TaskDueDateTextBox"));
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
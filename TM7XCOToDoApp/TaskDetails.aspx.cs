﻿using System;
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
            String taskID = Request.QueryString["id"];
        }
    }
}
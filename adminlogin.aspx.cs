using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAP.Admin
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text.ToLower()=="puneetrao" && TextBox2.Text.ToLower()=="puneet@123")
            {
                Response.Redirect("AdminHome.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "invalid()", true);
            }
        }
    }
}
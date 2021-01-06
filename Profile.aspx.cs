using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAP.Users
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getDetails(Session["email"].ToString());
        }

        public void getDetails(String email)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select * from Register where Email='" + email.ToLower() + "'";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    Image1.ImageUrl = dataTable.Rows[0]["Image"].ToString();
                    Label1.Text = dataTable.Rows[0]["Name"].ToString();
                    Label2.Text = dataTable.Rows[0]["Email"].ToString();
                    Label3.Text = dataTable.Rows[0]["Phone_Number"].ToString();
                }
                catch
                {
                    
                }

            }
        }

        protected void LinkUpdate_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("~/Images//") + Path.GetFileName(FileUpload1.FileName));
                String link = "~/Images//" + Path.GetFileName(FileUpload1.FileName);

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
                {
                    String email = Session["email"].ToString();
                    string query = "update Register set Image='" + link + "' where Email='" + email.ToLower()+ "'";
                    SqlCommand command = new SqlCommand(query, connection);
                    DataTable dataTable = new DataTable();
                    SqlDataAdapter adp = new SqlDataAdapter(command);
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                        ScriptManager.RegisterStartupScript(this, GetType(), "updated", "change()", true);
                    }

                    catch
                    {
                        throw;
                    }
                }
            }

            else
            {
                Response.Write("<script>alert('Please select the image by clicking your image and then click update')</script>");
            }
        }
    }
}
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

namespace SAP.Admin
{
    public partial class UpdateCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Image1.ImageUrl!=null && !FileUpload1.HasFile && !FileUpload2.HasFile)
            {
                
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString());
                String query="update Course set Name='"+TextBox1.Text.ToString()+"',Description='"+TextBox2.Text.ToString()+"',Duration='"+TextBox3.Text.ToString()+"'where Id='"+TextBox4.Text+"'";
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    ScriptManager.RegisterStartupScript(this, GetType(), "posted", "ad()", true);
                }
                catch
                {
                    throw;
                }
            }
            else
            {
                FileUpload2.SaveAs(Server.MapPath("~/CourseImage//") + Path.GetFileName(FileUpload2.FileName));
                String link = "~/CourseImage//" + Path.GetFileName(FileUpload2.FileName);
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString());
                String query = "update Course set Name='" + TextBox1.Text.ToString() + "',Description='" + TextBox2.Text.ToString() + "',Duration='" + TextBox3.Text.ToString() + "',Image='" + link + "'where Id='" + TextBox4.Text + "'";
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    ScriptManager.RegisterStartupScript(this, GetType(), "posted", "ad()", true);
                }
                catch
                {
                    throw;
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(Session["Id"]) != 0)
                {
                    using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
                    {
                        string query = "Select * from Course where Id='" + Convert.ToInt32(Session["Id"]) + "'";
                        SqlCommand command = new SqlCommand(query, connection);
                        DataTable dataTable = new DataTable();
                        SqlDataAdapter adp = new SqlDataAdapter(command);
                        try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();
                            adp.Fill(dataTable);
                            TextBox4.Text = dataTable.Rows[0]["Id"].ToString();
                            TextBox1.Text = dataTable.Rows[0]["Name"].ToString();
                            TextBox2.Text = dataTable.Rows[0]["Description"].ToString();
                            TextBox3.Text = dataTable.Rows[0]["Duration"].ToString();
                            Image1.ImageUrl = dataTable.Rows[0]["Image"].ToString();
                            connection.Close();
                        }
                        catch
                        {
                            throw;
                        }

                    }
                }
            }

            catch
            {
                throw;
            }
        }
    }
}
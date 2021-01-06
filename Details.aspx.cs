using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAP
{
    public partial class Details : System.Web.UI.Page
    {
        public String pdf = "";
        public String image = "";
        public String sid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
                {
                    string query = "Select * from Course where Id='" + Convert.ToInt32(Session["cid"]) + "'";
                    SqlCommand command = new SqlCommand(query, connection);
                    DataTable dataTable = new DataTable();
                    SqlDataAdapter adp = new SqlDataAdapter(command);
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        adp.Fill(dataTable);
                        connection.Close();
                        LabelTitle.Text = dataTable.Rows[0]["Name"].ToString();
                        duration.InnerHtml = dataTable.Rows[0]["Duration"].ToString();
                        LabelDescription.Text = dataTable.Rows[0]["Description"].ToString();
                        Image1.ImageUrl = dataTable.Rows[0]["Image"].ToString();
                        pdf = dataTable.Rows[0]["Pdf"].ToString();
                        Sub1.Text = dataTable.Rows[0]["Sub1"].ToString();
                        Sub2.Text = dataTable.Rows[0]["Sub2"].ToString();
                        Sub3.Text = dataTable.Rows[0]["Sub3"].ToString();
                        Sub4.Text = dataTable.Rows[0]["Sub4"].ToString();
                        Sub5.Text = dataTable.Rows[0]["Sub5"].ToString();

                    }
                    catch
                    {
                        throw;
                    }
                }
            }
            catch
            {
                throw;
            }

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx", false);
        }

        protected void ProfileButton_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime dt = DateTime.Now;
                int did = Convert.ToInt32(getStudentId());
                String id = dt.Month.ToString() + ":" + dt.Year.ToString() + ":" +(did+1);
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
                {
                    string query = "insert into StudentDetails(StudentId,Name,Dob,Course,Phone,Image)" +
                        "values('" + id + "','" + TextBoxName1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + image + "')";
                    SqlCommand command = new SqlCommand(query, connection);
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                        ScriptManager.RegisterStartupScript(this, GetType(), "found", "greet()", true);
                    }
                    catch
                    {
                        throw;
                    }
                }
            }
            catch
            {
                throw;
            }
        }
        public String getStudentId()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select Top 1 StudentId from StudentDetails order by StudentId desc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    try
                    {
                        if (dataTable.Rows.Count >= 1)
                        {
                            sid = dataTable.Rows[0]["sid"].ToString();
                            return sid;
                        }
                        else
                        {
                            return "2000";
                        }
                    }
                    catch
                    {
                        return "2000";
                    }
                }
                catch
                {
                    throw;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString());
            String query = "insert into Enquiry(Name,Email,Phone,Country,City,Course)values" +
                "('" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "','"+CourseBox.Text+"')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            String name = pdf.Substring(14);
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + name + "");
            Response.TransmitFile(Server.MapPath(pdf));
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.SuppressContent = true;
            HttpContext.Current.ApplicationInstance.CompleteRequest();
            ScriptManager.RegisterStartupScript(this, GetType(), "found", "greet()", true);
        }
    }
}
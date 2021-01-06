using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAP.Admin
{
    public partial class AdminHome : System.Web.UI.Page
    {
        public String link = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            DeleteCourseListView.Visible = false;
            CourseListView.Visible = false;
            UpdateListView.Visible = false;
            ListViewEnquiry.Visible = false;
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select * from StudentDetails order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    UserListView.DataSource = dataTable;
                    UserListView.DataBind();
                }
                catch
                {

                }

            }

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select * from Enquiry order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    ListViewEnquiry.DataSource = dataTable;
                    ListViewEnquiry.DataBind();
                }
                catch
                {
                    throw;
                }

            }


            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select * from Course order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    DeleteCourseListView.DataSource = dataTable;
                    DeleteCourseListView.DataBind();
                }
                catch
                {

                }

            }

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select * from Course order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    CourseListView.DataSource = dataTable;
                    CourseListView.DataBind();
                }
                catch
                {

                }
            }

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select * from Course order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    UpdateListView.DataSource = dataTable;
                    UpdateListView.DataBind();
                }
                catch
                {

                }

            }

        }

        protected void LinkButtonUser_Click(object sender, EventArgs e)
        {
            UserListView.Visible = true;
            DeleteCourseListView.Visible = false;
            UpdateListView.Visible = false;
            CourseListView.Visible = false;
            ListViewEnquiry.Visible = false;
        }

        protected void LinkButtonCourse_Click(object sender, EventArgs e)
        {
            CourseListView.Visible = true;
            UserListView.Visible = false;
            DeleteCourseListView.Visible = false;
            UpdateListView.Visible = false;
            ListViewEnquiry.Visible = false;
        }

        protected void LinkButtonAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCourse.aspx", false);
        }

        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            UserListView.Visible = false;
            DeleteCourseListView.Visible = true;
            UpdateListView.Visible = false;
            CourseListView.Visible = false;
            ListViewEnquiry.Visible = false;
        }

        protected void LinkButtonUpdate_Click(object sender, EventArgs e)
        {
            UserListView.Visible = false;
            DeleteCourseListView.Visible = false;
            UpdateListView.Visible = true;
            CourseListView.Visible = false;
            ListViewEnquiry.Visible = false;
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void DeleteCourseListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(((Label)e.Item.FindControl("CId")).Text);
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "delete from Course where Id='"+id+"'";
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    ScriptManager.RegisterStartupScript(this, GetType(), "posted", "flush()", true);
                }
                catch
                {

                }

            }
        }

        protected void UpdateListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(((Label)e.Item.FindControl("CId")).Text);
            Session["Id"] = id;
            Response.Redirect("UpdateCourse.aspx", false);
        }

        protected void LinkButtonEnquiry_Click(object sender, EventArgs e)
        {
            UserListView.Visible = false;
            DeleteCourseListView.Visible = false;
            UpdateListView.Visible = false;
            CourseListView.Visible = false;
            ListViewEnquiry.Visible = true;
        }
    }
}
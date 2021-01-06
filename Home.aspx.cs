using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAP.Home
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                trending();
                functional();
                logical();
            }
        }
        protected void LinkCourse_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(Session["status"]) != 0)
                {
                    Response.Redirect("Courses.aspx", false);
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void TrendingListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            String id = ((Label)e.Item.FindControl("LabelId")).Text;
            Session["cid"] = id;
            Response.Redirect("Details.aspx", false);
        }

        protected void LinkTrendingMore_Click(object sender, EventArgs e)
        {
            LinkTrendingLess.Visible = true;
            LinkTrendingMore.Visible = false;

            fcategory.Visible = false;
            lcategory.Visible = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select * from Course where Category='Trending' order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    TrendingListView.DataSource = dataTable;
                    TrendingListView.DataBind();
                }
                catch
                {

                }
            }
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
                {
                    string query = "Select * from Course where Name like '%" + TextBox1.Text.ToLower() + "%'";
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
                                fcategory.Visible = false;
                                lcategory.Visible = false;
                                ctext.InnerHtml = "Results";

                                LinkTrendingMore.Visible = false;

                                TrendingListView.DataSource = dataTable;
                                TrendingListView.DataBind();
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "notfound", "noData()", true);
                                fcategory.Visible = true;
                                lcategory.Visible = true;
                                ctext.InnerHtml = "Trending";

                                LinkTrendingMore.Visible = true;
                            }
                        }

                        catch
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "notfound", "noData()", true);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }
            else
            {
                fcategory.Visible = true;
                lcategory.Visible = true;
                ctext.InnerHtml = "Trending";

                LinkTrendingMore.Visible = true;
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
                {
                    string query = "Select Top 5 * from Course where Category='Trending'";
                    SqlCommand command = new SqlCommand(query, connection);
                    DataTable dataTable = new DataTable();
                    SqlDataAdapter adp = new SqlDataAdapter(command);
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        adp.Fill(dataTable);
                        connection.Close();

                        TrendingListView.DataSource = dataTable;
                        TrendingListView.DataBind();
                    }
                    catch
                    {

                    }
                }
            }
        }

        protected void LinkTrendingLess_Click(object sender, EventArgs e)
        {
            LinkTrendingLess.Visible = false;
            LinkTrendingMore.Visible = true;

            fcategory.Visible = true;
            lcategory.Visible = true;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select Top 5 * from Course where Category='Trending' order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    TrendingListView.DataSource = dataTable;
                    TrendingListView.DataBind();
                }
                catch
                {
                    throw;
                }
            }
        }

        protected void FunctionalListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            String id = ((Label)e.Item.FindControl("LabelId")).Text;
            Session["cid"] = id;
            Response.Redirect("Details.aspx", false);
        }

        protected void FunctionalMoreButton_Click(object sender, EventArgs e)
        {
            FunctionalMoreButton.Visible = false;
            FunctionalLessButton.Visible = true;

            tcategory.Visible = false;
            lcategory.Visible = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select * from Course where Category='Functional' order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    FunctionalListView.DataSource = dataTable;
                    FunctionalListView.DataBind();
                }
                catch
                {

                }
            }
        }

        protected void FunctionalLessButton_Click(object sender, EventArgs e)
        {
            FunctionalMoreButton.Visible = true;
            FunctionalLessButton.Visible = false;

            tcategory.Visible = true;
            lcategory.Visible = true;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select Top 5 * from Course where Category='Functional' order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    FunctionalListView.DataSource = dataTable;
                    FunctionalListView.DataBind();
                }
                catch
                {

                }
            }
        }

        protected void LogicalListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            String id = ((Label)e.Item.FindControl("LabelId")).Text;
            Session["cid"] = id;
            Response.Redirect("Details.aspx", false);
        }

        protected void LogicalLessButton_Click(object sender, EventArgs e)
        {
            LogicalMoreButton.Visible = true;
            LogicalLessButton.Visible = false;

            tcategory.Visible = true;
            fcategory.Visible = true;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select Top 5 * from Course where Category='Logical' order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    LogicalListView.DataSource = dataTable;
                    LogicalListView.DataBind();
                }
                catch
                {

                }
            }
        }

        protected void LogicalMoreButton_Click(object sender, EventArgs e)
        {
            LogicalMoreButton.Visible = false;
            LogicalLessButton.Visible = true;

            tcategory.Visible = false;
            fcategory.Visible = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select * from Course where Category='Logical' order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    LogicalListView.DataSource = dataTable;
                    LogicalListView.DataBind();
                }
                catch
                {

                }
            }
        }

        public void trending()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select Top 5 * from Course where Category='Trending' order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    TrendingListView.DataSource = dataTable;
                    TrendingListView.DataBind();
                }
                catch
                {
                    throw;
                }
            }
        }

        public void functional()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select Top 5 * from Course where Category='Functional' order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    FunctionalListView.DataSource = dataTable;
                    FunctionalListView.DataBind();
                }
                catch
                {
                    throw;
                }
            }
        }

        public void logical()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                string query = "Select Top 5 * from Course where Category='Logical' order by Name asc";
                SqlCommand command = new SqlCommand(query, connection);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    adp.Fill(dataTable);
                    connection.Close();

                    LogicalListView.DataSource = dataTable;
                    LogicalListView.DataBind();
                }
                catch
                {
                    throw;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString());
            String query = "insert into Enquiry(Name,Email,Phone,Country,City,Course)values" +
                "('"+TextBox2.Text+ "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','"+CourseBox.Text+"')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "found", "greet()", true);
        }
    }
}
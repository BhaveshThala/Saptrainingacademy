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
    public partial class AddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("~/Curicullum//") + Path.GetFileName(FileUpload1.FileName));
                FileUpload2.SaveAs(Server.MapPath("~/CourseImage//") + Path.GetFileName(FileUpload2.FileName));
                String link = "~/Curicullum//" + Path.GetFileName(FileUpload1.FileName);
                String link2= "~/CourseImage//" + Path.GetFileName(FileUpload2.FileName);
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
                {
                    String query = "insert into Course(Id,Name,Description,Duration,Pdf,Image,Category,Sub1,Sub2,Sub3,Sub4,Sub5)" +
                        "values(@Id,@Name,@Description,@Duration,@Pdf,@Image,@Category,@Sub1,@Sub2,@Sub3,@Sub4,@Sub5)";
                    SqlCommand command = new SqlCommand(query, connection);

                    command.Parameters.Add("@Id", SqlDbType.NVarChar,50).Value = TextBox4.Text.ToString();
                    command.Parameters.Add("@Name", SqlDbType.NVarChar,100).Value = TextBox1.Text;
                    command.Parameters.Add("@Description", SqlDbType.NVarChar,2000).Value = TextBox2.Text;
                    command.Parameters.Add("@Duration", SqlDbType.NVarChar,20).Value = TextBox3.Text;
                    command.Parameters.Add("@Pdf", SqlDbType.NVarChar,100).Value = link;
                    command.Parameters.Add("@Image", SqlDbType.NVarChar,40).Value = link2;
                    command.Parameters.Add("@Category", SqlDbType.NVarChar, 100).Value = DropDownList1.SelectedItem.Value;
                    command.Parameters.Add("@Sub1", SqlDbType.NVarChar,1000).Value = Sub1.Text;
                    command.Parameters.Add("@Sub2", SqlDbType.NVarChar,1000).Value = Sub2.Text;
                    command.Parameters.Add("@Sub3", SqlDbType.NVarChar,1000).Value = Sub3.Text;
                    command.Parameters.Add("@Sub4", SqlDbType.NVarChar,1000).Value = Sub4.Text;
                    command.Parameters.Add("@Sub5", SqlDbType.NVarChar,1000).Value = Sub5.Text;

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "posted", "ad()", true);
            }
        }
    }
}
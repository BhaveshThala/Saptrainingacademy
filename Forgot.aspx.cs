using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAP.Users
{
    public partial class Forgot : System.Web.UI.Page
    {
        public String x = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (check() == true)
            {
                SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
                smtp.Credentials = new System.Net.NetworkCredential("vbhatia041@gmail.com", "Bhavesh@123");
                smtp.EnableSsl = false;
                System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
                Random r = new Random();
                x = r.Next(1000, 9999).ToString();
                msg.Subject = "Forgot Password";
                msg.Body = "Here is your OTP to Change Your Password '" + x + "'";
                string toaddress = TextBox1.Text;
                msg.To.Add(toaddress);
                string fromaddress = "Sell Together <vbhatia041@gmail.com>";
                msg.From = new MailAddress(fromaddress);
                smtp.Send(msg);
                Session["Value"] = x;
                Response.Redirect("ExtendedForgot.aspx", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "randomtext", "alertme()", true);
            }

        }

        public bool check()
        {
            DataTable data = new DataTable();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                String query = "select * from Register where Email='" + TextBox1.Text.ToLower() +"'";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adp = new SqlDataAdapter(command);
                connection.Open();
                command.ExecuteNonQuery();
                adp.Fill(data);
                connection.Close();
            }
            try
            {
                int count = data.Rows.Count;
                if (count >= 1)
                {
                    Session["forgotemail"] = TextBox1.Text.ToLower();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }

        }
    }
}
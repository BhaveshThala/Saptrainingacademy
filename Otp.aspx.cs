using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAP.Otp
{
    public partial class Otp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Convert.ToInt32(Session["Value"])==Convert.ToInt32(TextBox1.Text.ToString()))
            {
                String name = Session["fname"].ToString();
                String link = Session["link"].ToString();
                String email = Session["email"].ToString();
                String phn = Session["phone"].ToString();
                String pass = Session["password"].ToString();

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
                {
                    String query = "insert into Register(Name,Email,Phone_Number,Password,Image)values('" + name+ "','" + email + "','" + phn + "','" + pass + "','" + link + "')";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    greetings(email,name);

                    notifycompany(email, name, phn);

                    ScriptManager.RegisterStartupScript(this, GetType(), "notfound", "insertData()", true);
                }
            }
            else
            {
                heading.InnerHtml = "Incorret otp";
            }
        }

        public void greetings(String email,String name)
        {
            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            smtp.Credentials = new System.Net.NetworkCredential("vbhatia041@gmail.com", "Bhavesh@123");
            smtp.EnableSsl = false;
            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            Random r = new Random();
            msg.Subject = "Welcome to Sap World";
            msg.Body = "Thank you Mr. "+name+" for registering with us we are here to provide you better sap courses and other information as well" +
                "Login with your credentials and go to home page and download any Course curriculum/syllabus" +
                "In span of 24 hours our trainers will call you." +
                "Thank you for chossing us..";
            string toaddress = email;
            msg.To.Add(toaddress);
            string fromaddress = "Sap Training Academy <vbhatia041@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            smtp.Send(msg);
        }

        public void notifycompany(String email,String name,String phn)
        {
            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            smtp.Credentials = new System.Net.NetworkCredential("vbhatia041@gmail.com", "Bhavesh@123");
            smtp.EnableSsl = false;
            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            Random r = new Random();
            msg.Subject = "New Sap Student Registered";
            msg.Body = "Student Name:  "+name+"" +"\n"+
                "Student Phone Number:  "+phn+"" +"\n"+
                "Student Email:   "+email+"  ";
            string toaddress = "Info@estivaltech.com";
            msg.To.Add(toaddress);
            string fromaddress = "Sap Training Academy <vbhatia041@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            smtp.Send(msg);
        }
    }
}
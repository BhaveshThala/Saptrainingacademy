using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAP.Login
{
    public partial class Login : System.Web.UI.Page
    {
        public String x = "";
        public static int status = 0;
        public static int login_status = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            String email = Request.Form["email"];
            String password = Request.Form["password"];
            if (email != null && password != null)
            {
                getData(email, password);
            }
        }

        public void getData(String email, String password)
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

                    String epass = dataTable.Rows[0]["Password"].ToString();

                    if (dataTable.Rows.Count >= 1 && password == Decryptdata(epass))
                    {
                        Session["email"] = email;
                        Session["status"] = 1;
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "invalid", "invalidData()", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "invalid", "invalidData()", true);
                    Console.WriteLine(ex.Message);
                }

            }

        }

        protected void SignupBtn_Click(object sender, EventArgs e)
        {
            if (status == 1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "error", "showError()", true);
            }
            else
            {
                SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
                smtp.Credentials = new System.Net.NetworkCredential("vbhatia041@gmail.com", "Bhavesh@123");
                smtp.EnableSsl = false;
                System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
                Random r = new Random();
                x = r.Next(1000, 9999).ToString();
                msg.Subject = "OTP";
                msg.Body = "Here is your OTP  '" + x + "'";
                string toaddress = SignupEmail.Text.ToString();
                msg.To.Add(toaddress);
                string fromaddress = "Sap Training Academy <vbhatia041@gmail.com>";
                msg.From = new MailAddress(fromaddress);
                smtp.Send(msg);
                Session["Value"] = x;

                String link = "~/Content//" + "profile.png";
                Session["fname"] = NameBox.Text.ToString();
                Session["email"] = SignupEmail.Text.ToLower();
                Session["phone"] = SignupPhone.Text.ToString();
                Session["link"] = link;

                Session["password"] = encryptpass(SignupPass.Text.ToString());

                Response.Redirect("Otp.aspx", false);
            }
        }

        [System.Web.Services.WebMethod]
        public static string getEmail(String email)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                String query = "select * from Register where Email='" + email + "'";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                connection.Open();
                command.ExecuteNonQuery();
                dataAdapter.Fill(dataTable);
                connection.Close();
                try
                {
                    if (dataTable.Rows.Count != 0)
                    {
                        status = 1;
                        return "1";
                    }
                    else
                    {
                        status = 0;
                        return "0";
                    }
                }
                catch
                {
                    return "0";
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static string getPhone(String phone)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                String query = "select * from Register where Phone_Number='" + phone + "'";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                connection.Open();
                command.ExecuteNonQuery();
                dataAdapter.Fill(dataTable);
                connection.Close();
                try
                {
                    if (dataTable.Rows.Count != 0)
                    {
                        status = 1;
                        return "1";
                    }
                    else
                    {
                        status = 0;
                        return "0";
                    }
                }
                catch
                {
                    return "0";
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static string getloginEmail(String email)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
            {
                String query = "select * from Register where Email='" + email + "'";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                connection.Open();
                command.ExecuteNonQuery();
                dataAdapter.Fill(dataTable);
                connection.Close();
                try
                {
                    if (dataTable.Rows.Count == 0)
                    {
                        login_status = 1;
                        return "0";
                    }
                    else
                    {
                        login_status = 0;
                        return "1";
                    }
                }
                catch
                {
                    login_status = 1;
                    return "0";
                }
            }
        }

        public string encryptpass(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }
        public static string Decryptdata(string encryptpwd)
        {
            string decryptpwd = string.Empty;
            UTF8Encoding encodepwd = new UTF8Encoding();
            Decoder Decode = encodepwd.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
            int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            decryptpwd = new String(decoded_char);
            return decryptpwd;
        }
    }
}
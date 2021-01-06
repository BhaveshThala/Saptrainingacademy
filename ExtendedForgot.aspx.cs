using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAP.Users
{
    public partial class ExtendedForgot : System.Web.UI.Page
    {
        public int match = 0, count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (count != 0)
                Button2_Click(sender, e);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            String query = Session["Value"].ToString();
            match = Convert.ToInt32(query);
            int t2 = Convert.ToInt32(TextBox1.Text);
            if (match == t2)
            {
                makeVisible();
                count++;
            }
            else
            {
                Label1.Text = "Incorrect OTP";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            if (TextBox2.Text == TextBox3.Text)
            {
                String cpass = encryptpass(TextBox2.Text);
                TextBox2.Visible = false;
                TextBox3.Visible = false;
                Button2.Visible = false;

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SapConnection"].ToString()))
                {
                    String query = "update Register set Password='" + cpass + "' where Email='" + Session["forgotemail"].ToString() + "'";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    Label1.Text = "Password Changed Successfully";
                }

            }
        }

        public void makeVisible()
        {
            Label1.Text = "Create Your Password";
            TextBox2.Visible = true;
            TextBox3.Visible = true;
            Button2.Visible = true;
            Button1.Visible = false;
            TextBox1.Visible = false;
            RequiredFieldValidator1.Visible = false;

            RequiredFieldValidator2.Visible = true;
            CompareValidator1.Visible = true;

        }
        public string encryptpass(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }

    }
}
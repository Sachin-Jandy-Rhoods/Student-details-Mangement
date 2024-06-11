using System;
using System.Data;
using System.Data.SqlClient;
namespace App
{
    public partial class Main : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(@" Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Data.mdf;Integrated Security = True");   
            protected void Page_Load(object sender, EventArgs e)  
        {
            if(con.State==ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            Disp_data();
        }
        public void Disp_data()
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from [Table]";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Disp_data();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from [Table] where RegisterNumber='" + txtRegnumber.Text + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                Label.Text = "";
            }
            else
            {
                Label.Text = "Register Number is Incorrect or no records were updated....!";
            }
        }
    }
}
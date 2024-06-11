using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace App
{
    public partial class Edit : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Data.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(txtRegnumber.Text))
            {

                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT Email, PhoneNumber FROM [Table] WHERE RegisterNumber = '" + txtRegnumber.Text + "'";
                SqlDataReader reader = cmd.ExecuteReader();


                if (reader.Read())
                {
                    txtEmail.Text = reader["Email"].ToString();
                    txtNumber.Text = reader["PhoneNumber"].ToString();
                    Label1.Text = "Data retrieved successfully.";
                }
                else
                {
                    Label1.Text = "No data found for the provided Register Number.";
                }

                reader.Close();
            }
            else
            {
                Label1.Text = "Please enter a Register Number.";
            }

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
            Label1.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand checkCmd = con.CreateCommand();
            checkCmd.CommandType = CommandType.Text;
            checkCmd.CommandText = "SELECT COUNT(*) FROM [Table] WHERE RegisterNumber = '" + txtRegnumber.Text + "'";
            int existingCount = (int)checkCmd.ExecuteScalar();

            if (existingCount > 0)
            {
                Label1.Text = "Register Number already exists. Please enter a different one.";
            }
            else
            {

                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO [Table] values('" + txtRegnumber.Text + "','" + txtEmail.Text + "','" + txtNumber.Text + "')";
                cmd.ExecuteNonQuery();

                GridViewRow insertedRow = GridView1.FooterRow; // Adjust this line based on your GridView structure
                if (insertedRow != null)
                {
                    insertedRow.Attributes["class"] = "highlighted-row";
                }

                txtRegnumber.Text = "";
                txtEmail.Text = "";
                txtNumber.Text = "";
                Disp_data();

                Label1.Text = "";
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from [Table] where RegisterNumber ='" + txtRegnumber.Text + "'";
            cmd.ExecuteNonQuery();

            txtRegnumber.Text = "";
            Disp_data();

            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                Response.Redirect("Main.aspx");
            }
            else
            {
                Label1.Text = "Succesfully Deleted....!";

            }

        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Update [Table] set  EMail ='" + txtEmail.Text + "', PhoneNumber ='" + txtNumber.Text + "' where RegisterNumber='" + txtRegnumber.Text + "'";
            cmd.ExecuteNonQuery();

            txtRegnumber.Text = "";
            txtEmail.Text = "";
            txtNumber.Text = "";

            int rowsAffected = cmd.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                Response.Redirect("Main.aspx");
            }
            else
            {
                Label1.Text = "Register Number is Incorrect or no records were updated....!";
            }
            Label1.Text = "";
            Disp_data();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }
    }
}

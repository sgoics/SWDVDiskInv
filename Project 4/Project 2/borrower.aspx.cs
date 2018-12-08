using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Project_2
{
    public partial class borrower : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void submitButton_Click(object sender, EventArgs e)
		{
			if (IsValid)
			{

				// Code that uses the data entered by the user
				// Define data objects
				SqlConnection conn;
				SqlCommand comm;
				// Read the connection string from Web.config
				string connectionString =
					ConfigurationManager.ConnectionStrings["disk_inventory"].ConnectionString;
				// Initialize connection
				conn = new SqlConnection(connectionString);
				// Create command 
				comm = new SqlCommand("exec InsertBorrower @firstName, @lastName, @phone", conn);
				comm.Parameters.Add("@firstName", System.Data.SqlDbType.Char, 20);
				comm.Parameters["@firstName"].Value = firstName.Text;
				comm.Parameters.Add("@lastName", System.Data.SqlDbType.Char, 20);
				comm.Parameters["@lastName"].Value = lastName.Text;
				comm.Parameters.Add("@phone", System.Data.SqlDbType.VarChar, 40);
				comm.Parameters["@phone"].Value = phone.Text;


				// Enclose database code in Try-Catch-Finally
				try
				{
					// Open the connection
					conn.Open();
					// Execute the command
					comm.ExecuteNonQuery();
					// Reload page if the query executed successfully
					Response.Redirect("borrower.aspx");
				}
				catch (SqlException ex)
				{
					// Display error message
					dbErrorMessage.Text = "Error submitting the data!" + ex.Message.ToString();

				}
				finally
				{
					// Close the connection
					conn.Close();
				}
			}

		}

		protected void resetButton_Click(object sender, EventArgs e)
		{
			firstName.Text = "";
			lastName.Text = "";
			phone.Text = "";

		}

		protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
		{

		}
	}
}
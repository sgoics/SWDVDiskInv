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
    public partial class artist1 : System.Web.UI.Page
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
				comm = new SqlCommand("exec InsertArtist @artistFname, @artistLname, @groupName", conn);
				comm.Parameters.Add("@artistFname", System.Data.SqlDbType.Char, 20);
				comm.Parameters["@artistFname"].Value = artistFname.Text;
				comm.Parameters.Add("@artistLname", System.Data.SqlDbType.Char, 20);
				comm.Parameters["@artistLname"].Value = @artistLname.Text;
				comm.Parameters.Add("@groupName", System.Data.SqlDbType.Char, 20);
				comm.Parameters["@groupName"].Value = @groupName.Text;
				
				
				// Enclose database code in Try-Catch-Finally
				try
				{
					// Open the connection
					conn.Open();
					// Execute the command
					comm.ExecuteNonQuery();
					// Reload page if the query executed successfully
					Response.Redirect("artist.aspx");
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
			artistFname.Text = "";
			artistLname.Text = "";
			groupName.Text = "";
			
		}
		
	}
}
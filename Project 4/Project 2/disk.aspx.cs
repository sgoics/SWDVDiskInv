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
    public partial class disk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void submitButton_Click(object sender, EventArgs e)
		{
			if (!IsValid)

			{
				return;
			}
			else{
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
				comm = new SqlCommand("exec InsertDisk @release_date, @disk_name, @genre_ID, @status_ID, @disk_type_ID", conn);
				comm.Parameters.Add("@disk_name", System.Data.SqlDbType.VarChar, 40);
				comm.Parameters["@disk_name"].Value = disk_name.Text;
				comm.Parameters.Add("@release_date", System.Data.SqlDbType.DateTime);
				comm.Parameters["@release_date"].Value = Convert.ToDateTime(release_date.Text);
				comm.Parameters.Add("@status_ID", System.Data.SqlDbType.Int);
				comm.Parameters["@status_ID"].Value = genre_ID.Text;
				comm.Parameters.Add("@genre_ID", System.Data.SqlDbType.Int);
				comm.Parameters["@genre_ID"].Value = status_ID.Text;
				comm.Parameters.Add("@disk_type_ID", System.Data.SqlDbType.Int);
				comm.Parameters["@disk_type_ID"].Value = disk_type_ID.Text;


				// Enclose database code in Try-Catch-Finally
				try
				{
					// Open the connection
					conn.Open();
					// Execute the command
					comm.ExecuteNonQuery();
					// Reload page if the query executed successfully
					Response.Redirect("disk.aspx");
				}
				catch (SqlException ex)
				{
					// Display error message
					dbErrorMessage.Text = "Error submitting the data!" + ex.Message.ToString();
					{
					// Close the connection
					conn.Close();
					}
				}
			
			}

		}

		protected void resetButton_Click(object sender, EventArgs e)
		{
			disk_name.Text = "";
			release_date.Text = "";

		}

		protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
		{

		}

		protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
		{

		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			if (!IsValid)
			{
				return;
			}
			else
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
				comm = new SqlCommand("exec InsertDiskBorrower @disk_ID, @borrower_ID, @borrow_date", conn);				
				comm.Parameters.Add("@disk_ID", System.Data.SqlDbType.Int);
				comm.Parameters["@disk_ID"].Value = txtdiskName.Text;
				comm.Parameters.Add("@borrower_ID", System.Data.SqlDbType.Int);
				comm.Parameters["@borrower_ID"].Value = borrower_ID.Text;
				comm.Parameters.Add("@borrow_date", System.Data.SqlDbType.DateTime);
				comm.Parameters["@borrow_date"].Value = Convert.ToDateTime(borrow_date.Text);				
				// Enclose database code in Try-Catch-Finally
				try
				{
					// Open the connection
					conn.Open();
					// Execute the command
					comm.ExecuteNonQuery();
					// Reload page if the query executed successfully
					Response.Redirect("disk.aspx");
				}
				catch (SqlException ex)
				{
					// Display error message
					dbErrorMessage.Text = "Error submitting the data!" + ex.Message.ToString();
					{
						// Close the connection
						conn.Close();
					}
				}

			}
		}

		
	


		protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{
			if (IsValid)

			{
				return;
			}
			else
			{
				GridViewRow row = GridView1.Rows[e.RowIndex];
				string disk_name = (row.FindControl("disk_name") as TextBox).Text;
				string borrow_date = (row.FindControl("borrow_date") as TextBox).Text;
				string borrowerfName = (row.FindControl("borrowerfName") as TextBox).Text;
				string borrowerlName = (row.FindControl("borrowerlName") as TextBox).Text;
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
				comm = new SqlCommand("exec InsertDiskBorrower @disk_name, @borrow_date, @borrowerfName, @borrowerlName", conn);
				comm.Parameters.AddWithValue("@disk_name", disk_name);
				comm.Parameters.AddWithValue("@borrow_date", borrow_date);
				comm.Parameters.AddWithValue("@borrowerfName", borrowerfName);
				comm.Parameters.AddWithValue("@borrowerlName", borrowerlName);

				// Enclose database code in Try-Catch-Finally
				try
				{
					// Open the connection
					conn.Open();
					// Execute the command
					comm.ExecuteNonQuery();
					// Reload page if the query executed successfully
					Response.Redirect("disk.aspx");
				}
				catch (SqlException ex)
				{
					// Display error message
					dbErrorMessage.Text = "Error submitting the data!" + ex.Message.ToString();
					{
						// Close the connection
						conn.Close();
					}
				}
			}
		}
	}
}
	
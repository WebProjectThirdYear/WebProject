using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebProjectV1.Models;

namespace WebProjectV1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.AddCurrentPage("Home");
                // declare connection string to read from our database
                string connectionString = WebConfigurationManager.ConnectionStrings["SligoEntertainmentDBConnectionString"].ConnectionString;
                SqlConnection myConnection = new SqlConnection(connectionString);

                using (WebClient wc = new WebClient())
                {
                    // variable to indicate number of rows in product table
                    int noOfProducts = CountRows(myConnection);

                    // loop through each product in database to update their columns
                    for (int i = 0; i < noOfProducts; i++)
                    {
                        // retrieve product id and product name of this row
                        int productID = Convert.ToInt32(RetrieveRowData(myConnection, i, "Id"));
                        string productName = RetrieveRowData(myConnection, i, "ProductName");

                        // pull data down from api
                        var json = wc.DownloadString("https://www.omdbapi.com/?t=" + productName);
                        // create a new product object to parse json into
                        ProductOMDb product = new ProductOMDb(json);

                        // now we want to update our database with data from API
                        string commandText = "UPDATE Products SET Genre=@Genre, Year=@Year, Plot=@Plot, Rating=@Rating, Runtime=@Runtime, Poster=@Poster Where Id =" + productID;
                        SqlCommand cmd = new SqlCommand(commandText, myConnection);

                        try
                        {
                            myConnection.Open();
                            //now update the values for the columns for that row
                            cmd.Parameters.AddWithValue("@Genre", product.Genre);
                            cmd.Parameters.AddWithValue("@Year", product.Year);
                            cmd.Parameters.AddWithValue("@Plot", product.Plot);
                            cmd.Parameters.AddWithValue("@Rating", Convert.ToDecimal(product.Rating));
                            cmd.Parameters.AddWithValue("@Runtime", product.Runtime);
                            cmd.Parameters.AddWithValue("@Poster", product.Poster);
                            cmd.Parameters.AddWithValue("@Id", productID);
                            cmd.ExecuteNonQuery();
                        }
                        catch (Exception)
                        {
                            throw;
                        }

                        finally
                        {
                            myConnection.Close();
                        }
                    }
                }
            }
        }

        // method to count the number of rows in a table from the database
        private int CountRows(SqlConnection myConnection)
        {
            SqlCommand myCommand = new SqlCommand();
            myCommand.Connection = myConnection;
            myCommand.CommandType = System.Data.CommandType.Text;
            myCommand.CommandText = string.Format("Select * from Products");

            DataSet ds = new DataSet();
            SqlDataAdapter dap = new SqlDataAdapter(myCommand);

            try
            {
                myConnection.Open();
                dap.Fill(ds, "Products");

                int data = ds.Tables["Products"].Rows.Count;
                return data;
            }
            catch (Exception)
            {

                throw;
            }

            finally
            {
                myConnection.Close();
            }


        }

        // method to retrieve a specific row from a column in a table from the database
        private string RetrieveRowData(SqlConnection myConnection, int rowCnt, string column)
        {
            SqlCommand myCommand = new SqlCommand();
            myCommand.Connection = myConnection;
            myCommand.CommandType = System.Data.CommandType.Text;
            myCommand.CommandText = string.Format("Select * from Products");

            DataSet ds = new DataSet();

            SqlDataAdapter dap = new SqlDataAdapter(myCommand);

            try
            {
                myConnection.Open();
                dap.Fill(ds, "Products");

                string data = ds.Tables["Products"].Rows[rowCnt][column].ToString();
                return data;
            }
            catch
            {
                throw;
            }

            finally
            {
                myConnection.Close();
            }
        }
    }
}
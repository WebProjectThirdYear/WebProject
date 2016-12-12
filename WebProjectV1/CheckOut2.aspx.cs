using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebProjectV1.Models;

namespace WebProjectV1
{
    public partial class CheckOut2 : System.Web.UI.Page
    {
        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection) // if user is not using a secure connection
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "CheckOut2.aspx";
                Response.Redirect(url);
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["UnSecurePath"] + "Confirmation.aspx";
            InsertOrder();
            InsertOrderDetails();
            Response.Redirect(url);

        }

        // use SqlDataSource2 to insert a new row into the Order Details table
        private void InsertOrderDetails()
        {
            cart = CartItemList.GetCart();
            string connectionString = WebConfigurationManager.ConnectionStrings["SligoEntertainmentDBConnectionString"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = myConnection;
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = string.Format("INSERT INTO [dbo].[OrderDetails] ([OrderID]) VALUES ({0}) SELECT Id FROM [dbo].[OrderDetails] INNER JOIN [dbo].[Order] ON [dbo].[Order].CustomerID = {1}", "[dbo].[Order].Id", User.Identity.Name);

                try
                {
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

        // use SqlDataSource1 to insert a new row into Order table
        private void InsertOrder()
        {
            cart = CartItemList.GetCart();
            string connectionString = WebConfigurationManager.ConnectionStrings["SligoEntertainmentDBConnectionString"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);
            myConnection.Open();

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = myConnection;
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "INSERT INTO [dbo].[Order] ([CustomerID], [Total], [HasBeenShipped]) values (@CustomerID, @Total, @HasBeenShipped)";

                cmd.Parameters.AddWithValue("@CustomerID", User.Identity.Name);
                cmd.Parameters.AddWithValue("@Total", cart.TotalCost().ToString());
                cmd.Parameters.AddWithValue("@HasBeenShipped", "true");

                try
                {
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            Session.Remove("Customer");
            Session.Remove("UserCheckOut");
            string url = ConfigurationManager.AppSettings["UnSecurePath"] + "OrderPage.aspx";
            Response.Redirect(url);
        }
    }
}
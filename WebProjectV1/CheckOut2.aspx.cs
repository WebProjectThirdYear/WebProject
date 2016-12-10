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
            //InsertOrderDetails();
            Response.Redirect(url);

        }

        // use SqlDataSource2 to insert a new row into the Order Details table
        private void InsertOrderDetails()
        {
            cart = CartItemList.GetCart();

            string connectionString = WebConfigurationManager.ConnectionStrings["SligoEntertainmentDBConnectionString"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);
            cart = CartItemList.GetCart();

            //string commandText = "INSERT INTO [OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (@Id, @OrderID, @ProductID, @Quantity, @UnitPrice) FROM [OrderDetails] INNER JOIN [Order] ON Order.Customer =;" + User.Identity.Name;

            string commandText = string.Format("INSERT INTO [OrderDetails] ([OrderID]) VALUES ({0}) FROM [OrderDetails] INNER JOIN [Order] ON Order.Customer = {1}", "Order.Id", User.Identity.Name);

            SqlCommand cmd = new SqlCommand(commandText, myConnection);

            cmd.Parameters.Add("@OrderID");
            /*SqlDataSource1.InsertParameters["OrderID"].DefaultValue = UserData[0];
            SqlDataSource1.InsertParameters["ProductID"].DefaultValue = UserData[1];
            SqlDataSource1.InsertParameters["Quantity"].DefaultValue = UserData[2];
            SqlDataSource1.InsertParameters["UnitPrice"].DefaultValue = score.ToString();*/

            try
            {
                SqlDataSource2.Insert();
            }
            catch (Exception)
            {
                throw;
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
                cmd.CommandText = "INSERT INTO Order(CustomerID, Total, HasBeenShipped) values (@CustomerID, @Total, @HasBeenShipped)";

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

            //SqlDataSource1.InsertParameters["CustomerID"].DefaultValue = User.Identity.Name;
            //SqlDataSource1.InsertParameters["Total"].DefaultValue = cart.TotalCost().ToString();
            //SqlDataSource1.InsertParameters["HasBeenShipped"].DefaultValue = "True";

            /*try
            {
                SqlDataSource1.Insert();
            }
            catch (Exception)
            {
                throw;
            }*/
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
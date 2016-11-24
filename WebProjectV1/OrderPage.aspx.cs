using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebProjectV1.Models;

namespace WebProjectV1
{
    public partial class OrderPage : System.Web.UI.Page
    {
        private ProductOMDb selectedProduct;

        protected void Page_Load(object sender, EventArgs e)
        {
            // bind dropdown and set breadcrumb on first load;    
            if (!IsPostBack)
            {
                ddlProducts.DataBind();
                //Master.AddCurrentPage("Home");
            }
            // get and show product data on every load
            selectedProduct = this.GetSelectedProduct();
            lblName.Text = selectedProduct.Name;
            lblGenre.Text = selectedProduct.Genre;
            lblPlot.Text = selectedProduct.Plot;
            lblRuntime.Text = selectedProduct.Runtime;
            lblYear.Text = selectedProduct.Year;
            lblUnitPrice.Text = selectedProduct.UnitPrice.ToString("c") + " each";
            imgProduct.ImageUrl = selectedProduct.Poster;

        }

        private ProductOMDb GetSelectedProduct()
        {
            // get row from SqlDataSource based on value in dropdownlist
            DataView productsTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            productsTable.RowFilter =
                "Id = '" + ddlProducts.SelectedValue + "'";
            DataRowView row = productsTable[0];

            // create a new product object and load with data from row
            ProductOMDb p = new ProductOMDb();
            p.Id = row["Id"].ToString();
            p.Name = row["ProductName"].ToString();
            p.Genre = row["Genre"].ToString();
            p.Plot = row["Plot"].ToString();
            p.Runtime = row["Runtime"].ToString();
            p.Year = row["Year"].ToString();
            p.Rating= row["Rating"].ToString();
            p.UnitPrice = (decimal)row["UnitPrice"];
            p.Poster = row["Poster"].ToString();
            return p;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedProduct.Id];

                //if item isn’t in cart, add it; otherwise, increase its quantity
                if (cartItem == null)
                {
                    cart.AddItem(selectedProduct,
                                 Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                }
                Response.Redirect("OrderPage.aspx");
            }
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["SecurePath"] +
               "CheckOut1.aspx";
            Response.Redirect(url);
        }
    }
    }
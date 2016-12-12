using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using WebProjectV1.Models;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.ModelBinding;
using static WebProjectV1.Models.ProductOMDb;

namespace WebProjectV1
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownGenreFilter.Items.Add("ALL");
                DropDownGenreFilter.SelectedIndex = 10;
                GetAllProducts();                       
                Master.AddBreadcrumbLink("/Default.aspx", "Home");
                Master.AddCurrentPage("Products");          
            }
            
            

        }

        protected void DropDownGenreFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownGenreFilter.SelectedItem.Text == "ALL")
                GetAllProducts(); 
        }

        private void GetAllProducts()
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [Products]";
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
          
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            /* attempt at trying to get the movie title when buy now is clicked 
            and then setting dropdown list index in order page to be that movie*/

            //if (e.Item.ItemType == ListItemType.Item
            //              || e.Item.ItemType == ListItemType.AlternatingItem)
            //{
            //    Button b = e.Item.FindControl("btnAdd") as Button;
            //    DataRowView drv = e.Item.DataItem as DataRowView;
            //    Session["movie"] = (string)drv.Row["ProductName"];
            //}
        }
    }
    }
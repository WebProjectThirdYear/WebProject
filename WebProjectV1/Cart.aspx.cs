﻿using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebProjectV1.Models;

namespace WebProjectV1
{
    public partial class Cart : System.Web.UI.Page
    {
        private CartItemList cart;
        //--
        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CartItemList.GetCart();

            // get total cost for all items in cart
            lblTotalCost.Text = string.Format("Total Cost: {0:C}",cart.TotalCost());

            if(!IsPostBack)
            {
                Master.AddBreadcrumbLink("/Default.aspx", "Home");
                Master.AddCurrentPage("Cart");
                this.DisplayCart();
                CartCount();
            }            
        }

        private void DisplayCart()
        {
            lstCart.Items.Clear();
            CartItem item;

            for (int i = 0; i < cart.Count; i++)
            {
                item = cart[i];
                lstCart.Items.Add(item.Display());
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                    lblMessage.Text = "Select the item you want to remove";
                }
            }

            CartCount();
            
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
            }
            CartCount();
        }

        public void CartCount()
        {
            if (cart.Count == 0)
            {
                btnRemove.Enabled = false;
                btnEmpty.Enabled = false;
                btnCheckOut.Enabled = false;
            }
            else
            {
                btnRemove.Enabled = true;
                btnEmpty.Enabled = true;
                btnCheckOut.Enabled = true;
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["SecurePath"] + "CheckOut1.aspx";
            Response.Redirect(url);
        }
    }
}
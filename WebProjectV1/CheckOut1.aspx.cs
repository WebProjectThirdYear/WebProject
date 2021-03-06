﻿using Microsoft.AspNet.Identity.Owin;
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
    public partial class CheckOut1 : System.Web.UI.Page
    {
        private delegate string CustomerDelegate(string s1, string s2);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownCountys.DataBind();
            }

            if (!User.Identity.IsAuthenticated) // check if user is not logged in
            {
                bool userLoggedIn = false;

                // start a session to say user hasn't logged in yet
                // redirect them to login page
                Session["UserCheckOut"] = userLoggedIn;
                Response.Redirect("Account/Login.aspx");
               
            }

            if (!Request.IsSecureConnection) // if user is not using a secure connection
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "CheckOut1.aspx";
                Response.Redirect(url);
            }
            /*if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                var userName = HttpContext.Current.User;
            }*/

            // get customer details about the logged in User
            Customer cust = new Customer();
            DataView aspUserTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            aspUserTable.RowFilter =
                string.Format("Email = '{0}'", User.Identity.Name);
                //"Email = " + User.Identity.Name;   
            DataRowView row = aspUserTable[0];

           
            cust.FirstName = row["FirstName"].ToString();
            cust.Surname = row["Surname"].ToString();
            cust.DOB = (DateTime)row["DOB"];
            cust.AddressLine1 = row["AddressLine1"].ToString();
            cust.AddressLine2 = row["AddressLine2"].ToString();
            cust.AddressLine3 = row["AddressLine3"].ToString();
            cust.City = row["City"].ToString();
            cust.County = row["County"].ToString();
            cust.PostalCode = row["PostalCode"].ToString();
            cust.Phone = row["Phone"].ToString();

            //populate fields in checkout1 page

            txtFirstName.Text = cust.FirstName;
            txtLastName.Text = cust.Surname;
            txtEmail.Text = User.Identity.Name;
            txtAddress.Text = cust.AddressLine1;
            txtAddress2.Text = cust.AddressLine2;
            txtAddress3.Text = cust.AddressLine3;
            txtCity.Text = cust.City;
            txtPostCode.Text = cust.PostalCode;
            txtPhone.Text = cust.Phone;
            DropDownCountys.SelectedItem.Text = cust.County;

        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "CheckOut2.aspx";
                //create the delegate
                CustomerDelegate d = new CustomerDelegate(Combine);
                string CustomerName = PutTogether(d, txtFirstName.Text, txtLastName.Text);
                //put the customer name in session to be used in confirmation page
                Session["CustomerName"] = CustomerName;
                Response.Redirect(url);
        }

        private string Combine(string s1, string s2)
        {
            // combines the first name and last name together
            return $"{s1} {s2}";
        }

        private string PutTogether(CustomerDelegate d, string s1, string s2)
        {
            //using the delegate to put them together 
            return $"{d(s1, s2)}";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            string url = ConfigurationManager.AppSettings["UnSecurePath"] + "OrderPage.aspx";
            Response.Redirect(url);
        }
    }
}
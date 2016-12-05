using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProjectV1
{
    public partial class CheckOut1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            string url = ConfigurationManager.AppSettings["UnSecurePath"] + "OrderPage.aspx";
            Response.Redirect(url);
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["SecurePath"] + "CheckOut2.aspx";
            Response.Redirect(url);
        }
    }
}
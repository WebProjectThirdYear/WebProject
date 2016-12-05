using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProjectV1
{
    public partial class CheckOut2 : System.Web.UI.Page
    {
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
            Response.Redirect(url);
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
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
    public partial class Confirmation : System.Web.UI.Page
    {
        private CartItemList cart;
        
        protected void Page_Load(object sender, EventArgs e)
        {
          string name = (string)Session["CustomerName"];
          lblConfirm.Text = string.Format("{0} your order has been confirmed", name);
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["UnSecurePath"] + "OrderPage.aspx";
            Session.Remove("CustomerName");
            Response.Redirect(url);
        }
    }
}
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
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

                Session["UserCheckOut"] = userLoggedIn;
                Response.Redirect("Account/Login.aspx");
            }
        }
    }
}
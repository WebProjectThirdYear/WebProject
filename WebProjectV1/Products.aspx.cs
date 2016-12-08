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

        }

        protected void DropDownGenreFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
         
        }

        //public IQueryable<ProductOMDb> Repeater1_GetData1([Control] Genres? DropDownList)
        //{
        //    ProductOMDb db = new ProductOMDb();
        //    var query = db.Genre.Include(s => s.Enrollments.Select(e => e.Course));
        //}

    }
    }
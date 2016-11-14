using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebProjectV1.Models
{
    public class Product
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public string Genre { get; set; }

        public DateTime ReleaseDate { get; set; }

        public double UnitPrice { get; set; }

        public string Description { get; set; }
    }
}
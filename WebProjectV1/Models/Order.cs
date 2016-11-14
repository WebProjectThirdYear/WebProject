using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebProjectV1.Models
{
    public class Order
    {
        [Key]
        public int OrderID { get; set; }

        public decimal Total { get; set; }     

        public bool HasBeenShipped { get; set; }

        public virtual ICollection<OrderDetails> OrderDetails { get; set; }
    }
}
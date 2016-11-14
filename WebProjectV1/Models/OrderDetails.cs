using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebProjectV1.Models
{
    public class OrderDetails
    {
        [Key]
        public int OrderDetailId { get; set; }
        [ForeignKey("order"), Column(Order = 0)]
        public int OrderID { get; set; }
        [ForeignKey("product"), Column(Order = 1)]
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public double UnitPrice { get; set; }
        public virtual Order order { get; set; }
        public virtual Product product { get; set; }
    }
}
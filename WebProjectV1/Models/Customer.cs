using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebProjectV1.Models
{
    public class Customer
    {
        public string FirstName { get; set; }

        public string Surname { get; set; }

        public DateTime DOB { get; set; }

        public string AddressLine1 { get; set; }

        public string AddressLine2 { get; set; }

        public string AddressLine3 { get; set; }

        public string City { get; set; }

        public string County { get; set; }

        public string Phone { get; set; }

        public string PostalCode { get; set; }

        // default ctr
        public Customer()
        {

        }
    }
}
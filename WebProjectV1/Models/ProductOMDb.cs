using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json.Linq;

namespace WebProjectV1.Models
{
    // this is a class to parse json into an object
    // and populate the attributes
    public class ProductOMDb
    {
        public string Genre { get; set; }

        public string ReleaseDate { get; set; }

        public string Plot { get; set; }

        public string Runtime { get; set; }

        public string Rating { get; set; }

        public ProductOMDb(string json)
        {
            JObject jProduct = JObject.Parse(json);
            Genre = (string)jProduct["Genre"];
            ReleaseDate = (string)jProduct["Year"];
            Plot = (string)jProduct["Plot"];
            Runtime = (string)jProduct["Runtime"];
            Rating = (string)jProduct["imdbRating"];
        }
    }
}
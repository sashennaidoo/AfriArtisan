using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Domain.DTOs
{
    public class Product
    {
        public int Code { get; set; }
        public int ProductType { get; set; }
        public string ItemNumber { get; set; }
        public string Description { get; set; }
        public string Dimensions { get; set; }
        public string Colour { get; set; }
        public decimal Cost { get; set; }
        public string Weight { get; set; }
        public DateTime DateAdded { get; set; }
        public List<ProductImage> ProductImages { get; set; }
    }
}

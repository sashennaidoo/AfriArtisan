using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Domain.DTOs
{
    public class ShopItem
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }

        // Quantity * ProductCost
        public decimal ItemCost { get; set; }
    }
}

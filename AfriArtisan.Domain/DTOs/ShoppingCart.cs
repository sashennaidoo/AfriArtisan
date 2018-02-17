using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Domain.DTOs
{
    public class ShoppingCart
    {
        public List<ShopItem> Cart { get; set; }
        public decimal TotalCost { get; set; }
    }
}

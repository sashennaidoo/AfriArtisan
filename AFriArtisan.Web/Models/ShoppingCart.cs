using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AFriArtisan.Web.Models
{
    public class Cart
    {
        public static Cart Current
        {
            get
            {
                var cart = HttpContext.Current.Session["Cart"] as Cart;
                if (null == cart)
                {
                    cart = new Cart();
                    HttpContext.Current.Session["Cart"] = cart;
                }
                return cart;
            }
        }

        public Dictionary<int, decimal> Products { get; set; }
        
    }
}
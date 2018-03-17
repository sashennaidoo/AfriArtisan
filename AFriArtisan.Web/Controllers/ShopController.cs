using AfriArtisan.Domain.DTOs;
using AfriArtisan.Service.Builders;
using AFriArtisan.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace AFriArtisan.Web.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop
        public ActionResult Index(int? productTypeId = null)
        {
            var products = new List<Product>();
            if (productTypeId == null)
                products = new ProductBuilder().GetAllProducts();
            else
                products = new ProductBuilder().GetProductByType(productTypeId.Value);
            return View(products);
        }

        public ActionResult Detail(int productId)
        {
            var product = new ProductBuilder().GetAllProducts().FirstOrDefault(c => c.Code == productId);

            return View(product);
        }

        public JsonResult AddToCart(int productId, int qty)
        {
            var cart = Cart.Current;
            var productQty = decimal.Zero;
            if (cart.Products.TryGetValue(productId, out productQty))
            {
                cart.Products[productId] = productQty + qty;
            }
            else
            {
                cart.Products.Add(productId, qty);
            }
            var cartItems = cart.Products.Count;

            return Json(cartItems, JsonRequestBehavior.AllowGet);

        }

        public ActionResult ViewCart()
        {
            var sessionCart = Cart.Current;
            var shoppingCart = new ShoppingCart();
            var builder = new ProductBuilder();
            foreach(var item in sessionCart.Products)
            {
                var product = builder.GetAllProducts().FirstOrDefault(c => c.Code == item.Key);
                shoppingCart.Cart.Add(new ShopItem
                {
                    ItemCost = product.Cost,
                    Product = product,
                    Quantity = item.Value
                });

            }
            return View(shoppingCart);
        }
    }
}
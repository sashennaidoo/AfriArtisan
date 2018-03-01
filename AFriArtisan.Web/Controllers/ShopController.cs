using AfriArtisan.Domain.DTOs;
using AfriArtisan.Service.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            var cart = ViewData["Cart"];
            if (cart == null)
                cart = new Dictionary<int, decimal>();
            cart.Equals

        }
    }
}
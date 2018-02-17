using AfriArtisan.Service.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AFriArtisan.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //new ProductTypeBuilder().AddProductType("Bracelet", true);
            var prodTypes = new ProductTypeBuilder().GetAllProductTypes();
            var prods = new ProductBuilder().GetProductByType(1);
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
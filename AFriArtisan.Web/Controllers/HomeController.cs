using AfriArtisan.Service.Builders;
using AFriArtisan.Web.Models;
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

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.SendMessage = "";
            var contact = new Contact();
            return View(contact);
        }

        [HttpPost]
        public ActionResult Contact(Contact contact)
        {
            // email the stuff and print a message
            ViewBag.SendMessage = "Your request has been sent!"
        }

    }
}
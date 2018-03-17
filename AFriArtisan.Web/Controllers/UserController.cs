using AfriArtisan.Domain.DTOs;
using AfriArtisan.Service.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AFriArtisan.Web.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult SignIn()
        {
            var user = new SignIn();
            return View(user);
        }

        [HttpPost]
        public ActionResult SignIn(SignIn signIn)
        {
            var user = new UserBuildercs().SignIn(signIn.EmailAddress, signIn.Password);
            // handle invalid credentials
            // if (user == null)
                // return 
            return RedirectToAction("Index", "Shop");
        }

        [HttpGet]
        public ActionResult Signup()
        {
            var signUp = new UserSignUp();

            return View(signUp);
        }

        [HttpPost]
        public ActionResult SignUp(UserSignUp signUp)
        {
            var builder = new UserBuildercs();
            var code = builder.SignUp(signUp);
            var user = builder.GetUser(code);

            return RedirectToAction("Index", "Shop");
        }
    }
}
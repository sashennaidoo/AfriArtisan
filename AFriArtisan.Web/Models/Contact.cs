using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AFriArtisan.Web.Models
{
    public class Contact
    {
        [Required(ErrorMessage = "Please Enter a Subject")]
        public string Subject { get; set; }
        [Required(ErrorMessage = "Please Enter Your Name")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Email is Required")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Please Enter a Message")]
        public string Message { get; set; }
    }
}
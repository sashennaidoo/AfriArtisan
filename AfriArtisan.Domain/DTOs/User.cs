﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Domain.DTOs
{
    public class User
    {
        public int UserCode { get; set; }
        public string EmailAddress { get; set; }
        public string FirsName { get; set; }
        public string Surname { get; set; }
        public DateTime LastLoginDate { get; set; }
        public DateTime DateModified { get; set; }
        //public 
    }
}

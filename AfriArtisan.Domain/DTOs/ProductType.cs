﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Domain.DTOs
{
    public class ProductType
    {
        public int Code { get; set; }
        public string Description { get; set; }
        public bool IsEnabled { get; set; }
    }
}

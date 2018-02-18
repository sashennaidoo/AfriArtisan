using AfriArtisan.Domain.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Domain.DTOs
{
    public class ProductImage
    {
        public ImageType ImageType { get; set; }
        public string ImageLocation { get; set; }
    }
}

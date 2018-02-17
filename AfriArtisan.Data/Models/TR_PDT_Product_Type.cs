using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Data.Models
{
    [Table("TR_PDT_Product_Type")]
    public class TR_PDT_Product_Type
    {
        [Key]
        public int pdt_code { get; set; }
        public string pdt_description { get; set; }
        public bool pdt_enabled { get; set; }
    }
}

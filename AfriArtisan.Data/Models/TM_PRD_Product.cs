using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Data.Models
{
    [Table("TM_PRD_Product")]
    public class TM_PRD_Product
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int prd_code { get; set; }
        public int pdt_code { get; set; }
        [ForeignKey("pdt_code")]
        public virtual TR_PDT_Product_Type ProductType { get; set; }
        public string prd_item_number { get; set; }
        public string prd_item_description { get; set; }
        public string prd_dimensions { get; set; }
        public string prd_colour { get; set; }
        public decimal prd_cost { get; set; }
        public string prd_weight { get; set; }
        public DateTime prd_date_added { get; set; }

        
    }
}

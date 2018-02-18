using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Data.Models
{
    [Table("TR_IMT_Image_type")]
    public class TR_IMT_Image_Type
    {
        [Key]
        public int imt_code { get; set; }
        public string imt_type { get; set; }
    }
}

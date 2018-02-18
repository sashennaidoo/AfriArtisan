using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Data.Models
{
    [Table("TA_PIL_Product_Image_Location")]
    public class TA_PIL_Product_Image_Location
    {
        public int pil_code { get; set; }

        public int prd_code { get; set; }
        [ForeignKey("prd_code")]
        public virtual TM_PRD_Product Product { get; set; }

        public int imt_code { get; set; }
        [ForeignKey("imt_code")]
        public virtual TR_IMT_Image_Type ImageType { get; set; }

        public string pil_image_location { get; set; }
        
    }
}

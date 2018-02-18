using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Data.Models
{
    [Table("TM_USR_User")]
    public class TM_USR_User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int usr_code { get; set; }
        public string usr_email_address { get; set; }
        public string usr_password { get; set; }
        public string usr_first_name { get; set; }
        public string usr_surname { get; set; }
        public DateTime usr_date_modified { get; set; }
        public DateTime? usr_last_login_date { get; set; }
        public bool usr_enabled { get; set; }
    }
}

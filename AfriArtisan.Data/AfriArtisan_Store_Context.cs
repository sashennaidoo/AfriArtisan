using AfriArtisan.Data.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Data
{
    public partial class AfriArtisan_Store_Context : DbContext
    {
        public virtual DbSet<TR_PDT_Product_Type> ProductTypes { get; set; }
        public virtual DbSet<TM_PRD_Product> Products { get; set; }

        public AfriArtisan_Store_Context()
            :base("name=AfriArtisan")
        {
            Database.SetInitializer<AfriArtisan_Store_Context>(new MariaDbInitializer());
        }

        
    }
}

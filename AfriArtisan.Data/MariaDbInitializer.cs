using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AfriArtisan.Data
{
    public class MariaDbInitializer : CreateDatabaseIfNotExists<AfriArtisan_Store_Context>
    {
        protected override void Seed(AfriArtisan_Store_Context context)
        {
            base.Seed(context);
        }
    }
}

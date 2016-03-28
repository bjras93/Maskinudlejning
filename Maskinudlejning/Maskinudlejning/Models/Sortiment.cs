using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Maskinudlejning.Models
{
    public class Sortiment
    {
        public int Id { get; set; }
        public string partNo { get; set; }
        public string group { get; set; }
        public string description { get; set; }
        public string size { get; set; }
        public string force { get; set; }
        public int rentday { get; set; }
        public decimal price { get; set; }


    }
}
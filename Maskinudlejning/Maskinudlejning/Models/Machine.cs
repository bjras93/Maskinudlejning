using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Maskinudlejning.Models
{
    public class Machine
    {
        public int Id { get; set; }
        public string machineName { get; set; }
        public string information { get; set; }
        public string description { get; set; }
        public string picture { get; set; }
        public decimal price { get; set; }


    }
}
using Maskinudlejning.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web;
using Umbraco.Web.WebApi;

namespace Maskinudlejning.Controllers
{
    public class MachineApiController : UmbracoApiController
    {
        // GET: Cart
        public Machine GetMachine(int id)
        {
            UmbracoHelper help = new UmbracoHelper(UmbracoContext);
            var content = help.TypedContent(id);
            return new Machine
            {
                Id = content.Id,
                machineName = content.GetPropertyValue<string>("machineName"),
                information = content.GetPropertyValue<string>("information"),
                description = content.GetPropertyValue<string>("description"),
                picture = content.GetPropertyValue<string>("picture"),
                price = content.GetPropertyValue<decimal>("price"),
            };
        }

    }
}
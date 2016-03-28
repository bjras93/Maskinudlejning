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
    public class SortimentController : UmbracoApiController
    {
        // GET: Cart
        public Sortiment GetSortiment(int id)
        {
            UmbracoHelper help = new UmbracoHelper(UmbracoContext);
            var content = help.TypedContent(id);
            return new Sortiment
            {
                Id = content.Id,
                partNo = content.GetPropertyValue<string>("partNo"),
                group = content.GetPropertyValue<string>("group"),
                description = content.GetPropertyValue<string>("description"),
                size = content.GetPropertyValue<string>("size"),
                force = content.GetPropertyValue<string>("force"),
                rentday = content.GetPropertyValue<int>("rentday"),
                price = content.GetPropertyValue<decimal>("price"),
            };
        }
    }
}
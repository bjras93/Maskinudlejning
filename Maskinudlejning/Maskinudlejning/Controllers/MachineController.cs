﻿using Maskinudlejning.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web;

namespace Maskinudlejning.Controllers
{
    public class MachineController : Umbraco.Web.Mvc.SurfaceController
    {
        // GET: Machine
        [HttpGet]
        public ActionResult GetMachine(string id)
        {
            UmbracoHelper help = new UmbracoHelper(UmbracoContext);
            var content = help.TypedContent(id);
            var model = new Machine
            {
                Id = content.Id,
                machineName = content.GetPropertyValue<string>("machineName"),
                information = content.GetPropertyValue<string>("information"),
                description = content.GetPropertyValue<string>("description"),
                picture = Umbraco.Media(content.GetPropertyValue<string>("picture")).Url,
                price = content.GetPropertyValue<decimal>("price"),
            };
            return PartialView("GetMachine", model);
        }
    }
}
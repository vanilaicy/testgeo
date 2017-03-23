using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using EPiServer;
using EPiServer.Core;
using EPiServer.Framework.DataAnnotations;
using EPiServer.Web.Mvc;
using TestEpiform.Models.Pages;
using EPiServer.Personalization;
using EPiServer.Personalization.Providers.MaxMind;
//Geolocation.Provider as GeolocationProvider

namespace TestEpiform.Controllers
{
    public class GeoLocationPageController : PageControllerBase<GeoLocationPage>
    {
        public ActionResult Index(GeoLocationPage currentPage)
        {
            /* Implementation of action. You can create your own view model class that you pass to the view or
             * you can pass the page type for simpler templates */

            return View(currentPage);
        }
    }

   
}

//public static IGeolocationResult GetCurrentUsersLocation()
//{
//    var geoLocationProvider = Geolocation.Provider as GeolocationProvider;
//    var ipAddress = GetUsersIp();
//    return geoLocationProvider.Lookup(ipAddress)
//         }
//protected string GetUsersIp()
//{
//    if (context == null || context.Request == null)
//        return string.Empty;
//    if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
//        return HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
//    if (HttpContext.Current.Request.UserHostAddress.Length != 0)
//        return HttpContext.Current.Request.UserHostAddress;
//    return string.Empty;
//}
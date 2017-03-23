using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using EPiServer;
using EPiServer.Core;
using EPiServer.Framework.DataAnnotations;
using EPiServer.Web.Mvc;
using TestEpiform.Models.Pages;
using TestEpiform.Models.Properties;
using EPiServer.Personalization.Providers.MaxMind;

namespace TestEpiform.Controllers
{
    public class OfficeLocationPageController : PageControllerBase<OfficeLocationPage>
    {
        private static readonly log4net.ILog Log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public ActionResult Index(OfficeLocationPage currentPage)
        {

            IList<OfficeLocated> model = GetOfficesFromSubPagesInEpiServer();

            ViewBag.ClientLocation = GetClientLocationByIp();

            return View(model);
        }

        private OfficeLocated GetClientLocationByIp()
        {
            OfficeLocated retval = new OfficeLocated();

            try
            {
                using (var reader = new DatabaseReader("GeoLite2Db/GeoLite2-City.mmdb"))
                {
                    // Replace "City" with the appropriate method for your database, e.g.,
                    // "Country".
                    string clientIp = Request.UserHostAddress;
                    var city = reader.City(clientIp);


                    retval.AvdelningName = city.City.Name;


                    retval.LocationX = city.Location.Latitude.HasValue ? city.Location.Latitude.Value : 59.3252315;
                    retval.LocationY = city.Location.Longitude.HasValue ? city.Location.Longitude.Value : 18.0599355;
                    if (!city.Location.Latitude.HasValue || !city.Location.Longitude.HasValue)
                    {
                        retval.AvdelningName = "Osäker position";
                        retval.LocationX = 59.3252315;
                        retval.LocationY = 18.0599355;
                    }
                }
            }
            catch
            {
                retval.AvdelningName = "Osäker position";
                retval.LocationX = 59.3252315;
                retval.LocationY = 18.0599355;
            }

            return retval;
        }


        private IList<OfficeLocated> GetOfficesFromSubPagesInEpiServer()
        {
            IList<OfficeLocated> officeLocations = new List<OfficeLocated>();

            officeLocations.Add(new OfficeLocated() { OfficeLocationID = 1, AvdelningName = "Sollentuna Centrum", LocationX = 59.4283682, LocationY = 17.9507594 });
            officeLocations.Add(new OfficeLocated() { OfficeLocationID = 2, AvdelningName = "Stinsen Häggvik", LocationX = 59.4367469, LocationY = 17.9362318 });
            officeLocations.Add(new OfficeLocated() { OfficeLocationID = 3, AvdelningName = "Friends Arena", LocationX = 59.3717495, LocationY = 17.9908945 });
            officeLocations.Add(new OfficeLocated() { OfficeLocationID = 4, AvdelningName = "Sergels Torg", LocationX = 59.3504345, LocationY = 18.0419199 });
            //officeLocations.Add(new OfficeLocation() { OfficeLocationID = 5, Name = "Metamatrix", LocationX = 59.3159672, LocationY = 18.0347773 });
            //officeLocations.Add(new OfficeLocation() { OfficeLocationID = 6, Name = "Scandic Nyköping", LocationX = 58.7515653, LocationY = 17.0024674 });
            //officeLocations.Add(new OfficeLocation() { OfficeLocationID = 7, Name = "Sofiakyrkan Jönköping", LocationX = 57.7823193, LocationY = 14.1595065 });
            //officeLocations.Add(new OfficeLocation() { OfficeLocationID = 8, Name = "Göteborgs Universitet", LocationX = 57.6946717, LocationY = 11.9701839 });

            return officeLocations;
        }
    }
}
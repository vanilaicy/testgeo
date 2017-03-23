using EPiServer.Core;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace TestEpiform.Models.Properties
{
    public class OfficeLocationProperty : PropertyList<OfficeLocated>
    {
        protected override OfficeLocated ParseItem(string value)
        {
            try
            {
                return JsonConvert.DeserializeObject<OfficeLocated>(value);
            }
            catch (Exception ex)
            {
                Debug.WriteLine("ERROR! LanMailAvdelningProperty.ParseItem" + ex.Message);
                return new OfficeLocated { AvdelningName = "FEL", Address = "FEL" };
            }
        }

        public override PropertyData ParseToObject(string value)
        {
            try
            {
                ParseToSelf(value);
            }
            catch (Exception ex)
            {
                Debug.WriteLine("ERROR! LanMailAvdelningProperty.ParseToObject" + ex.Message);
            }
            return this;
        }
    }

    public class OfficeLocated
    {
        public int OfficeLocationID { get; set; }

        public string AvdelningName { get; set; }

        public string Address { get; set; }

        //X as latitude
        public double LocationX { get; set; }

        public string LocXString
        {
            get
            {
                return LocationX.ToString().Replace(",", ".");
            }
        }

        // Y as longitude
        public double LocationY { get; set; }
        public string LocYString
        {
            get
            {
                return LocationY.ToString().Replace(",", ".");
            }
        }
    }
}
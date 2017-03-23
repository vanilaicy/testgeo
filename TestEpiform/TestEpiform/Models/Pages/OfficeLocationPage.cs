using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.SpecializedProperties;
using EPiServer.Shell.ObjectEditing;
using EPiServer.Cms.Shell.UI.ObjectEditing.EditorDescriptors;
using TestEpiform.Models.Properties;
using System.Collections.Generic;

namespace TestEpiform.Models.Pages
{
    [ContentType(DisplayName = "OfficeLocation", GUID = "e237a4cf-be60-4856-88d9-ee6f16af41f3", Description = "")]
    public class OfficeLocationPage : SitePageData
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


        [EditorDescriptor(EditorDescriptorType = typeof(CollectionEditorDescriptor<OfficeLocated>))]
        public virtual IList<OfficeLocated> OfficeLocateds { get; set; }
    }
}
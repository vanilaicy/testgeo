using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.SpecializedProperties;

namespace TestEpiform.Models.Pages
{
    [ContentType(DisplayName = "GeoLocationPage", GUID = "626347f3-341d-4176-a453-1f52d3494092", Description = "")]
    public class GeoLocationPage : SitePageData
    {

        //[CultureSpecific]
        //[Display(
        //    Name = "Main body",
        //    Description = "The main body will be shown in the main content area of the page, using the XHTML-editor you can insert for example text, images and tables.",
        //    GroupName = SystemTabNames.Content,
        //    Order = 1)]
        //public virtual XhtmlString MainBody { get; set; }



    }
}
using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.Forms.Core;
using EPiServer.ServiceLocation;
using EPiServer.Web.Routing;

namespace TestEpiform.Models.Blocks
{
    [ContentType(
        DisplayName = "PageNameFieldBlock", 
        GUID = "7b44d26f-df24-4dae-ba5e-d955024c17b4", 
        Description = "")]
    public class PageNameFieldBlock : ElementBlockBase
    {
        public string PageName
        {
            get
            {
                var pageHandler = ServiceLocator.Current.GetInstance<IPageRouteHelper>();
                return pageHandler.Page.PageName;
            }
        }
    }
}
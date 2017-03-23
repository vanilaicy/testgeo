using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestEpiform.Models.Pages;

namespace TestEpiform.Models.ViewModels
{
    public class OfficeLocationviewModel : PageViewModel<OfficeLocationPage>
    {
        public OfficeLocationviewModel(OfficeLocationPage currentPage) : base(currentPage)
        {
        }

        public IEnumerable<OfficeLocationPage> Items { get; set; }
    }
}
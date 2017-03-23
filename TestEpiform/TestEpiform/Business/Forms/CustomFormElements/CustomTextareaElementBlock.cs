using System;
using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using EPiServer.Forms.Implementation.Elements;

namespace TestEpiform.Business.Forms.CustomFormElements
{
    [ContentType(
        DisplayName = "Custom Textarea", 
        GUID = "46ae75b4-c3ac-4241-9c38-495983ada42a", 
        Description = "",
        GroupName = "Metamatrix form elements")]
    public class CustomTextareaElementBlock : TextareaElementBlock
    {
        [Display(
            GroupName = SystemTabNames.Content, 
            Order = 1, 
            Name = "Max field length", 
            Description = "The maximum length of the input field"
            )]
        [CultureSpecific]
        public virtual int MaxLength { get; set; }

        public override void SetDefaultValues(ContentType contentType)
        {
            base.SetDefaultValues(contentType); MaxLength = 0;
        }
    }
}
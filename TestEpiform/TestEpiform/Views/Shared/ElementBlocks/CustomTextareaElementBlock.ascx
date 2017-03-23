<%@ Import Namespace="System.Web.Mvc" %>
<%@ Import Namespace="EPiServer.Forms.Helpers.Internal" %>
<%@ Import Namespace="EPiServer.Forms.Implementation.Elements" %>
<%@ Control Language="C#" Inherits="ViewUserControl<TestEpiform.Business.Forms.CustomFormElements.CustomTextareaElementBlock>" %>


<%  var formElement = Model.FormElement; 
    var labelText = Model.Label;
    var errorMessage = Model.GetErrorMessage();
    var maxLength = Model.MaxLength;
%>

<div class="Form__Element FormTextbox FormTextbox--Textarea <%: Model.GetValidationCssClasses() %>" data-epiforms-element-name="<%: formElement.ElementName %>">
    <label for="<%: formElement.Guid %>" class="Form__Element__Caption"><%: labelText %></label>
    <textarea name="<%: formElement.ElementName %>" id="<%: formElement.Guid %>" class="FormTextbox__Input"
        placeholder="<%: Model.PlaceHolder %>" data-epiforms-label="<%: labelText %> "maxlength="<%: maxLength %>"
        <%= Model.AttributesString %>><%: Model.GetDefaultValue() %> </textarea>
    <span data-epiforms-linked-name="<%: formElement.ElementName %>" class="Form__Element__ValidationError" style="<%: string.IsNullOrEmpty(errorMessage) ? "display:none" : "" %>;"><%: errorMessage %></span>
</div>

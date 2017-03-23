<%@ Import Namespace="System.Web.Mvc" %>
<%@ Import Namespace="EPiServer.Forms.Helpers.Internal" %>
<%@ Import Namespace="EPiServer.Forms.Implementation.Elements" %>
<%@ Control Language="C#" Inherits="ViewUserControl<NumberElementBlock>" %>

<%  var formElement = Model.FormElement; 
    var labelText = Model.Label;
    var errorMessage = Model.GetErrorMessage();
%>

<div class="Form__Element FormTextbox FormTextbox--Number <%: Model.GetValidationCssClasses() %>" data-epiforms-element-name="<%: formElement.ElementName %>">
    <label for="<%: formElement.Guid %>" class="Form__Element__Caption"><%: labelText %></label>
    <input name="<%: formElement.ElementName %>" id="<%: formElement.Guid %>" type="text" placeholder="<%: Model.PlaceHolder %>"
        class="FormTextbox__Input"
        <%: Html.Raw(Model.AttributesString) %>
        value="<%: Model.GetDefaultValue() %>" />
    <span data-epiforms-linked-name="<%: formElement.ElementName %>" class="Form__Element__ValidationError" style="<%: string.IsNullOrEmpty(errorMessage) ? "display:none" : "" %>;"><%: errorMessage %></span>
    <%= Model.RenderDataList() %>
</div>

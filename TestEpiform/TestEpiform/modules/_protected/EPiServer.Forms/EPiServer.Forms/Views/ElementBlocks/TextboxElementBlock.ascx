<%@ import namespace="System.Web.Mvc" %>
<%@ import namespace="EPiServer.Forms.Helpers.Internal" %>
<%@ import namespace="EPiServer.Forms.Implementation.Elements" %>
<%@ control language="C#" inherits="ViewUserControl<TextboxElementBlock>" %>

<%
    var formElement = Model.FormElement; 
    var labelText = Model.Label;
    var errorMessage = Model.GetErrorMessage();
%>

<div class="Form__Element FormTextbox <%: Model.GetValidationCssClasses() %>" data-epiforms-element-name="<%: formElement.ElementName %>">
    <label for="<%: formElement.Guid %>" class="Form__Element__Caption"><%: labelText %></label>
    <input name="<%: formElement.ElementName %>" id="<%: formElement.Guid %>" type="text" class="FormTextbox__Input"
        placeholder="<%: Model.PlaceHolder %>" value="<%: Model.GetDefaultValue() %>" <%: Html.Raw(Model.AttributesString) %> />

    <span data-epiforms-linked-name="<%: formElement.ElementName %>" class="Form__Element__ValidationError" style="<%: string.IsNullOrEmpty(errorMessage) ? "display:none" : "" %>;"><%: errorMessage %></span>
    <%= Model.RenderDataList() %>
</div>
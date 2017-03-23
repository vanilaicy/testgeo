<%@ import namespace="System.Web.Mvc" %>
<%@ import namespace="EPiServer.Forms.Helpers.Internal" %>
<%@ import namespace="EPiServer.Forms.Implementation.Elements" %>
<%@ control language="C#" inherits="ViewUserControl<FileUploadElementBlock>" %>

<%  var formElement = Model.FormElement; 
    var labelText = Model.Label;
    var errorMessage = Model.GetErrorMessage();
    var allowMultiple = Model.AllowMultiple ? "multiple" : string.Empty;
%>

<div class="Form__Element FormFileUpload <%: Model.GetValidationCssClasses() %>" data-epiforms-element-name="<%: formElement.ElementName %>" >
    <label for="<%: formElement.Guid %>" class="Form__Element__Caption"><%: labelText %></label>
    <input name="<%: formElement.ElementName %>" id="<%: formElement.Guid %>" type="file" class="FormFileUpload__Input" <%:allowMultiple%>
        <% if(!string.IsNullOrEmpty(Model.FileExtensions)) { %>
			accept="<%=Model.FileExtensions%>"
    	<%}%>     
        <%= Model.AttributesString %> />
    <div class="FormFileUpload__PostedFile"></div>
    <div data-epiforms-linked-name="<%: formElement.ElementName %>" class="Form__Element__ValidationError" style="<%: string.IsNullOrEmpty(errorMessage) ? "display:none" : "" %>;"><%: errorMessage %></div>
</div>

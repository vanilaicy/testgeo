﻿<%@ import namespace="System.Web.Mvc" %>
<%@ import namespace="EPiServer.Forms.Helpers.Internal" %>
<%@ import namespace="EPiServer.Forms.Implementation.Elements" %>
<%@ control language="C#" inherits="ViewUserControl<ChoiceElementBlock>" %>

<%
    var formElement = Model.FormElement;
    var labelText = Model.Label;
    var items = Model.GetItems();
    var errorMessage = Model.GetErrorMessage();
%>

<div class="Form__Element FormChoice <%: Model.GetValidationCssClasses() %>" id="<%: formElement.Guid %>" data-epiforms-element-name="<%: formElement.ElementName %>"
    <%= Model.AttributesString %>>

    <%  if(!string.IsNullOrEmpty(labelText)) { %>
    <span class="Form__Element__Caption"><%: labelText %></span>
    <% } 
        foreach (var item in items)
        {
            var defaultCheckedString = Model.GetDefaultSelectedString(item);
            var checkedString = string.IsNullOrEmpty(defaultCheckedString) ? string.Empty : "checked";
    %>

    <label>
        <% if(Model.AllowMultiSelect) { %>
        <input type="checkbox"  name="<%: formElement.ElementName %>" value="<%: item.Value %>" class="FormChoice__Input FormChoice__Input--Checkbox" <%: checkedString %>   <%: defaultCheckedString %> />
        <% } else  { %>
        <input type="radio"     name="<%: formElement.ElementName %>" value="<%: item.Value %>" class="FormChoice__Input FormChoice__Input--Radio"    <%: checkedString %>   <%: defaultCheckedString %> />
        <% } %>
        <%: item.Caption %></label>

    <% } %>
    <span data-epiforms-linked-name="<%: formElement.ElementName %>" class="Form__Element__ValidationError" style="<%: string.IsNullOrEmpty(errorMessage) ? "display:none" : "" %>;"><%: errorMessage %></span>
</div>
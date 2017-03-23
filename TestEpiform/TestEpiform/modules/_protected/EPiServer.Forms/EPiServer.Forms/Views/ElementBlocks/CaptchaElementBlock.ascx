<%@ import namespace="System.Web.Mvc" %>
<%@ Import Namespace="EPiServer.Forms" %>
<%@ import namespace="EPiServer.Forms.Implementation.Elements" %>
<%@ control language="C#" inherits="ViewUserControl<CaptchaElementBlock>" %>

<%  var formElement = Model.FormElement; 
    var labelText = Model.Label;
    var errorMessage = Model.GetErrorMessage(); %>

<div class="Form__Element FormCaptcha" data-epiforms-element-name="<%: formElement.ElementName %>" >
    <label class="Form__Element__Caption" for="<%: formElement.Guid %>">
        <%: labelText %>
        <button name="submit" type="submit" data-epiforms-captcha-image-handler="<%: formElement.Guid %>" value="<%: SubmitButtonType.RefreshCaptcha.ToString() %>"
            class="FormExcludeDataRebind FormCaptcha__Refresh">
            <%: Html.Translate("/episerver/forms/viewmode/refreshcaptcha")%>
        </button>

    </label>
    <img src="<%: Model.CaptchaImageHandler %>" class="FormCaptcha__Image" />
    <input id="<%: formElement.Guid %>" name="<%: formElement.ElementName %>" type="text" class="FormTextbox__Input FormCaptcha__Input FormHideInSummarized" />
    
    <span data-epiforms-linked-name="<%: formElement.ElementName %>" class="Form__Element__ValidationError" style="<%: string.IsNullOrEmpty(errorMessage) ? "display:none" : "" %>;"><%: errorMessage %></span>
</div>

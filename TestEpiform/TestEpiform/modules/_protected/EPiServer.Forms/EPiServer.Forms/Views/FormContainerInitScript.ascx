<%@ import namespace="EPiServer.Forms.Helpers.Internal" %>
<%@ import namespace="EPiServer.Forms.EditView.Internal" %>
<%@ import namespace="EPiServer.Forms.Implementation.Elements" %>
<%@ control language="C#" inherits="ViewUserControl<FormContainerBlock>" %>

<%  
    var _formParagraphTextService = EPiServer.ServiceLocation.ServiceLocator.Current.GetInstance<EPiServer.Forms.Internal.FormParagraphTextService>();
    var _formConfig = EPiServer.ServiceLocation.ServiceLocator.Current.GetInstance<EPiServer.Forms.Configuration.IEPiServerFormsImplementationConfig>();
%>

/* This view acts as a rendering template to render InitScript(and server-side Form's descriptor) in FormContainerBlock's client-side for Form[<%: Model.Form.FormGuid %>].
TECHNOTE: all serverside (paths, dynamic values) of EPiServerForms will be transfered to client side here in this section. */
(function initializeOnRenderingFormDescriptor() {
    // each workingFormInfo is store inside epi.EPiServer.Forms, lookup by its FormGuid
    var workingFormInfo = epi.EPiServer.Forms["<%: Model.Form.FormGuid %>"] = {
        Id: "<%: Model.Form.FormGuid %>",
        Name: "<%: Model.Form.Name %>",
        // whether this Form can be submitted which relates to the visitor's data (cookie, identity) and Form's settings (AllowAnonymous, AllowXXX)
        SubmittableStatus : <%: @Html.Raw(Model.Form.GetSubmittableStatus(new HttpContextWrapper(HttpContext.Current)).ToJson()) %>,
        ConfirmMessage : "<%: FormsExtensions.Replace(Model.ConfirmationMessage, "[\n\r]", " ") %>",
        ShowNavigationBar : <%: Model.ShowNavigationBar.ToString().ToLower() %>,
        ShowSummarizedData : <%: Model.ShowSummarizedData.ToString().ToLower() %>,
            
        // Validation info, for executing validating on client side
        ValidationInfo : <%: Html.Raw(Model.GetFormValidationInfo().ToJson()) %>,
        // Steps information for driving multiple-step Forms.
        StepsInfo : {
            Steps: <%: @Html.Raw(Model.GetStepsDescriptor().ToJson()) %>
        },
        FieldsExcludedInSubmissionSummary: <%: Html.Raw(_formParagraphTextService.GetFieldsExcludedInSubmissionSummary(Model.Form).ToJson()) %>,
        ElementsInfo: <%: Html.Raw(Model.GetElementsDescriptor().ToJson()) %>,
        DataSubmitController: "<%: _formConfig.CoreController %>"
    };
    
    /// TECHNOTE: Calculation at FormInfo level, and these values will be static input for later processing.
    workingFormInfo.StepsInfo.FormHasNoStep_VirtualStepCreated = <%: ViewBag.FormHasNoStep_VirtualStepCreated.ToString().ToLower() %>;  // this FLAG will be true, if Editor does not put any FormStep. Engine will create a virtual step, with empty GUID
    workingFormInfo.StepsInfo.FormHasNothing = <%: ViewBag.FormHasNothing.ToString().ToLower() %>;  // this FLAG will be true if FormContainer has no element at all
    workingFormInfo.StepsInfo.AllStepsAreNotLinked = <%: ViewBag.AllStepsAreNotLinked.ToString().ToLower() %>;  // this FLAG will be true, if all steps all have contentLink=="" (emptyString)
})();
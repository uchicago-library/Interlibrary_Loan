<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<AtlasSystems.Ares.WebService.CreateCourseModel>" MasterPageFile="~/Views/BasicLti/BasicLti.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <form method="post" action="<#webserviceurl>/BasicLti/SubmitCourseForm"/>
    <#ltipostdata>

    <select name="semester" required>        
    <#semesteroptions>
    </select>

    <input type="hidden" name="selectionRequest" value="<#selectionrequest>" />

    <input type="submit" value="Create Course" />
    </form>
</asp:Content>

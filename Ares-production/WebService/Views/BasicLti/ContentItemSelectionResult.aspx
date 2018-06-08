<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentItemSelectionResult.aspx.cs" Inherits="AtlasSystems.Ares.WebService.Views.BasicLti.ContentItemSelectionForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form method="post" action="<%= Model.ContentItemReturnUrl %>" id="contentItemSelection">
        <% foreach (string key in Model.FormCollection.AllKeys)
            { %>
                <input type="hidden" name="<%= HttpUtility.HtmlEncode(key) %>" value="<%= HttpUtility.HtmlEncode(Model.FormCollection[key]) %>"/>                
        <%  } %>
    </form>
    <script>
        document.getElementById('contentItemSelection').submit();
    </script>
</body>
</html>

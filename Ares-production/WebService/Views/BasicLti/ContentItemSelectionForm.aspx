<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentItemSelectionForm.aspx.cs" Inherits="AtlasSystems.Ares.WebService.Views.BasicLti.ContentItemSelectionForm" MasterPageFile="~/Views/BasicLti/BasicLti.Master" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="server">    
    <script type="application/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>    
</asp:Content>

<asp:Content ID="AresLtiContentSelection_Content" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <form id="AresLtiContentItemSelectionForm" method="post" action="<%= Model.ContentItemSelectionReturn %>" />
        <input type="hidden" name="content_item_return_url" value="<%= HttpUtility.HtmlEncode(Model.ContentItemReturnUrl) %>" />
        <% foreach (string key in Model.FormCollection.AllKeys)
            { %>
                <input type="hidden" name="<%= HttpUtility.HtmlEncode(key) %>" value="<%= HttpUtility.HtmlEncode(Model.FormCollection[key]) %>"/>
        <%  } %>                       
                
        <iframe id="AresLtiContentSelection_Web" name="AresLtiContentSelection_Web" src="<%= Model.AresWebUrl %>" style="position: fixed; border: none; top: 0; right: 0; bottom: 0; left: 0; width: 100%; height: 100%">
        </iframe> 
    </form>
    <script type="text/javascript">
        // Create IE + others compatible event handler
        var eventMethod = window.addEventListener ? "addEventListener" : "attachEvent";
        var eventer = window[eventMethod];
        var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";

        // Listen to message from child window
        eventer(messageEvent, function (e) {
            if (e.origin == '<%= Model.BaseAresWeb %>') {                
                console.log('parent received message!:  ', e.data);
                
                var form = $('#AresLtiContentItemSelectionForm');
                //Add a hidden input containing the ItemID of the selected item
                $('<input>').attr({
                    type: 'hidden',
                    id: 'selectedItemId',
                    name: 'selectedItemId',
                    value: e.data
                }).appendTo(form);

                //Submit the form back to the webservice
                form.submit();
            }
        }, false);
    </script>
</asp:Content>
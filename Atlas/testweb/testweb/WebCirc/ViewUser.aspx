<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="AtlasSystems.ILLiad.WebCirculation.ViewUser" %>

<%@ register assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<%@ MasterType VirtualPath="Default.Master" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderDefault" runat="server">
    
            <!-- Travis Stokes 2/15/2008 - I moved the Active Requests container into the form view.  This was done to allow us to 
                    set the float value of the user info section to left so that it lines up properly with the active requests. -->
            <asp:FormView ID="FormView" runat="server" Width="100%" HorizontalAlign="Left" CssClass="peekabooFix">
            <ItemTemplate>

            <div id="generaluserInfo" class="container peekabooFix">
                <div class="containerHeader">                                                                                    
                    <div class="containerHeaderLeft">&nbsp;</div>
                    <div class="containerHeaderRight">&nbsp;</div>
                    <div class="containerHeaderText">User Information</div>
                </div>                                            
                <div class="containerContent">                                                                                    
                        <div>
                            <span class="detailLine detailBold"><asp:Label id="labelCleared" runat="server"></asp:Label></span>                            
                            <span class="detailLine"><asp:Label id="labelUsername" runat="server" text='<%# Eval("Username","Username: {0}") %>'></asp:Label></span>
                            <span class="detailLine"><asp:Label id="labelFirstName" runat="server" text='<%# Eval("FirstName") %>'></asp:Label>            
                            &nbsp;<asp:Label id="labelLastName" runat="server" text='<%# Eval("LastName","{0}") %>'></asp:Label></span>                        
                            <span class="detailLine"><asp:Label id="labelSsn" runat="server" text='<%# Eval("Ssn","Library ID: {0}") %>'></asp:Label></span>
                            <span class="detailLine"><asp:Label id="labelStatus" runat="server" text='<%# Eval("Status", "Status: {0}") %>'></asp:Label></span>
                            <span class="detailLine"><asp:Label id="labelEmailAddress" runat="server" text='<%# Eval("EMailAddress", "Email: {0}") %>'></asp:Label></span>
                            <span class="detailLine"><asp:Label id="labelDepartment" runat="server" text='<%# Eval("Department", "Department: {0}") %>'></asp:Label></span>
                            <span class="detailLine"><asp:Label id="labelExpiration" runat="server" text='<%# Eval("ExpirationDate", "Expiration: {0}") %>'></asp:Label></span>                            
                            <span class="detailLine"><asp:Label id="labelDeliveryLocation" runat="server" text='<%# Eval("DeliveryLocation","Location: {0}") %>'></asp:Label></span>
                        </div>
                    <div class="clear"></div>
                </div>
            </div><!-- end generalUserInfo -->
            <br />
            <div id="userRequests" class="container peekabooFix">
                <div class="containerHeader">
                    <div class="containerHeaderLeft">&nbsp;</div>
                    <div class="containerHeaderRight">&nbsp;</div>
                    <div class="containerHeaderText">Active Requests</div>
                </div>                                            
                <div class="containerContent">                                            
                    <dxwgv:ASPxGridView ID="GridViewUserRequests" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridViewRequests" KeyFieldName="TransactionNumber">
                        <Columns>
                            <dxwgv:GridViewDataHyperLinkColumn Caption="Transaction" FieldName="TransactionNumber"
                                SortIndex="0" SortOrder="Ascending" VisibleIndex="0">
                                <PropertiesHyperLinkEdit NavigateUrlFormatString="ViewRequest.aspx?TransactionNumber={0}">
                                </PropertiesHyperLinkEdit>
                                <Settings AutoFilterCondition="Contains" />
                            </dxwgv:GridViewDataHyperLinkColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Type" FieldName="DocumentType" VisibleIndex="1">
                                <Settings AutoFilterCondition="Contains" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Title" FieldName="Title" VisibleIndex="2">
                                <Settings AutoFilterCondition="Contains" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Author" FieldName="Author" VisibleIndex="3">
                                <Settings AutoFilterCondition="Contains" />
                            </dxwgv:GridViewDataTextColumn>                    
                            <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="TransactionStatus" VisibleIndex="4">
                                <Settings AutoFilterCondition="Contains" />
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager>
                            <AllButton Visible="True">
                            </AllButton>
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                        <ClientSideEvents RowDblClick="function(s, e) {	
	                                        OnRequestGridDoubleClick(e.visibleIndex);
                                        }" />
                        <SettingsBehavior AllowFocusedRow="True" />
                    </dxwgv:ASPxGridView>
                </div> <!-- end userRequests -->   
            </div>
            
            </ItemTemplate>
            </asp:FormView>     
</asp:Content>

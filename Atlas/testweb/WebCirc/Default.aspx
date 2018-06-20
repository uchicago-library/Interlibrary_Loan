<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AtlasSystems.ILLiad.WebCirculation.DefaultMain" Title="<%$ Resources:WebResources, ApplicationTitle %>" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>


<%@ MasterType VirtualPath="Default.Master" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<asp:Content ID="ContentDefault" ContentPlaceHolderID="ContentPlaceHolderDefault" runat="server" >    
    <asp:UpdatePanel ID="UpdatePanelDefault" runat="server">    
        <ContentTemplate>                          
            <div class="defaultPage">                        
            <dxtc:ASPxPageControl ID="PageControlSearch" runat="server" ActiveTabIndex="0" 
                    Width="700px">
                <TabPages>
                    <dxtc:TabPage Text="Requests">
                        <ContentCollection><dxw:ContentControl runat="server">                                                        
                                <asp:Panel ID="PanelSearchRequests" runat="server" DefaultButton="ButtonSearchRequests">                                    
                                    <div>
                                        <asp:TextBox ID="TextBoxCriteriaRequests" runat="server" ToolTip="Searches Transaction Number, ISBN, ISSN, Journal, Title and Author"></asp:TextBox>&nbsp;
                                        <asp:Button ID="ButtonSearchRequests" runat="server" Text="Search" OnClick="ButtonSearchRequests_Click" UseSubmitBehavior="false" OnClientClick="__defaultFired = false;"  CssClass="button"/>
                                    </div><br />
                                    <div id="searchResultsRequests" class="searchResultsGrid">
                                    <dxwgv:ASPxGridView runat="server" ID="GridViewRequests" KeyFieldName="TransactionNumber" ClientInstanceName="GridViewRequests" AutoGenerateColumns="False" Width="100%">
                                        <Settings ShowFilterRow="True" ShowGroupPanel="True"></Settings>
                                        <Columns>
                                            <dxwgv:GridViewDataHyperLinkColumn VisibleIndex="0" FieldName="TransactionNumber" Width="5%" Caption="Transaction" SortOrder="Ascending" SortIndex="0">
                                                <PropertiesHyperLinkEdit NavigateUrlFormatString="ViewRequest.aspx?TransactionNumber={0}"></PropertiesHyperLinkEdit>
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataHyperLinkColumn>
                                            <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="DocumentType" Visible="false" Width="10%" Caption="Type">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="Title" Width="37%" Caption="Title">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="Author" Width="25%" Caption="Author">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="Username" Width="5%" Caption="Username">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="TransactionStatus" Width="18%" Caption="Status">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager>
                                            <AllButton ImagePosition="Top" Visible="True">
                                            </AllButton>
                                        </SettingsPager>
                                        <ClientSideEvents RowDblClick="function(s, e) {
	                                        OnRequestGridDoubleClick(e.visibleIndex);
                                        }" />
                                        <SettingsBehavior AllowFocusedRow="True" />
                                    </dxwgv:ASPxGridView>
                                    </div>
                                </asp:Panel>                                                            
                        </dxw:ContentControl></ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Text="Users">
                        <ContentCollection><dxw:ContentControl runat="server">
                            <asp:Panel ID="PanelSearchUsers" runat="server" DefaultButton="ButtonSearchUsers">
                                <div>
                                <asp:TextBox ID="TextBoxCriteriaUsers" runat="server" ToolTip="Searches Username, First Name, Last Name, Department, Status and Library ID"></asp:TextBox>&nbsp;
                                <asp:Button ID="ButtonSearchUsers" runat="server" OnClick="ButtonSearchUsers_Click" Text="Search" UseSubmitBehavior="false" OnClientClick="__defaultFired = false;" CssClass="button" />
                                </div><br />
                                <div id="searchResultsUsers" class="searchResultsGrid">
                                    <dxwgv:ASPxGridView runat="server" ID="GridViewUsers" KeyFieldName="UserName" ClientInstanceName="GridViewUsers" AutoGenerateColumns="False" Width="100%">
                                        <SettingsPager>
                                            <AllButton Visible="True">
                                            </AllButton>
                                        </SettingsPager>
                                        <Settings ShowFilterRow="True" ShowGroupPanel="True"></Settings>
                                        <Columns>
                                            <dxwgv:GridViewDataHyperLinkColumn FieldName="UserName" Caption="Username" SortIndex="0"
                                                SortOrder="Ascending" VisibleIndex="0">
                                                <PropertiesHyperLinkEdit NavigateUrlFormatString="ViewUser.aspx?Username={0}"></PropertiesHyperLinkEdit>
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataHyperLinkColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="FirstName" Caption="First Name" VisibleIndex="1">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="LastName" Caption="Last Name" VisibleIndex="2">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Department" Caption="Department" VisibleIndex="3">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Status" Caption="Status" VisibleIndex="4">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="ActiveRequests" Caption="Active Requests" VisibleIndex="5">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <ClientSideEvents RowDblClick="function(s, e) {	
	                                        OnUserGridDoubleClick(e.visibleIndex);
                                        }" />
                                        <SettingsBehavior AllowFocusedRow="True" />                                        
                                    </dxwgv:ASPxGridView>
                                </div>
                            </asp:Panel>                                                            
                        </dxw:ContentControl></ContentCollection>
                    </dxtc:TabPage>
                </TabPages>
            </dxtc:ASPxPageControl>            
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

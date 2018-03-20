﻿<%@ Page Language="C#" MasterPageFile="~/WebReports.Master" AutoEventWireup="true" CodeBehind="StaffActivityByUsername.aspx.cs" Inherits="WebReports.Administrative.StaffActivityByUsername" Title="ILLiad Reports - Administrative - Staff Activity by Username" %>

<%@ Register Src="../CustomControls/ExportManagerControl.ascx" TagName="ExportManagerControl"
    TagPrefix="uc2" %>

<%@ Register Src="../CustomControls/ChartOptionsControl.ascx" TagName="ChartOptionsControl"
    TagPrefix="uc1" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="DevExpress.XtraCharts.v10.2.Web, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Src="~/CustomControls/ParametersControl.ascx" TagName="ParametersControl" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BodyPlaceholder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <uc:ParametersControl ID="parametersControl" ReportTitle="Administrative - Staff Activity by Username" AskSitesAndGroups="Sites" AskProcessTypeAll="true" AskBeginDate="true" AskEndDate="true" runat="server" />  
    <br />
    <uc2:ExportManagerControl ID="ExportManagerControl1" FileNamePrefix="StaffActivity" runat="server" />
    <br />
    <div class="OverflowContainerDiv">
        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="ReportResultsTable"
            Visible="False" EnableRowsCache="False">
            <Styles>
                <Header CssClass="ReportResultsTableHeader" Wrap="True">
                </Header>
                <AlternatingRow Enabled="True" CssClass="ReportResultsTableAlternatingRow">
                </AlternatingRow>
            </Styles>
            <SettingsPager PageSize="25">
                <AllButton Visible="True">
                </AllButton>
            </SettingsPager>
        </dxwgv:ASPxGridView>
    </div>
</asp:Content>

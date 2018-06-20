<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ParametersControl.ascx.cs" Inherits="WebReports.CustomControls.ParametersControl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<dxe:ASPxLabel ID="ASPxLabelPrintingReportTitle" runat="server" CssClass="PrintingReportTitle"
    Text="ASPxLabel">
</dxe:ASPxLabel>
<asp:Table ID="ParametersTable" runat="server" CssClass="ParameterRequestTable">
</asp:Table>
    <asp:Table ID="ResultsParameterTable" runat="server" CssClass="ParameterResultsTable">
    </asp:Table>
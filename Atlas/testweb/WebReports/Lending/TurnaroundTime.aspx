﻿<%@ Page Language="C#" MasterPageFile="~/WebReports.Master" AutoEventWireup="true" CodeBehind="TurnaroundTime.aspx.cs" Inherits="WebReports.Lending.TurnaroundTime" Title="ILLiad Reports - Lending - Turnaround Time" %>

<%@ Register Src="../CustomControls/ExportManagerControl.ascx" TagName="ExportManagerControl"
    TagPrefix="uc2" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc2" %>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="0">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="UpdateProgressDiv" >
                <br />
                Updating chart display...
                <br />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <uc:ParametersControl ID="parametersControl" ReportTitle="Lending - Turnaround Time" AskDetailedArticles="true" AskDetailedLoans="true" AskSitesAndGroups="GroupsBySite" AskBeginDate="true" AskEndDate="true" runat="server" />  
    <br />
    <uc2:ExportManagerControl id="ExportManagerControl1" FileNamePrefix="LendingTurnaround" runat="server">
    </uc2:ExportManagerControl>
    &nbsp;<br />
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
            <uc1:ChartOptionsControl ID="ChartOptionsControl1" DefaultLabelSetting="false" ChartType="Pie3D" runat="server" Visible="false" />
            &nbsp;&nbsp;<br />
            <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Height="400px"
                Width="100%"><TabPages>
<dxtc:TabPage Name="ArticlesTab" Text="Articles"><ContentCollection><dxw:ContentControl runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="100%" Width="100%">
        <table width="100%" dir="ltr">
            <tr>
                <td style="width: 45px">
                    <dxchartsui:WebChartControl ID="WebChartControlArticles" runat="server" Height="275px" Width="450px">
                        <FillStyle ><OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable></FillStyle>
                        <Titles>
                            <cc1:ChartTitle Text="Turnaround Time for Articles">
                            </cc1:ChartTitle>
                        </Titles>
                        <SeriesTemplate  
                            ><PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable><LabelSerializable>
<cc1:SideBySideBarSeriesLabel HiddenSerializableString="to be serialized"><FillStyle ><OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable></FillStyle></cc1:SideBySideBarSeriesLabel>
</LabelSerializable><ViewSerializable>
<cc1:SideBySideBarSeriesView HiddenSerializableString="to be serialized"></cc1:SideBySideBarSeriesView>
</ViewSerializable><LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</LegendPointOptionsSerializable></SeriesTemplate>
                        <Legend AlignmentVertical="Center"></Legend>
                    </dxchartsui:WebChartControl>
                </td>
                <td align="center" valign="middle">
                    <dxwgv:ASPxGridView ID="ASPxGridViewArticlesBasic" runat="server">
                        <Settings ShowColumnHeaders="False" />
                        <Styles>
                            <Cell Wrap="True">
                            </Cell>
                        </Styles>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 100%">
                    <dxwgv:ASPxGridView ID="ASPxGridViewArticlesDetailed" runat="server" 
                        Width="100%" CssClass="ReportResultsTable" 
                        Visible="False" EnableCallBacks="False">
                        <Styles>
                            <Header CssClass="ReportResultsTableHeader" Wrap="True">
                            </Header>
                            <AlternatingRow Enabled="True" CssClass="ReportResultsTableAlternatingRow">
                            </AlternatingRow>
                        </Styles>
                        <SettingsPager>
                            <AllButton Visible="True">
                            </AllButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
    </asp:Panel>
</dxw:ContentControl></ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="LoansTab" Text="Loans">
    <ContentCollection><dxw:ContentControl runat="server">
        <asp:Panel ID="Panel2" runat="server" Height="100%" Width="100%">
            <table width="100%">
                <tr>
                    <td style="width: 45px">
                        <dxchartsui:WebChartControl ID="WebChartControlLoans" runat="server" Height="275px" Width="450px">
                            <FillStyle ><OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable></FillStyle>
                            <Titles>
                                <cc1:ChartTitle Text="Turnaround Time for Loans">
                                </cc1:ChartTitle>
                            </Titles>
                            <SeriesTemplate  
                            ><PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable><LabelSerializable>
<cc1:SideBySideBarSeriesLabel HiddenSerializableString="to be serialized"><FillStyle ><OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable></FillStyle></cc1:SideBySideBarSeriesLabel>
</LabelSerializable><ViewSerializable>
<cc1:SideBySideBarSeriesView HiddenSerializableString="to be serialized"></cc1:SideBySideBarSeriesView>
</ViewSerializable><LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</LegendPointOptionsSerializable></SeriesTemplate>
                            <Legend AlignmentVertical="Center"></Legend>
                        </dxchartsui:WebChartControl>
                    </td>
                    <td align="center" valign="middle">
                        <dxwgv:ASPxGridView ID="ASPxGridViewLoansBasic" runat="server">
                            <Settings ShowColumnHeaders="False" />
                            <Styles>
                                <Cell Wrap="True">
                                </Cell>
                            </Styles>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="width: 100%">
                        <dxwgv:ASPxGridView ID="ASPxGridViewLoansDetailed" runat="server" Width="100%" 
                            CssClass="ReportResultsTable" Visible="False" EnableCallBacks="False">
                            <Styles>
                                <Header CssClass="ReportResultsTableHeader" Wrap="True">
                                </Header>
                                <AlternatingRow Enabled="True" CssClass="ReportResultsTableAlternatingRow">
                                </AlternatingRow>
                            </Styles>
                            <SettingsPager>
                                <AllButton Visible="True">
                                </AllButton>
                            </SettingsPager>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </dxw:ContentControl></ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="OverallTab" Text="Overall">
    <ContentCollection><dxw:ContentControl runat="server">
        <asp:Panel ID="Panel3" runat="server" Height="100%" Width="100%">
            <table width="100%">
                <tr>
                    <td style="width: 45px">
                        <dxchartsui:WebChartControl ID="WebChartControlOverall" runat="server" Height="275px" Width="450px">
                            <FillStyle ><OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable></FillStyle>
                            <Titles>
                                <cc1:ChartTitle Text="Overall Turnaround Time">
                                </cc1:ChartTitle>
                            </Titles>
                            <SeriesTemplate  
                            ><PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable><LabelSerializable>
<cc1:SideBySideBarSeriesLabel HiddenSerializableString="to be serialized"><FillStyle ><OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable></FillStyle></cc1:SideBySideBarSeriesLabel>
</LabelSerializable><ViewSerializable>
<cc1:SideBySideBarSeriesView HiddenSerializableString="to be serialized"></cc1:SideBySideBarSeriesView>
</ViewSerializable><LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</LegendPointOptionsSerializable></SeriesTemplate>
                            <Legend AlignmentVertical="Center"></Legend>
                        </dxchartsui:WebChartControl>
                    </td>
                    <td align="center" valign="middle">
                        <dxwgv:ASPxGridView ID="ASPxGridViewOverallBasic" runat="server">
                            <Settings ShowColumnHeaders="False" />
                            <Styles>
                                <Cell Wrap="True">
                                </Cell>
                            </Styles>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </dxw:ContentControl></ContentCollection>
</dxtc:TabPage>
</TabPages>
                <ContentStyle Wrap="False">
                </ContentStyle>
</dxtc:ASPxPageControl>
    </contenttemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>

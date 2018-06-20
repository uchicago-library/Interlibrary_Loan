<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ChangeSite.aspx.cs" Inherits="AtlasSystems.ILLiad.WebCirculation.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderDefault" runat="server">
    Choose a site
    <asp:Repeater ID="RepeaterSites" runat="server">
        <HeaderTemplate>
            <ul id="siteList">
        </HeaderTemplate>
        <ItemTemplate>
            <li><asp:linkbutton OnClick="mainMenu_Click" CommandArgument="Site" runat="server" Text="<%# Container.DataItem %>"></asp:linkbutton></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>        
</asp:Content>

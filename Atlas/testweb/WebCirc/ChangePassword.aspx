<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="AtlasSystems.ILLiad.WebCirculation.ChangePassword" %>
<asp:Content ID="ContentChangePassword" ContentPlaceHolderID="ContentPlaceHolderDefault" runat="server">
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" 
        ErrorMessage="Please enter a password." ControlToValidate="TextBoxPassword" 
        Display="None" CssClass="error" ValidationGroup="Password"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="PasswordValidator" runat="server" 
        ErrorMessage="Passwords do not match. Try again." ControlToCompare="TextBoxConfirmPassword" 
        ControlToValidate="TextBoxPassword" CssClass="error" Display="None" 
    ValidationGroup="Password"></asp:CompareValidator>    
    <asp:ValidationSummary ID="ValidationSummary" runat="server" 
    CssClass="error" DisplayMode="List" ValidationGroup="Password" />
    <table border="0">
        <tr><td>New Password:</td><td>
            <asp:TextBox runat="server" ID="TextBoxPassword" 
                runat="server" TextMode="Password" ValidationGroup="Password"></asp:TextBox></td></tr>
        <tr><td>Confirm New Password:</td><td>
            <asp:TextBox ID="TextBoxConfirmPassword" 
                runat="server" TextMode="Password" ValidationGroup="Password"></asp:TextBox></td></tr>
        <tr><td colspan="2"><asp:Button runat="server" ID="ChangePasswordButton" 
                Text="Change Password" onclick="ChangePasswordButton_Click" 
                ValidationGroup="Password" /></td></tr>
    </table>
</asp:Content>

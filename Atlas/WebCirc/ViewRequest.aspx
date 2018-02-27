<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ViewRequest.aspx.cs" Inherits="AtlasSystems.ILLiad.WebCirculation.ViewRequest" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %> 
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dxdv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<%@ MasterType VirtualPath="Default.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderDefault" runat="server">    
    
    <ContentTemplate>                                          
                
                <asp:FormView ID="TransactionFormView" runat="server">
                <ItemTemplate>         
                    <div>
                    <div id="generaluserInfo" class="container">
                        <div class="containerHeader">                                                                                    
                            <div class="containerHeaderLeft">&nbsp;</div>
                            <div class="containerHeaderRight">&nbsp;</div>
                            <div class="containerHeaderText">General Information</div>
                        </div>                                            
                        <div class="containerContent">                                            
                            
                            <div id="generalInfo">                            
                                <span class="detailLine detailBold"><asp:Label id="labelTransaction" runat="server" Text='<%# Eval("TransactionNumber", "Transaction {0}") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelTransactionStatus" runat="server" text='<%# Eval("TransactionStatus") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelRequestType" runat="server" text='<%# Eval("RequestType") %>'></asp:Label> / <asp:Label id="labelDocumentType" runat="server" text='<%# Eval("DocumentType") %>'></asp:Label></span>                                
                                <span class="detailLine"><asp:Label id="labelCallNumber" runat="server" text='<%# Eval("CallNumber") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelISSN" runat="server" text='<%# Eval("ISSN","ISSN: {0}") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelDueDate" runat="server" text='<%# String.Format("Due: {0:d}",Eval("DueDate")) %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelRenewalsAllowed" runat="server" text='<%# Eval("RenewalsAllowed","Renewals Allowed: {0}") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelLibraryUseOnly" runat="server" text='<%# Eval("LibraryUseOnly","Library Use Only: {0}") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelAllowPhotocopies" runat="server" text='<%# Eval("AllowPhotocopies","Allow Photocopies: {0}") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelPieces" runat="server" text='<%# Eval("Pieces","Pieces: {0}") %>'></asp:Label></span>
                                <span style="clear: both;"></span>
                            </div>
                            
                            <div id="userInfo">                                                       
                                <span class="detailLine detailBold"><asp:Label id="labelCleared" runat="server"></asp:Label></span>
                                <span class="detailLine">
                                    <asp:Label id="labelFirstName" runat="server" text='<%# Eval("FirstName") %>'></asp:Label>&nbsp;
                                    <asp:Label id="labelLastName" runat="server" text='<%# Eval("LastName") %>'></asp:Label>
                                    <span class="detailBold"><asp:Label id="labelUserName" runat="server" text='<%# Eval("UserName"," ({0})") %>'></asp:Label></span>
                                </span>
                                <span class="detailLine"><asp:Label id="labelSSN" runat="server" text='<%# Eval("SSN","Library ID: {0}") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelStatus" runat="server" text='<%# Eval("Status") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelDeliveryLocation" runat="server" text='<%# Eval("DeliveryLocation","Location: {0}") %>'></asp:Label></span>
                            </div>
                            
                            <div class="clear"></div>
                        </div>
                    </div>
                    
                    

                    <div id="bibInfo" class="container">
                        <div class="containerHeader">                                                                                    
                            <div class="containerHeaderLeft">&nbsp;</div>
                            <div class="containerHeaderRight">&nbsp;</div>
                            <div class="containerHeaderText">Bibliographic Information</div>
                        </div>                                            
                        <div class="containerContent">                                            
                            <div>
                                <span class="detailLine detailBold"><asp:Label id="labelLoanTitle" runat="server" text='<%# Eval("LoanTitle") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelLoanAuthor" runat="server" text='<%# Eval("LoanAuthor") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelLoanPublisher" runat="server" text='<%# Eval("LoanPublisher") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelLoanPlace" runat="server" text='<%# Eval("LoanPlace") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelLoanDate" runat="server" text='<%# Eval("LoanDate") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelLoanEdition" runat="server" text='<%# Eval("LoanEdition") %>'></asp:Label></span>
                                <span class="detailLine detailBold"><asp:Label id="labelPhotoJournalTitle" runat="server" text='<%# Eval("PhotoJournalTitle") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelPhotoJournalVolume" runat="server" text='<%# Eval("PhotoJournalVolume", "Volume {0}") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelPhotoJournalIssue" runat="server" text='<%# Eval("PhotoJournalIssue", "Issue {0}") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelPhotoJournalMonth" runat="server" text='<%# Eval("PhotoJournalMonth") %>'></asp:Label> <asp:Label id="labelPhotoJournalYear" runat="server" text='<%# Eval("PhotoJournalYear") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelPhotoJournalInclusivePages" runat="server" text='<%# Eval("PhotoJournalInclusivePages", "Pages: {0}") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelPhotoArticleTitle" runat="server" text='<%# Eval("PhotoArticleTitle") %>'></asp:Label></span>
                                <span class="detailLine"><asp:Label id="labelPhotoArticleAuthor" runat="server" text='<%# Eval("PhotoArticleAuthor") %>'></asp:Label></span>                                                        
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div><!-- end bibInfo -->
                    </div>                   
                </ItemTemplate>
            </asp:FormView>
            <!--
                    <div id="userInfo" class="container">
                        <div class="containerHeader">                                                                                    
                            <div class="containerHeaderLeft">&nbsp;</div>
                            <div class="containerHeaderRight">&nbsp;</div>
                            <div class="containerHeaderText">User Information</div>
                        </div>                                            
                        <div class="containerContent">                                            
                            <div class="clear"></div>
                        </div>
                    </div>-->
    </ContentTemplate>

</asp:Content>

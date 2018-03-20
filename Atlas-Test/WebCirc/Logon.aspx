<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="AtlasSystems.ILLiad.WebCirculation.Logon" Title="<%$ Resources:WebResources, ApplicationTitle %>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ILLiad Web Circulation</title>
    <link rel="stylesheet" type="text/css" href="css/1col.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/webcirc.css" media="screen" />
    <!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="css/ie6_or_less.css" media="screen" />
    <![endif]-->       
</head>
<body>    
        <!-- Inset Page -->
        <div id="pageContainer">
        
                  <!-- Page Header -->
                    <div id="pageContainerHeader">
                        <!-- Do NOT change where LEFT, RIGHT & TEXT is located within the page due to float positions -->
                        <div id="pageContainerHeaderLeft">&nbsp;</div>
                        <div id="pageContainerHeaderRight">&nbsp;</div>
                        <div id="pageContainerHeaderText">
                                <h2><asp:Literal ID="ApplicationTitle" runat="server" Text="<%$ Resources:WebResources, ApplicationTitle %>"></asp:Literal></h2>
                        </div>
                        </div>                                            
                    <!-- end header -->
                                
            <div id="pageContainerContent">
                        
                <div id="mainContent">
   
                    <form id="formLogon" runat="server" class="form">                                   
                        
                            <asp:Label runat="server" ID="LabelStatus" Text="Enter your user information below."></asp:Label>
                            <br />
		                    <div class="req"><b>*</b> Indicates required field</div>
		                    <fieldset>
			                    <h3>Logon</h3>
                                <label for="username">
				                    <span class="field">
    					                <span class="req">*</span>
					                    <b>Username</b>
				                    </span>
				                    <asp:TextBox ID="TextBoxUsername" runat="server" />
			                    </label>			
			                    <br />
			                    <label for="password">
				                    <span class="field">                            
    					                <span class="req">*</span>
					                    <b>Password</b>
				                    </span>
				                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" />
			                    </label>
			                    <br />										                    
    			                <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" CssClass="submitButton" Text="Login" />
		                    </fieldset>
		                
		            </form>            
		            
		            </div><!-- end mainContent -->                
        
               <!-- Page Footer -->
              <div id="footer">              
                <div id="copyright">
                    <asp:Literal ID="copyrightLiteral" runat="server" Text="<%$ Resources:WebResources, Copyright %>" />
                </div><!-- end copyright -->
              </div><!-- end footer -->   
            </div><!-- end pageContent-->
                
	        	    
    </div><!-- end page -->    
</body>
</html>

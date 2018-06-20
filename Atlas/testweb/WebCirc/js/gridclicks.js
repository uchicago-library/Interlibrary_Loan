    // <!CDATA[
    //function is called on double clickin a row in the request grid
    function OnRequestGridDoubleClick(row) {
        // Query the server for the "EmployeeID" and "Notes" fields from the focused row 
        // The values will be returned to the OnGetRowValues() function     
        GridViewRequests.GetRowValues(row, 'TransactionNumber', OnGetRequestRowValues);
    }
    //Value array contains "TransactionNumber" field values returned from the server 
    function OnGetRequestRowValues(transactionNumber) {    
        window.location.href = "ViewRequest.aspx?TransactionNumber=" + transactionNumber;
    }
    
    //function is called on double clickin a row in the request grid
    function OnUserGridDoubleClick(row) {
        // Query the server for the "EmployeeID" and "Notes" fields from the focused row 
        // The values will be returned to the OnGetRowValues() function     
        GridViewUsers.GetRowValues(row, 'UserName', OnGetUserRowValues);
    }
    //Value array contains "TransactionNumber" field values returned from the server 
    function OnGetUserRowValues(username) {    
        window.location.href = "ViewUser.aspx?Username=" + username;
    }
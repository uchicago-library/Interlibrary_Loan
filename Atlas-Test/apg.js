// Amazon Price Grabber (APG)
// Copyright (c) 2008 Portland State University
// Created by: Mike Flakus mflakus@pdx.edu and Sherry Buchanan sherryb@pdx.edu
// All Rights Reserved
// Please see the file “COPYING” included in the software package for license information


// set apg_php_loc to the location of the isbn_ajax.php file on your server
var apg_php_loc = "https://requests.lib.uchicago.edu/php/isbn_ajax.php";


var http = createRequestObject();
amazonLookup(getVar("isbn"));

function createRequestObject() {
    var ro;
    var browser = navigator.appName;
    if(browser == "Microsoft Internet Explorer")
	{
        ro = new ActiveXObject("Microsoft.XMLHTTP");
    }
	else
	{
        ro = new XMLHttpRequest();
    }
    return ro;
}

function amazonLookup(isbn)
{
	isbn = isbn.split(",",1);
    http.open('get', apg_php_loc+'?isbn='+isbn);
    http.onreadystatechange = handleResponse;
    http.send(null);
}


function handleResponse()
{
    if(http.readyState == 4 && http.status == 200)
    {
        var response = http.responseText;
		document.forms["LoanRequest"].Location.value = response;
    }
	else
	{
		// waiting for response
	}
}

	

function getVar(name)
{
	get_string = document.location.search;         
	return_value = '';
		 
	do 
	{ 
		//This loop is made to catch all instances of any get variable.
		name_index = get_string.indexOf(name + '=');
	
		if(name_index != -1)
		{
			get_string = get_string.substr(name_index + name.length + 1, get_string.length - name_index);
			end_of_value = get_string.indexOf('&');

			if(end_of_value != -1)                
				value = get_string.substr(0, end_of_value);                
			else                
				value = get_string;                
		
			if(return_value == '' || value == '')
				return_value += value;
			else
				return_value += ', ' + value;
		}
	}
	while(name_index != -1)
	
	 //Restores all the blank spaces.
	 space = return_value.indexOf('+');
	while(space != -1)
	{ 
		return_value = return_value.substr(0, space) + ' ' + 
		return_value.substr(space + 1, return_value.length);		 
		space = return_value.indexOf('+');
	}
	return(return_value);        
}

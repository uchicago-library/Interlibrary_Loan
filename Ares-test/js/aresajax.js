var isWorking = false;
var rowArray;
var http = getHTTPObject();

function getHTTPObject() {
  var xmlhttp;
/*@cc_on
  @if (@_jscript_version >= 5)
  try {
    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
  } catch (e) {
    try {
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } catch (E) {
      xmlhttp = false;
    }
  }
  @else
    xmlhttp = false;
  @end @*/

  if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
    try {
      xmlhttp = new XMLHttpRequest();
    } catch (e) {
      xmlhttp = false;
    }
  }
  return xmlhttp;
}

function GetSemesterStartStop(SemesterName) {
if (!isWorking) {

    var url = "ares.dll?action=70&type=780";
    http.open("GET", url + "&Value=" + escape(SemesterName), true);
    isWorking = true;
    http.onreadystatechange = handleRetrieveSemesterResponse;
    http.send(null);
  }
}


function handleRetrieveSemesterResponse() {
  if (http.readyState == 4) {
	isWorking = true;
	var xmlDocument = http.responseXML;
	var inputs = document.getElementsByTagName('input'); 
	if (xmlDocument.getElementsByTagName('araj_code').item(0).firstChild.data == 1) {
		for(var k=0;k<inputs.length;k++)
		{
		var input = inputs[k];
		if(input.type!= 'text') continue;
		if (input.name.match('ADate'))
		 {
		 	input.value = xmlDocument.getElementsByTagName('start').item(0).firstChild.data;
		 }
		if (input.name.match('IDate'))
		 {
		 	input.value = xmlDocument.getElementsByTagName('end').item(0).firstChild.data;
		 }	 
		}
      	isWorking = false;
  	}
	}
}

function DeleteAlert(AlertID) {
if (!isWorking) {
    var url = "ares.dll?Action=70&type=781";
    http.open("GET", url + "&SessionID=" + escape(sessionid) + "&Value=" + escape(AlertID), true);
    isWorking = true;
    http.onreadystatechange = handleDeleteAlertResponse;
    http.send(null);
  }
}

function handleDeleteAlertResponse() {
  if (http.readyState == 4) {
	isWorking = true;
	var xmlDocument = http.responseXML;
	if (xmlDocument.getElementsByTagName('araj_code').item(0).firstChild.data == 1) {
		//Uncomment to hide the alert that was deleted
		//var style2 = document.getElementById('alert' + xmlDocument.getElementsByTagName('alertid').item(0).firstChild.data).style;
		//style2.display = 'none';
		
		//This will replace the Alert div with text
		//var alertMSG = document.getElementById('alert' + xmlDocument.getElementsByTagName('alertid').item(0).firstChild.data);
		//alertMSG.innerHTML = 'Alert deleted';
		
		//This will pop the alert [need scriptaculous]
		var alertMSG = document.getElementById('alert' + xmlDocument.getElementsByTagName('alertid').item(0).firstChild.data);
		new Effect.Puff(alertMSG);		
	}
    isWorking = false;
  }
}

function ToggleHotList(obj,Action) {
if (!isWorking) {
      inputs = document.getElementsByTagName('input');
      var checkboxes = new Array();
      for (i = 0; i < inputs.length; i++)
      {
        if (!inputs[i].length)
        {
          if (inputs[i].type == 'checkbox')
		  {
	          if (inputs[i].name.match('HotList') && inputs[i].checked)
			  {
				  //The False parameter in the http open tag is VERY important. The False will make sure that request will happen synchronously so not 
				  //to confuse multiple requests
				  if (Action == 'del')
				  {
					http.open("GET", "ares.dll?action=70&type=783&SessionID=" + escape(sessionid) + "&Value=" + escape(inputs[i].name.replace("HotList","")) , false);
				  }
				  else
				  {
				  http.open("GET", "ares.dll?action=70&type=782&SessionID=" + escape(sessionid) + "&Value=" + escape(inputs[i].name.replace("HotList","")) , false);			  
				  }	  
				  isWorking = true;
				  http.send(null);
				  handleToggleHotListResponse();
			  }
		  }
        } 
      }
  }
}



function deleteRows(rowObjArray)
{
	for (var i=0; i<rowObjArray.length; i++) 
	{
		var rIndex = rowObjArray[i].sectionRowIndex;
		rowObjArray[i].parentNode.deleteRow(rIndex);
	}
}


function handleToggleHotListResponse() {
	if (http.readyState == 4) 
	{
		var xmlDocument = http.responseXML;
		if (xmlDocument.getElementsByTagName('araj_code').item(0).firstChild.data == 1) 
		{
				var itemid = xmlDocument.getElementsByTagName('itemid').item(0).firstChild.data;
				var input = document.getElementById('HotList' + itemid);			
				var parCell = input.parentNode;
				input.disabled = true;
				if (xmlDocument.getElementsByTagName('hotlistaction').item(0).firstChild.data == 'del') 
				{
		    		newdiv = document.createTextNode("Removed");
				}
	    		if (xmlDocument.getElementsByTagName('hotlistaction').item(0).firstChild.data == 'add') 
				{
	    			newdiv = document.createTextNode("Added");				
				}
				parCell.appendChild(newdiv); 			
		}
 	}
  	isWorking = false;  
}

function GetName(Username) {
if (!isWorking) {
    var url = "ares.dll?action=70&type=784";
    http.open("GET", url + "&Value=" + escape(Username), true);
    isWorking = true;
    http.onreadystatechange = handleGetNameResponse;
    http.send(null);
  }
}


function handleGetNameResponse() {
  if (http.readyState == 4) {
	isWorking = true;
	var xmlDocument = http.responseXML;
	if (xmlDocument.getElementsByTagName('araj_code').item(0).firstChild.data == 1) {
		instructor = document.getElementById('CourseInstructor');
		var last = xmlDocument.getElementsByTagName('lastname').item(0).firstChild.data;
		last = last.toUpperCase();
		instructor.value = last + ', ' + xmlDocument.getElementsByTagName('firstname').item(0).firstChild.data;
      	isWorking = false;
  	}
	}
}

function handleUniqueUsernameResponse() {
  if (http.readyState == 4) {
	isWorking = true;
	var xmlDocument = http.responseXML;
	var arajcode = xmlDocument.getElementsByTagName('araj_code').item(0).firstChild.data;
	if (arajcode == 1) {
	      document.getElementById('usernamespan').className = 'usernameinuse';
	      document.getElementById('usernamespan').innerHTML = 'Username already in use.';
		Fat.fade_element('usernamespan',5,null,null,'#f6f6f6');
     	  	document.getElementById('Username').focus();
	}
	if (arajcode == 0) {
		document.getElementById('usernamespan').className = '';
	      document.getElementById('usernamespan').innerHTML = '';
  	}
	isWorking = false;
	}
}

function checkUniqueUsername(Username) {
if (!isWorking) {
    var url = "ares.dll?action=70&type=784";
    http.open("GET", url + "&Value=" + escape(Username), true);
    isWorking = true;
    http.onreadystatechange = handleUniqueUsernameResponse;
    http.send(null);
  }
}

function getNewLoanPeriods(PickupLocation) {
if (!isWorking) {
    var url = "ares.dll?action=70&type=785";
    http.open("GET", url + "&PickupLocation=" + escape(PickupLocation) + "&LoanPeriod=" + escape(document.getElementById("LoanPeriod").value), true);
    isWorking = true;
    http.onreadystatechange = handleGetNewLoanPeriods;
    http.send(null);
  }
}

function handleGetNewLoanPeriods() {
  if (http.readyState == 4) {
	isWorking = true;
	var xmlDocument = http.responseXML;
	var arajcode = xmlDocument.getElementsByTagName('araj_code').item(0).firstChild.data;
	if (arajcode == 0) {
		nlp = xmlDocument.getElementsByTagName('lp_options').item(0).firstChild.data;

		lp = document.getElementById('LoanPeriodDiv');

		lp.innerHTML = '<label for="LoanPeriod"><b>Loan Period for Physical Items</b><select name="LoanPeriod" id="LoanPeriod">' + nlp + '</select><br /></label>';
 	}
	isWorking = false;
	}
}

function ResortItems(SessionId, ClassId, SortField) {
    if (SortField != '') {
        window.location = 'ares.dll?SessionId=' + SessionId + '&Action=10&Form=60&Value=' + ClassId + '&orderby=' + SortField;
    }
}

function EnableSortPersistence(tableName) {
    var tableSelector = "#" + tableName;
    $(function () {
        $(tableSelector).sortable({
            items: '.row-odd, .row-even',
            axis: 'y',
            stop: function (event, ui) { FixRowStyles(tableSelector, "row-odd", "row-even"); }
        });

        $(tableSelector).disableSelection();
    });
}

function FixRowStyles(tableSelector, oddStyle, evenStyle) {
    var rowSelector = tableSelector + " ." + oddStyle + ", " + tableSelector + " ." + evenStyle;

    $(rowSelector).each(function (index) {
        var isEven = index % 2 == 0;

        if (isEven && !$(this).hasClass(evenStyle)) {
            $(this).removeClass(oddStyle);
            $(this).addClass(evenStyle);
        }
        else if (!isEven && !$(this).hasClass(oddStyle)) {
            $(this).removeClass(evenStyle);
            $(this).addClass(oddStyle);
        }
    });
}

function SaveSortOrder(tableName, sortColumn, baseAjaxUrl) {
    var tableSelector = "#" + tableName;

    var tnColIndex = GetColumnIndex($(tableSelector), sortColumn);

    var itemString = "";

    $(tableSelector + " .row-odd, " + tableSelector + " .row-even").each(function (index) {
        var tdVal = $(this).find("td:eq(" + tnColIndex + ")").text();

        itemString += tdVal + "|";
    })

    itemString = itemString.substring(0, itemString.length - 1);

    $.ajax({
        url: baseAjaxUrl + "&Value=" + itemString,
        cache: false
    });
}

function GetColumnIndex(tableJQObject, columnName) {
    return tableJQObject.find("th:contains('" + columnName + "')").index();
}

function ToggleCheckboxes(checked, id) {
    var collection = document.getElementById(id).getElementsByTagName('INPUT');
    for (var x = 0; x < collection.length; x++) {
        if (collection[x].type.toUpperCase() == 'CHECKBOX') {
            collection[x].checked = checked;
        }
    }
}


function ToggleDisplay(obj) {
var el = document.getElementById(obj);

if ( el.style.display == 'block' ) {
el.style.display = 'none';
}
else {
el.style.display = 'block';
}

}



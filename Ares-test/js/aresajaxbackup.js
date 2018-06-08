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
			  checkboxes[checkboxes.length] = inputs[i];
			  alert('a');
			  }
		  }
        } 
        else
        {
          for(k = 0; k < inputs[i].length; k++)
          {
            if (inputs[i][k].type == 'checkbox')
			{
				if (inputs[i][k].checked && inputs[i][k].name.match('HotList'))
				{
	             	checkboxes[checkboxes.length] = inputs[i];
					alert('b');
				}
			}
          }
        }
      }
  }
}

/*		  if (Action == 'del')
		  {
			http.open("GET", "ares.dll?action=70&type=783&SessionID=" + escape(sessionid) + "&Value=" + escape(checkboxes[i].name.replace("HotList","")) , true);
		  }
		  else
		  {
		  http.open("GET", "ares.dll?action=70&type=782&SessionID=" + escape(sessionid) + "&Value=" + escape(checkboxes[i].name.replace("HotList","")) , true);			  
		  }	  
		  isWorking = true;
          http.onreadystatechange = handleToggleHotListResponse;
		  http.send(null);			  */


function deleteRows(rowObjArray)
{
	for (var i=0; i<rowObjArray.length; i++) 
	{
		var rIndex = rowObjArray[i].sectionRowIndex;
		rowObjArray[i].parentNode.deleteRow(rIndex);
	}
}

function handleToggleHotListResponse() {
  if (http.readyState == 4) {
	var xmlDocument = http.responseXML;
	if (xmlDocument.getElementsByTagName('araj_code').item(0).firstChild.data == 1) {
		if (xmlDocument.getElementsByTagName('hotlistaction').item(0).firstChild.data == 'del') {
			var itemid = xmlDocument.getElementsByTagName('itemid').item(0).firstChild.data;
			for(var k=0;k<inputs.length;k++)
			{
			var input = inputs[k];
			if(input.type!= 'checkbox') continue;
			if (input.name.match('HotList' + itemid))
			 {			
				var parCell = input.parentNode;
				input.disabled = true;
				newdiv = document.createTextNode("Removed");
				parCell.appendChild(newdiv); 
			 }
			}
		}
		if (xmlDocument.getElementsByTagName('hotlistaction').item(0).firstChild.data == 'add') {
			var itemid = xmlDocument.getElementsByTagName('itemid').item(0).firstChild.data;
			for(var k=0;k<inputs.length;k++)
			{
			var input = inputs[k];
			if(input.type!= 'checkbox') continue;
			if (input.name.match('HotList' + itemid))
			 {			
				var parCell = input.parentNode;
				input.disabled = true;
				newdiv = document.createTextNode("Added");
				parCell.appendChild(newdiv); 

			 }
			}
		}

	}
  }
      isWorking = false;  
}

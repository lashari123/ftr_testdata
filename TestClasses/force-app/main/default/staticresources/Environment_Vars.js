var ESB_ENDPOINT="http://esb.czncorp.com";
var ESB_ENDPOINT_PRODUCTS=ESB_ENDPOINT;
var DATAREGION = "CP1"; 
//var ESB_ENDPOINT_PRODUCTS="http://esbwpsqat02.czncorp.com";
//var DATAREGION = "CP9"; 

var URL = parent.location.href ; 
var SFDC_URL = 'https://' + location.hostname;  

var IS_PROD = false; 
var IS_TRAINING = false;
var SFDC_SERVER = 'cs1'; 

function SetContainerHeight(modifyHeight)
{
	var flashsection = document.getElementById('flashcontent'); 
	flashsection.style.height = parseInt(modifyHeight) + 'px';
	return "successful";
}

function ScrollPage(height)
{
	var curtop = 0;
	var elementNode = document.getElementById('flashcontent');
	if (elementNode.offsetParent)
	{
		curtop = elementNode.offsetTop;
		while (elementNode = elementNode.offsetParent)
		{
			curtop += elementNode.offsetTop;
		}
	}
	parent.window.scroll(0,curtop + parseInt(height));
}

function getHtmlContainerOffset()
{
	var curtop = 0;
	var curleft = 0;
	var elementNode = document.getElementById('flashcontent');
	if (elementNode.offsetParent)
	{
		curtop = elementNode.offsetTop;
		curleft = elementNode.offsetLeft;
		while (elementNode = elementNode.offsetParent)
		{
			curtop += elementNode.offsetTop;
			curleft += elementNode.offsetLeft;
		}
	}
	return curleft + '|' + curtop;
}
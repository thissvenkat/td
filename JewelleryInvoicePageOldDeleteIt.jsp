<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.ntj.db.JewelleryItemDB"%> 
<%@page import="com.ntj.model.JewelleryItemModel"%> 
    <%@page import="com.ntj.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>.: AKSHAYAA || INVOICE :.</title>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script src="assets/js/tablefilter.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script type="text/javascript">
$(function(){
	$('*[name=invoiceTime]').appendDtpicker({
		"inline": false,
		"locale": "foo",
		"externalLocale": {  
			foo: { 
				days: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
				months: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
				sep: '-',
				format: 'YYYY-MM-DD hh:mm:00',
				prevMonth: 'Foo',
				nextMonth: 'Bar',
				today: 'Foobar'
			} 
		}
	});
});

$(document).ready(function() {
	$('table[id=resultTable]').tableFilter({
		//input : "input[type=search]", Default element
trigger : {
			event 	: "keyup",
			//element : "button[name=btn-filtro]"
		},
	//timeout: 80,
		sort : true,
		//caseSensitive : false, Default
		callback : function() { /* Callback após o filtro */
		},
		notFoundElement : ".not-found"
	});
});
</script>
</head>
<body>
<form name="JewelleryInvoicePage"  method="Post" action="JewelleryInvoiceController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryInvoicePage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryInvoicePage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryInvoicePage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%"> 
</a>
</div>
<div class="pageFirstCentrediv">
<div class="pageFirstCentreTopdiv"></div>
<div class="pageFirstCentreBottomdiv">
<%@include file="JewelleryMenuBarPage.html"%>
</div>
</div>
<div class="pageFirstRightdiv">
<a href="JewelleryInvoiceSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>

<div class="pageSecondInvoicediv">
<BR>
<table style="margin-left: auto; margin-right: auto; font-size: 10px;">
<tr>
<td>INO</td>
<td><input type="text" name="invoiceIno" id="invoiceIno" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 10px;" value=""></td>
<td>DATE</td>
<td><input type="text" name="invoiceTime" id="invoiceTime" class="textboxCss" style="max-width:150px;min-width:150px; font-size: 10px;" value=""></td>
<td>MODE</td>
<td><input type="text" name="invoiceMode" id="invoiceMode" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 10px;" value=""></td>
<td>BILL BY</td>
<td><input type="text" name="invoiceBy" id="invoiceBy" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 10px;" value=""></td>
</tr>
</table>
<br>

<TABLE>
<tr>
<td style="font-size: 30px;">CUSTOMER</td>
<td style="font-size: 30px;"><input type="text" name="invoiceCustomerCNo" id="invoiceCustomerCNo" class="textboxCss" style="max-width:250px;min-width:250px; font-size: 12px;" value=""></td>
</tr>
</TABLE>
<br>
<table>
<tr>
<th style="max-width:70px;min-width:70px; font-size: 20px;">SI</th>
<th style="max-width:150px;min-width:150px; font-size: 20px;">TYPE</th>
<th style="max-width:70px;min-width:70px; font-size: 20px;">QTY</th>
<th style="max-width:130px;min-width:130px; font-size: 20px;">WEIGHT</th>
<th style="max-width:100px;min-width:100px; font-size: 20px;">WASTAGE</th>
<th style="max-width:80px;min-width:80px; font-size: 20px;">F.WEI</th>
<th style="max-width:150px;min-width:150px; font-size: 20px;">AMOUNT</th>
</tr>
</table>
<div class="pageThirdSubInvoicediv">
</div>
<table>
<tr>
<th style="max-width:220px;min-width:220px; font-size: 20px;">TOTAL</th>
<th style="max-width:70px;min-width:70px; font-size: 20px;">
<input type="text" name="invoiceTotQty" id="invoiceTotQty" class="textboxCss" style="max-width:70px;min-width:70px; font-size: 12px;" value=""></th>
<th style="max-width:130px;min-width:130px; font-size: 20px;">
<input type="text" name="invoiceTotWeight" id="invoiceCGST" class="textboxCss" style="max-width:70px;min-width:70px; font-size: 12px;" value=""></th>
<th style="max-width:100px;min-width:100px; font-size: 20px;"></th>
<th style="max-width:80px;min-width:80px; font-size: 20px;">
<input type="text" name="invoiceTotFWeight" id="invoiceCGST" class="textboxCss" style="max-width:70px;min-width:70px; font-size: 12px;" value=""></th>
<th style="max-width:150px;min-width:150px; font-size: 20px;">
<input type="text" name="invoiceAmt" id="invoiceAmt" class="textboxCss" style="max-width:70px;min-width:70px; font-size: 12px;" value=""></th>
</tr>
</table>

<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>CGST</td>
<td><input type="text" name="invoiceCGST" id="invoiceCGST" class="textboxCss" style="max-width:80px;min-width:100px; font-size: 12px;" value=""></td>
<td>SGST</td>
<td><input type="text" name="invoiceSGST" id="invoiceSGST" class="textboxCss" style="max-width:80px;min-width:150px; font-size: 12px;" value=""></td>
<td>TOT AMT</td>
<td><input type="text" name="invoiceTotAmt" id="invoiceTotAmt" class="textboxCss" style="max-width:80px;min-width:100px; font-size: 12px;" value=""></td>
<td>ROUND</td>
<td><input type="text" name="invoiceRoundOff" id="invoiceRoundOff" class="textboxCss" style="max-width:80px;min-width:100px; font-size: 12px;" value=""></td>
</tr>
<TR>
<td>PAY TYPE</td>
<td><input type="text" name="invoicePType" id="invoicePType" class="textboxCss" style="max-width:80px;min-width:100px; font-size: 12px;" value=""></td>
</TR>
</table>
</div>
<div class="pageThirdInvoicediv">
<BR>

<div align="center">
SEARCH &nbsp<input type="search" class="textBoxSearch" placeholder="Filter" style="min-width: 300px; max-width: 300px;">
</div>
  
<BR>
<div class="not-found" style="display: none;">No Result Found</div>

</div>
<div class="pageFourthInvoicediv"></div>
<div class="pageFifthInvoicediv"></div>
</div>

</form>
</body>
</html>

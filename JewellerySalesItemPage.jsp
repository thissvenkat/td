<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ntj.db.JewellerySalesItemDB"%>
<%@page import="com.ntj.db.JewelleryItemDB"%> 

<%@page import="com.ntj.model.JewellerySalesItemModel"%> 
<%@page import="com.ntj.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%> 
<%@page import="com.ntj.model.JewelleryItemModel"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/>
<link rel="stylesheet" href="assets/css/style.css"/>
<script src="assets/js/tablefilter.js"></script>
<script type="text/javascript" src="assets/js/commonJS.js"></script>
<script src="assets/js/jquery.min.js"></script>  
 <script>  
    var $x = jQuery.noConflict();
</script>    
<script>
$x(document).ready(function() {
	var max_fields      = 10; //maximum input boxes allowed
	var wrapper   		= $x(".input_fields_wrap"); //Fields wrapper
	var add_button      = $x(".add_field_button"); //Add button ID
	var wrapper1  		= $x(".input_fields_wrap1"); //Fields wrapper for katcha
	var add_button1 	=$x(".add_field_button1"); //Add button ID for Katcha
	var x =1; //initlal text box count
	var y=1; 

	$x(add_button).click(function(e){ //on add input button click
		e.preventDefault();
	
		if(x < max_fields){ //max input box allowed 
				 //text box increment	
				 x++;
			$x(wrapper).append(  
			'<tr><td></td>'
			+'<td><input type="text" name="salesItemSNo'+x+'" id="salesItemSNo'+x+'" class="textboxNumCss" style="max-width:40px;min-width:40px;" value="'+x+'" tabindex="-1"/></td>'
			+'<td><input type="text" name="salesItemSType'+x+'" id="salesItemSType'+x+'" class="textboxCss" style="max-width:150px;min-width:150px;" value=""/></td>'
			+'<td><input type="text" name="salesItemSCount'+x+'" id="salesItemSCount'+x+'" class="textboxCssSCount" style="max-width:40px;min-width:40px;" value="" onkeyup="sumSalesCount();" onkeypress="return isNumberEvent(event)"/></td>' 
			+'<td><input type="text" name="salesItemSWeight'+x+'" id="salesItemSWeight'+x+'" class="textboxCssSWeight" style="max-width:40px;min-width:40px;" value="" onkeyup="sumSalesWeight();sumSalesPureCalc();" onkeypress="return isNumberEvent(event)"/></td>'
			+'<td><input type="text" name="salesItemSWastage'+x+'" id="salesItemSWastage'+x+'" class="textboxNumCss" style="max-width:40px;min-width:40px;" value="" onkeyup="sumSalesPureCalc();" onkeypress="return isNumberEvent(event)"/></td>'
			+'<td><input type="text" name="salesItemSMinus'+x+'" id="salesItemSMinus'+x+'" class="textboxNumCss" style="max-width:40px;min-width:40px;" value="0" tabindex="-1" onkeyup="sumSalesPureCalc();" /></td>'
			+'<td><input type="text" name="salesItemSNetWeight'+x+'" id="salesItemSNetWeight'+x+'" class="textboxNumCss" style="max-width:40px;min-width:40px;" tabindex="-1" value="" /></td>'
			+'<td><input type="text" name="salesItemSPure'+x+'" id="salesItemSPure'+x+'" class="textboxCssSPure" style="max-width:40px;min-width:40px;" value="" tabindex="-1" onkeyup="sumSalesPure()" /></td>'
			+'<td><a href="#" class="remove_field" tabindex="-1">Remove</a></td></tr>'); //add input box
			  $x("#salesItemSNoTot").val(x);
			document.getElementById("salesItemSType"+x).focus(); 
		} 
	});   
	

	$x(add_button1).click(function(e){ //on add input button click
		e.preventDefault();
		if(y < max_fields){ //max input box allowed 
				 //text box increment	
				 y++; 
			$x(wrapper1).append(   
			'<tr><td></td>'
			+'<td><input type="text" name="salesItemRNo'+y+'" id="salesItemRNo'+y+'" class="textboxNumCss" style="max-width:30px;min-width:30px;" value="'+y+'" tabindex="-1"/></td>'
			+'<td><input type="text" name="salesItemRWeight'+y+'" id="salesItemRWeight'+y+'" class="textboxCssRWeight" style="max-width:85px;min-width:85px;" value=""  onkeyup="sumReturnWeight();sumReturnPureCalc();"/></td>'
			+'<td><input type="text" name="salesItemRResult'+y+'" id="salesItemRResult'+y+'" class="textboxNumCss" style="max-width:85px;min-width:85px;" value="" onkeyup="sumReturnPureCalc();"/></td>'
			+'<td><input type="text" name="salesItemRCalc'+y+'" id="salesItemRCalc'+y+'" class="textboxNumCss" style="max-width:70px;min-width:70px;" value="" onkeyup="sumReturnPureCalc();"/></td>'
			+'<td><input type="text" name="salesItemRPure'+y+'" id="salesItemRPure'+y+'" class="textboxCssRPure" style="max-width:85px;min-width:85px;" tabindex="-1" value=""/></td>'
			+'<td><a href="#" class="remove_field1" tabindex="-1">Remove</a></td></tr>'); //add input box
			 $x("#salesItemRNoTot").val(y);
			 document.getElementById("salesItemRWeight"+y).focus();
			} 
			});  
	 
	$x(wrapper).on("click",".remove_field", function(e){ //user click on remove text
		x--;
		$x("#salesItemSNoTot").val(x); 
		e.preventDefault(); $(this).closest('tr').remove();	
		sumSalesCount();sumSalesWeight();sumSalesPureCalc();
	})
	$x(wrapper1).on("click",".remove_field1", function(e){ //user click on remove text
		y--;
		$x("#salesItemRNoTot").val(y);
		e.preventDefault(); $(this).closest('tr').remove();
	})
});
</script>
<script>
$x(document).ready(function() {
    $x('.textboxNumCss,.textboxNumCssNvisible,.textboxCssSCount,.textboxCssSWeight,.textboxCssSPure,.textboxCssRWeight,.textboxCssRPure').keypress(function (event) {
    
        	return isNumber(event, this);
        
    });
});

function isNumber(evt, element) {
 
    var charCode = (evt.which) ? evt.which : event.keyCode

    if (
        (charCode != 45 || $(element).val().indexOf('-') != -1) &&      // “-” CHECK MINUS, AND ONLY ONE.
        (charCode != 46 || $(element).val().indexOf('.') != -1) &&      // “.” CHECK DOT, AND ONLY ONE.
        (charCode < 48 || charCode > 57))
        return false;

    return true;
}    

function isNumberEvent(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if  ((charCode != 45 || $(element).val().indexOf('-') != -1) &&    // “-” CHECK MINUS, AND ONLY ONE.
    (charCode != 46 || $(element).val().indexOf('.') != -1) &&      // “.” CHECK DOT, AND ONLY ONE.
    (charCode < 48 || charCode > 57))
        return false;
    
    return true;
}
/* 
//salesItemSType1 salesItemSWastage1
$x(function () {
    $x("#foodItemNameSelect").change(function () {
  //document.getElementById("salesItemSType1").value=$x("#foodItemNameSelect").find("option:selected").text();
   document.getElementById("salesItemSWastage1").value=$x("#foodItemNameSelect").val();
        });
});
 */
 
 function getValueA(){
 //document.getElementById("salesItemSType1").value=document.getElementById("foodItemNameSelect").find("option:selected").text();	 
 var e = document.getElementById("foodItemNameSelect");
var div = e.options[e.selectedIndex].text;
var test=document.getElementById("foodItemNameSelect").options[e.selectedIndex].text;
 alert("from here : "+test);
 }

 
$x(document).ready(function () {
    $x.fn.enterkeytab = function () {
        $x(this).on('keydown', 'input[class=textboxCss],input[class=textboxNumCss]', function (e) {
            var self = $x(this)
              , form = self.parents('form:eq(0)')
              , focusable
              , next
            ;
            if (e.keyCode == 13) {
                focusable = form.find('input[class=textboxCss],input[class=textboxNumCss],select[class=textboxCss],input[class=buttonCss]').filter(':visible');
                next = focusable.eq(focusable.index(this)+1);
                if (next.length) {
                    next.focus();
                } else {
                    form.submit();
                }
                return false;
            }
        });
    }
    $x("form").enterkeytab();
});  
   
$x(document).ready(function(){
	$x(".textboxCssSWeight,.textboxCssSPure,.textboxCssSCount").each(function() { 
		$x(this).keyup(function(){
			sumSalesWeight();
			sumSalesPureCalc();
			sumSalesCount();
			getNewBalance();
		});
	});
});
function sumSalesWeight() {
	
	var textboxCssSWeightTot = 0;
	
	$(".textboxCssSWeight").each(function() {
		if(!isNaN(this.value) && this.value.length!=0) {	
			textboxCssSWeightTot += parseFloat(this.value);
		}
	});
	$("#salesItemSNetWeightTot").val(textboxCssSWeightTot);
	getNewBalance();
}

function sumSalesPureCalc() {
var totSno=document.getElementById("salesItemSNoTot").value;
var i;
for (i = 1; i <= totSno; i++) { 
	document.getElementById("salesItemSNetWeight"+i).value=((document.getElementById("salesItemSWeight"+i).value)-(document.getElementById("salesItemSMinus"+i).value)).toFixed(3);
	document.getElementById("salesItemSPure"+i).value=(((document.getElementById("salesItemSWeight"+i).value)-(document.getElementById("salesItemSMinus"+i).value))*((document.getElementById("salesItemSWastage"+i).value)/100)).toFixed(3);
	sumSalesTotPure();
	getNewBalance();
}
}

function sumSalesTotPure() {
	var textboxCssSPureTot = 0;
$(".textboxCssSPure").each(function() {
	if(!isNaN(this.value) && this.value.length!=0) {
		textboxCssSPureTot += parseFloat(this.value);
		
	}
});
textboxCssSPureTot=(parseFloat(textboxCssSPureTot)).toFixed(3);
$("#salesItemSPureTot").val(textboxCssSPureTot);
getNewBalance();
}

function sumSalesCount() {
	var textboxCssSCountTot = 0;
$(".textboxCssSCount").each(function() {
	if(!isNaN(this.value) && this.value.length!=0) {
		textboxCssSCountTot += parseFloat(this.value);
	}
});
 
$("#salesItemSCountTot").val(textboxCssSCountTot); 
getNewBalance();
getNewCashBalance();
}


function sumReturnWeight() {
	var textboxCssRWeightTot = 0;
$(".textboxCssRWeight").each(function() {
	if(!isNaN(this.value) && this.value.length!=0) {	
		textboxCssRWeightTot += parseFloat(this.value);
	}
});
textboxCssRWeightTot=(parseFloat(textboxCssRWeightTot)).toFixed(3);
$("#salesItemRWeightTot").val(textboxCssRWeightTot);
getNewBalance();
}

function sumReturnTotPure() {
	
	var textboxCssRPureTot = 0;
$(".textboxCssRPure").each(function() {
	if(!isNaN(this.value) && this.value.length!=0) {
		textboxCssRPureTot += parseFloat(this.value);
		
	}
});
textboxCssRPureTot=(parseFloat(textboxCssRPureTot)).toFixed(3);
$("#salesItemRPureTot").val(textboxCssRPureTot);
getNewBalance();
}


function sumReturnPureCalc() {
	
	var totSno=document.getElementById("salesItemRNoTot").value;
	var i;
	for (i = 1; i <= totSno; i++) { 
		document.getElementById("salesItemRPure"+i).value=(((document.getElementById("salesItemRWeight"+i).value)*((document.getElementById("salesItemRResult"+i).value)/100)*((document.getElementById("salesItemRCalc"+i).value)/100))).toFixed(3);
		sumReturnTotPure();
		getNewBalance();
	}
	}

function getNewBalance(){
	document.getElementById("salesItemNewMBal").value=((parseFloat(document.getElementById("salesItemMbal").value)+parseFloat(document.getElementById("salesItemSPureTot").value))-(parseFloat(document.getElementById("salesItemRPureTot").value)+parseFloat(document.getElementById("salesItemCHPure").value))).toFixed(3);
	getOverAllCash();
}

function getNewCashBalance(){
	document.getElementById("salesItemNewCBal").value=(parseFloat(document.getElementById("salesItemCbal").value)+(parseFloat(document.getElementById("salesItemSCountTot").value)*25));
}
function getOverAllCash(){
	document.getElementById("salesItemOverAll").value=(((parseFloat(document.getElementById("salesItemNewMBal").value))*(parseFloat(document.getElementById("salesItemBSRate").value)))+(parseFloat(document.getElementById("salesItemNewCBal").value))).toFixed(0);
}
function getPureForCash(){
	if(parseFloat(document.getElementById("salesItemCHCash").value)>0){
		document.getElementById("salesItemCHRate").value=document.getElementById("salesItemBSRate").value;
		document.getElementById("salesItemCHPure").value=(parseFloat(document.getElementById("salesItemCHCash").value)/parseFloat(document.getElementById("salesItemCHRate").value)).toFixed(3);
	}else{
		document.getElementById("salesItemCHRate").value=document.getElementById("salesItemBBRate").value;
		document.getElementById("salesItemCHPure").value=(parseFloat(document.getElementById("salesItemCHCash").value)/parseFloat(document.getElementById("salesItemCHRate").value)).toFixed(3);
	}
		
	getNewBalance();
}


</script> 
<script type="text/javascript" src="assets/js/ntjAjax.js"></script>
<script type="text/javascript" src="assets/js/jquery-3.3.1.js"></script>  
<script type="text/javascript" src="assets/js/jquery-1.4.2.min.js"></script>
<script>
var $j = jQuery.noConflict();
</script>  
<script type="text/javascript" src="assets/js/jquery.autocomplete.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function () {
    var d = new Date(),
    date = (d.getFullYear()+'-'+(d.getMonth()+1) + '-' + (d.getDate()) + ' '+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds() );
    $('#salesItemBDate').val(date);       
});
</script> 
</head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>.: AKSHAYAA || SALES ITEM :.</title>  

<script> 
	jQuery(function(){ 
		$j("#salesItemCname").autocomplete("list.jsp"); 
	});
</script>

<script type="text/javascript">
$(document)ready(function()
		{
		$('#resultTable thead th').each(function(i)
		{
		calculateColumn(i);
		});
		});
	
function calculateColumn(index)
{
var total=0;
var total1=0;
var total2=0;
var total3=0;
var total4=0;
var total5=0;
var total6=0;

$('table tr:visible').each(function()
{ 
var value = parseFloat($('#tableSalesItemSNetWeight', this).eq(index).text());
var value1 = parseFloat($('#tableSalesItemRNetWeight', this).eq(index).text());
var value2 = parseFloat($('#tableSalesItemCHNetWeight', this).eq(index).text());
var value3 = parseFloat($('#tableSalesItemOMNetWeight', this).eq(index).text());
var value4 = parseFloat($('#tableSalesItemOCNetWeight', this).eq(index).text());
var value5 = parseFloat($('#tableSalesItemNMNetWeight', this).eq(index).text());
var value6 = parseFloat($('#tableSalesItemNCNetWeight', this).eq(index).text());

if (!isNaN(value))
{
total += value;  
}
if (!isNaN(value1))
{
total1 += value1;  
}
if (!isNaN(value2))
{
total2 += value2; 
}
if (!isNaN(value2))
{
total3 += value3; 
}
if (!isNaN(value4))
{
	total4 += value4; 
}
if (!isNaN(value5))
{
	total5 += value5; 
}

if (!isNaN(value6))
{
	total6 += value6; 
}

});
total=(parseFloat(total)).toFixed(3)
total1=(parseFloat(total1)).toFixed(3);
total2=(parseFloat(total2)).toFixed(3);
total3=(parseFloat(total3)).toFixed(3);
total4=(parseFloat(total4)).toFixed(3);
total5=(parseFloat(total5)).toFixed(3);
total6=(parseFloat(total6)).toFixed(3);
$('table tfoot #tableSalesItemSNetWeightTot').eq(index).text(total);
$('table tfoot #tableSalesItemRNetWeightTot').eq(index).text(total1);
$('table tfoot #tableSalesItemCHNetWeightTot').eq(index).text(total2);
$('table tfoot #tableSalesItemOMNetWeightTot').eq(index).text(total3);
$('table tfoot #tableSalesItemOCNetWeightTot').eq(index).text(total4);
$('table tfoot #tableSalesItemNMNetWeightTot').eq(index).text(total5);
$('table tfoot #tableSalesItemNCNetWeightTot').eq(index).text(total6);
}

</SCRIPT>
 
<body>
<form name="JewellerySalesItemPage"  method="post" action="JewellerySalesItemController">
<div class="pageContentdiv">  
<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewellerySalesItemPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewellerySalesItemPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewellerySalesItemPage.jsp"> 
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
<a href="JewelleryItemSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<% 

{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
{
	JewellerySalesItemModel jewellerySalesItemModel=new JewellerySalesItemModel();
	JewellerySalesItemDB jewellerySalesItemDB=new JewellerySalesItemDB();
	JewelleryItemModel jewelleryItemModel = new JewelleryItemModel();
	JewelleryItemDB jewelleryItemDB = new JewelleryItemDB();
	{
           if(request.getParameter("edit_salesItemBNo")!= null){
        	   jewellerySalesItemModel.setSalesItemBNo(request.getParameter("edit_salesItemBNo").toString());
        	   jewellerySalesItemModel=jewellerySalesItemDB.getJewellerySalesItemEditBillNo(jewellerySalesItemModel);
           }else if(request.getParameter("delete_salesItemBNo")!= null){
        	   jewellerySalesItemModel.setSalesItemBNo(request.getParameter("delete_salesItemBNo").toString());
        	   if(jewellerySalesItemDB.getJewellerySalesItemBNoDelete(jewellerySalesItemModel)){ 
						response.sendRedirect("JewellerySalesItemPage.jsp");
						return;
           }} 
           else
       {
        	   jewellerySalesItemModel=jewellerySalesItemDB.getJewellerySalesItemNewBnoCno();
    	 
       } 
       
%> 
<div class="pageSecondSalesItemdiv">
<BR>
<table style="margin-left: auto; margin-right: auto; font-size: 12px;">
<tr> 
<td>BILLNO</td>
<td><input type="text" name="salesItemBNo" id="salesItemBNo" class="textboxCss" style="max-width:50px;min-width:50px;" value="<%=jewellerySalesItemModel.getSalesItemBNo()%>" ></td>
<td>DATE</td>
<td><input type="text" name="salesItemBDate" id="salesItemBDate" class="textboxCss" style="max-width:150px;min-width:150px;" ></td>   
<td>BMODE</td>
<td><input type="text" name="salesItemBMode" id="salesItemBMode" class="textboxCss" style="max-width:40px;min-width:50px;" value="<%=jewellerySalesItemModel.getSalesItemBMode()%>"></td>
<td>CMODE</td>
<td><input type="text" name="salesItemCMode" id="salesItemCMode" class="textboxCss" style="max-width:40px;min-width:50px;" value="<%=jewellerySalesItemModel.getSalesItemCMode()%>"></td>
<td>CUSTNO</td> 
<td><input type="text" name="salesItemCNo" id="salesItemCNo" class="textboxCss" style="max-width:60px;min-width:60px;" value="<%=jewellerySalesItemModel.getSalesItemCNo()%>"></td>
</tr>
</table>
<table  style="margin-left: auto; margin-right: auto;">
<tr>
<th>Customer Name</th>  
<th>MOBILE</th>
<th>M.Bal</th>
<th>C.Bal</th>
</tr>
<tr>
<td><input type="text" name="salesItemCname" id="salesItemCname" class="textboxCss" style="max-width:300px;min-width:300px;" value="<%=jewellerySalesItemModel.getSalesItemCname()%>" autofocus></td>
<td><input type="text" name="salesItemCmobile" id="salesItemCmobile" class="textboxNumCss" style="max-width:150px;min-width:150px;" value="<%=jewellerySalesItemModel.getSalesItemCmobile()%>"></td>
<td><input type="text" name="salesItemMbal" id="salesItemMbal" class="textboxNumCssNvisible" style="max-width:150px;min-width:150px;" value="<%=jewellerySalesItemModel.getSalesItemMbal()%>" tabindex="-1"></td>
<td><input type="text" name="salesItemCbal" id="salesItemCbal" class="textboxNumCssNvisible" style="max-width:150px;min-width:150px;" value="<%=jewellerySalesItemModel.getSalesItemCbal()%>" tabindex="-1" ></td>
</tr>
</table>

<div class="pageSecondSalesFirstItemdiv" style="margin-left: auto; margin-right: auto;">
<table style="margin-left: auto; margin-right: auto;" class="input_fields_wrap" id="input_fields_wrap">
<thead>
<tr> 
<th></th>
<th>SNO</th>
<th>TYPE</th>
<th>COUNT</th>
<th>Wt</th>
<th>WASTAGE</th>
<th>-</th>
<th>Net Wt</th>
<th>PURE</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>

<td><input type="text" name="salesItemSNo1" id="salesItemSNo1" class="textboxNumCssNvisible" style="max-width:40px;min-width:40px;" value="1" onkeyup="getSumValues();" tabindex="-1"></td>
<td><input type="text" name="salesItemSType1" id="salesItemSType1" class="textboxCss" style="max-width:150px;min-width:150px;" value=""></td>
<td><input type="text" name="salesItemSCount1" id="salesItemSCount1" class="textboxCssSCount" style="max-width:40px;min-width:40px;" value="" onkeyup="sumSalesCount();"></td> 
<td><input type="text" name="salesItemSWeight1" id="salesItemSWeight1" class="textboxCssSWeight" style="max-width:40px;min-width:40px;" value="" onkeyup="sumSalesWeight();sumSalesPureCalc();"></td> 
<td><input type="text" name="salesItemSWastage1" id="salesItemSWastage1" class="textboxNumCss" style="max-width:40px;min-width:40px;" value="" onkeyup="sumSalesPureCalc();"></td>
<td><input type="text" name="salesItemSMinus1" id="salesItemSMinus1" class="textboxNumCssNvisible" style="max-width:40px;min-width:40px;" value="0" onkeyup="sumSalesPureCalc()" tabindex="-1"></td>
<td><input type="text" name="salesItemSNetWeight1" id="salesItemSNetWeight1" class="textboxNumCssNvisible" style="max-width:40px;min-width:40px;" value="" tabindex="-1"></td>
<td><input type="text" name="salesItemSPure1" id="salesItemSPure1" class="textboxCssSPure" style="max-width:40px;min-width:40px;" value="" tabindex="-1"></td>
<td><a href="#" class="remove_field" tabindex="-1">Remove</a></td>
</tr>

</tbody>

<tfoot>
            <tr>
            <td><input type="button" class="add_field_button" 
           	 style= "cursor: pointer; padding: 01px 10px; border: 2px solid #018dc4; -webkit-border-radius: 22px; border-radius: 22px;
 			 font: normal 20px/normal Times New Roman, Times, serif; color: rgba(5,5,4,0.9);  background: rgba(25,234,196,1);" value="ADD" onclick="getNewSales()"></td>
 			
			<td><input type="text" name="salesItemSNoTot" id="salesItemSNoTot" value="1" class="textboxNumCss" style="max-width:40px;min-width:40px;" tabindex="-1"></td>
			<td></td>
			<td><input type="text" name="salesItemSCountTot" id="salesItemSCountTot" value="0" class="textboxNumCss" style="max-width:40px;min-width:40px;" tabindex="-1"></td>
           <td><input type="text" name="salesItemSNetWeightTot" id="salesItemSNetWeightTot" value="0" class="textboxNumCss" style="max-width:40px;min-width:40px;" tabindex="-1"></td>
			<td></td>
          <td></td>
          <td></td>
          
           <td><input type="text" name="salesItemSPureTot" id="salesItemSPureTot" value="0" class="textboxNumCss" style="max-width:40px;min-width:40px;" tabindex="-1"></td>
            <td></td>
           
            </tr> 
        </tfoot>
</table>
</div>   

<select id="foodItemNameSelect" name="foodItemNameSelect" class="textboxCss" style="max-width: 200px; min-width: 200px;" tabindex="2" onchange="getValueA();"  autofocus>
<option value="" selected="selected"></option>
<%{ 
	
		HashMap<Integer, JewelleryItemModel> jewelleryItemModelMap = jewelleryItemDB.getJewelleryItemAllData();

		Set entrySet = jewelleryItemModelMap.entrySet();
		Iterator iterator = entrySet.iterator();
		int sno = 0;
		while (iterator.hasNext()) {
			sno++;
			Map.Entry jewelleryItemModelMapValue = (Map.Entry) iterator.next();
			jewelleryItemModel= (JewelleryItemModel) jewelleryItemModelMapValue.getValue(); %>
			
<option value="<%=jewelleryItemModel.getItemSelling()%>"><%=jewelleryItemModel.getItemType().toUpperCase()%></option>
<%} }%> 
</select>


<div class="pageSecondSalesSecondItemdiv" style="margin-left: auto; margin-right: auto;">
<table style="margin-left: auto; margin-right: auto;" class="input_fields_wrap1" id="input_fields_wrap1">
<thead>
<tr>
<th></th>
<th>SNO</th>
<th>K.WEI</th>
<th>RESULT</th>
<th>CALC</th>
<th>PURE</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td><input type="text" name="salesItemRNo1" id="salesItemRNo1" class="textboxNumCss" style="max-width:30px;min-width:30px;" value="1" tabindex="-1"></td>
<td><input type="text" name="salesItemRWeight1" id="salesItemRWeight1" class="textboxCssRWeight" style="max-width:85px;min-width:85px;" value="0" onkeyup="sumReturnWeight();sumReturnPureCalc();"></td>
<td><input type="text" name="salesItemRResult1" id="salesItemRResult1" class="textboxNumCss" style="max-width:85px;min-width:85px;" value="0" onkeyup="sumReturnPureCalc();"></td>
<td><input type="text" name="salesItemRCalc1" id="salesItemRCalc1" class="textboxNumCss" style="max-width:70px;min-width:70px;" value="99.70" onkeyup="sumReturnPureCalc();"></td>
<td><input type="text" name="salesItemRPure1" id="salesItemRPure1" class="textboxCssRPure" style="max-width:85px;min-width:85px;" value="0" tabindex="-1"></td>
<td><a href="#" class="remove_field1" tabindex="-1">Remove</a></td>
</tr>
</tbody>
<tfoot>
            <tr>
            <td><button class="add_field_button1" 
           	 style= "cursor: pointer; padding: 01px 10px; border: 2px solid #018dc4; -webkit-border-radius: 22px; border-radius: 22px;
 			 font: normal 20px/normal Times New Roman, Times, serif; color: rgba(5,5,4,0.9);  background: rgba(25,234,196,1);">Add</button></td>
			<td><input type="text" name="salesItemRNoTot" id="salesItemRNoTot" value="1" class="textboxNumCss" style="max-width:30px;min-width:30px;" tabindex="-1" ></td>
			<td><input type="text" name="salesItemRWeightTot" id="salesItemRWeightTot" value="0" class="textboxNumCss" style="max-width:85px;min-width:85px;" tabindex="-1"></td>
           <td></td> 
           <td></td>
          <td><input type="text" name="salesItemRPureTot" id="salesItemRPureTot" value="0" class="textboxNumCss" style="max-width:85px;min-width:85px;" tabindex="-1"></td>
			<td></td>            
            </tr> 
        </tfoot>
</table>
</div>   

<div class="pageSecondSalesThirdItemdiv" style="margin-left: auto; margin-right: auto;">
<table style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th>MODE</th>
<th>CASH</th>
<th>RATE</th>
<th>PURE</th>
<th></th>
<th></th>
<th style="font-size: 11px;">NEW_MBAL</th>
<th style="font-size: 11px;">NEW_CBAL</th>
<th>OALL</th>
</tr>
</thead>
<tbody> 
<tr>
<td><input type="text" name="salesItemCHMode" id="salesItemCHMode" class="textboxCss" style="max-width:50px;min-width:50px;" value="<%=jewellerySalesItemModel.getSalesItemCHMode()%>" tabindex="-1"></td>
<td><input type="text" name="salesItemCHCash" id="salesItemCHCash" class="textboxNumCss" style="max-width:50px;min-width:50px;" value="1" onkeyup="getPureForCash();"></td>
<td><input type="text" name="salesItemCHRate" id="salesItemCHRate" class="textboxNumCss" style="max-width:50px;min-width:50px;" value="<%=jewellerySalesItemModel.getSalesItemBSRate()%>" onkeyup="getPureForCash();"></td>
<td><input type="text" name="salesItemCHPure" id="salesItemCHPure" class="textboxNumCss" style="max-width:40px;min-width:50px;" value="0" tabindex="-1"></td>
<td style="max-width:50px;min-width:50px;"></td>
<td style="max-width:50px;min-width:50px;"></td>
<td><input type="text" name="salesItemNewMBal" id="salesItemNewMBal" class="textboxNumCss" style="max-width:50px;min-width:50px;" value="0" tabindex="-1"></td>
<td><input type="text" name="salesItemNewCBal" id="salesItemNewCBal" class="textboxNumCss" style="max-width:50px;min-width:50px;" value="0" tabindex="-1"></td>
<td><input type="text" name="salesItemOverAll" id="salesItemOverAll" class="textboxNumCss" style="max-width:50px;min-width:50px;" value="0" tabindex="-1"></td>
</tr>
</tbody>
</table>
</div> 


<input type="submit" name="submit" class="buttonCss" value="SAVE" > 

</div>
<div class="pageThirdSalesItemdiv">
<div>
<br>
<table>
<tr>
<td >BR</td>
<td><input type="text" name="salesItemBBRate" id="salesItemBBRate" class="textboxNumCss" style="max-width:50px;min-width:50px;" value="<%=jewellerySalesItemModel.getSalesItemBBRate()%>"></td>
<td>SR</td>
<td><input type="text" name="salesItemBSRate" id="salesItemBSRate" class="textboxNumCss" style="max-width:40px;min-width:40px;" value="<%=jewellerySalesItemModel.getSalesItemBSRate()%>"></td> 
<td>
<input type="submit" name="submit" value="UPDATE" onclick="form.action='JewelleryGoldRateController';">

</td>
</tr>
</table>
</div>
<div class="not-found" style="display: none;">No Result Found</div><BR>
<table style="margin-left:auto; margin-right:auto; text-align: center;" class="resultTable" id="resultTable">

<thead >
<tr>
<th style="min-width: 30px; max-width: 30px;" data-tsort-type="number">SNO</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">BNO</th>
<th style="min-width: 50px; max-width: 50px;">CNO</th>
<th style="min-width: 50px; max-width: 50px; font-size: 09px;" data-tsort-type="date">DATE</th>
<th style="min-width: 70px; max-width: 70px;">NAME</th>
<th style="min-width: 70px; max-width: 70px;">MBL</th>
<th style="min-width: 40px; max-width: 40px;">SALES</th> 
<th style="min-width: 40px; max-width: 40px;" data-tsort-type="number">RECE</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">CASH.M</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">O-MBAL</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">O-CBAL</th> 
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">N-MBAL</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">N-CBAL</th> 
<th style="min-width: 50px; max-width: 50px;" data-tsort="disabled" data-tfilter="disabled">PRINT</th> 
<th style="min-width: 50px; max-width: 50px;" data-tsort="disabled" data-tfilter="disabled">DELETE</th>
</tr></thead>
<tbody>	

<%	
{
HashMap<Integer, JewellerySalesItemModel> jewellerySalesBillModelMap = jewellerySalesItemDB.getJewellerySalesBillAllData();

Set entrySet = jewellerySalesBillModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0; 
while (iterator.hasNext()) {
	sno++;
	Map.Entry jewellerySalesBillModelMapValue = (Map.Entry) iterator.next();
	jewellerySalesItemModel = (JewellerySalesItemModel) jewellerySalesBillModelMapValue.getValue();%>
<tr>
	<TD style="min-width: 30px; max-width: 30px;" align="center"><%=sno %></TD>
	<TD style="min-width: 20px; max-width: 20px;" align="center"><a href='JewellerySalesItemPage.jsp?edit_salesItemBNo=<%=jewellerySalesItemModel.getSalesItemBNo()%>'><%=jewellerySalesItemModel.getSalesItemBNo()%></a></TD>
	<TD style="min-width: 20px; max-width: 20px;"><%=jewellerySalesItemModel.getSalesItemCNo()%></TD>
	<TD style="min-width: 40px; max-width: 40px; font-size: 09px;"><%=jewellerySalesItemModel.getSalesItemBDate()%></TD>
	<TD style="min-width: 70px; max-width: 70px; overflow: hidden; white-space: nowrap;"><%=jewellerySalesItemModel.getSalesItemCname()%></TD>
	<TD style="min-width: 70px; max-width: 70px;"><%=jewellerySalesItemModel.getSalesItemCmobile()%></TD>
	<TD style="min-width: 40px; max-width: 40px;" id="tableSalesItemSNetWeight"><%=jewellerySalesItemModel.getSalesItemSPureTot()%></TD>
	<TD style="min-width: 40px; max-width: 40px;" id="tableSalesItemRNetWeight"><%=jewellerySalesItemModel.getSalesItemRPureTot()%></TD>
	<TD style="min-width: 40px; max-width: 40px;" id="tableSalesItemCHNetWeight"><%=jewellerySalesItemModel.getSalesItemCHPure()%></TD>
	<TD style="min-width: 40px; max-width: 40px;" id="tableSalesItemOMNetWeight"><%=jewellerySalesItemModel.getSalesItemOldMbal()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemOCNetWeight"><%=jewellerySalesItemModel.getSalesItemOldCbal()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemNMNetWeight"><%=jewellerySalesItemModel.getSalesItemMbal()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemNCNetWeight"><%=jewellerySalesItemModel.getSalesItemCbal()%></TD>
	
	</TR> 
	<%}} %>
</tbody>
<tfoot>
            <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
			<td></td>
            <td></td>
			<td id="tableSalesItemSNetWeightTot" style="font-size: 10px; color: green;"></td>
            <td id="tableSalesItemRNetWeightTot" style="font-size: 10px; color: green;"></td>
      		<td id="tableSalesItemCHNetWeightTot" style="font-size: 10px; color: black;"></td>
            <td id="tableSalesItemOMNetWeightTot" style="font-size: 10px; color: black;"></td>
            <td id="tableSalesItemOCNetWeightTot" style="font-size: 10px; color: black;"></td>
            <td id="tableSalesItemNMNetWeightTot" style="font-size: 10px; color: red;"></td>
            <td id="tableSalesItemNCNetWeightTot" style="font-size: 10px; color: black;"></td>
            </tr>
        </tfoot>
 </table>
</div> 
<div class="pageFifthdiv"></div>
</div>
<%}
DBConnection.disconnect();
}    
%>

</form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.ntj.db.JewelleryPurchaseDB"%> 
<%@page import="com.ntj.model.JewelleryPurchaseModel"%> 
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
<title>.: AKSHAYAA || PURCHASE :.</title>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script src="assets/js/tablefilter.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 

<script>
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}
</script>



<script type="text/javascript">
  var wasSubmitted = false;    
    function checkBeforeSubmit(){
    	
      if(!wasSubmitted) {
        wasSubmitted = true;
        return wasSubmitted;
      } 
      return false;
    }    
</script>
<script type="text/javascript">

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

$(document).ready(function() {
	
	  $(".textboxNumCss,.textboxNumCssNvisible").on('keyup keypress blur change',function(event) {
		 // getCalcultion();
		   return isNumber(event, this)	  
	});
	});


	function isNumber(evt, element) {
	  var charCode = (evt.which) ? evt.which : event.keyCode
			  if ((charCode != 46 || $(element).val().indexOf('.') != -1) && // for only one dot
			  (charCode < 48 || charCode > 57) && // number and arrow key
			  (charCode != 8) && (charCode != 45)) // for backspace & subtract
			
	    return false;
	  return true;
	}

$(document).ready(function()
		{
		$('#resultTable thead th').each(function(i)
		{
		calculateColumn(i);
		});
		});
		function calculateColumn(index)
		{
		var total = 0;
		var total1 = 0;
		var total2 = 0;
		var total3 = 0;
		var total4 = 0;
		var total5=0;
		$('table tr:visible').each(function()
		{ 
		var value = parseFloat($('#purchaseNetWeight', this).eq(index).text());
		var value1 = parseFloat($('#purchaseNetPure', this).eq(index).text());
		var value2 = parseFloat($('#purchaseNetCount', this).eq(index).text());
		var value3 = parseFloat($('#purchaseNetLess', this).eq(index).text());
		var value4 = parseFloat($('#purchaseNetSettle', this).eq(index).text());
		

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
		});
		total=(parseFloat(total)).toFixed(3)
		total1=(parseFloat(total1)).toFixed(3);
		total2=(parseFloat(total2)).toFixed(3);
		total3=(parseFloat(total3)).toFixed(3);
		total4=(parseFloat(total4)).toFixed(3);
		total5=(parseFloat(total4-total1)).toFixed(3);
		$('table tfoot #purchaseNetWeightTot').eq(index).text(total);
		$('table tfoot #purchaseNetPureTot').eq(index).text(total1);
		$('table tfoot #purchaseNetCountTot').eq(index).text(total2);
		$('table tfoot #purchaseNetLessTot').eq(index).text(total3);
		$('table tfoot #purchaseNetSettleTot').eq(index).text(total4);
		$('table tfoot #purchaseNetBalance').eq(index).text(total5);
		
		}

function filterSumTable(){
	
	$(document).ready(function()
			{
				
			$('#resultTable thead th').each(function(i)
			{
			calculateColumn(i);
			});
			});

}
$(function(){
	$('*[name=purchaseDate]').appendDtpicker({
		"inline": false,
		"locale": "foo",
		"externalLocale": {  
			foo: { 
				days: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
				months: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
				sep: '-',
				format: 'YYYY-MM-DD',
				prevMonth: 'Foo',
				nextMonth: 'Bar',
				today: 'Foobar'
			} 
		}
	});
});

/* function getWastageByPure(){
	document.getElementById("purchaseWastage").value=(((parseFloat(document.getElementById("purchasePure").value))/((parseFloat(document.getElementById("purchaseWeight").value)))-(((parseFloat(document.getElementById("purchaseLess").value)))))*100).toFixed(2);
	document.getElementById("purchaseKWastage").value=(((parseFloat(parseFloat(document.getElementById("purchasePure").value)/(parseFloat(document.getElementById("purchaseMelting").value)/100)))-((parseFloat(document.getElementById("purchaseWeight").value))-(((parseFloat(document.getElementById("purchaseLess").value))))))/((parseFloat(document.getElementById("purchaseWeight").value))-(((parseFloat(document.getElementById("purchaseLess").value)))))*100).toFixed(2);
	}
function getPureByKWastage(){
	document.getElementById("purchasePure").value=((((parseFloat(document.getElementById("purchaseWeight").value))*(parseFloat(document.getElementById("purchaseKWastage").value))/100)+((parseFloat(document.getElementById("purchaseWeight").value))-(((parseFloat(document.getElementById("purchaseLess").value))))))*(parseFloat(document.getElementById("purchaseMelting").value)/100)).toFixed(2);
	document.getElementById("purchaseWastage").value=((parseFloat(document.getElementById("purchasePure").value)/(parseFloat(document.getElementById("purchaseWeight").value)-(((parseFloat(document.getElementById("purchaseLess").value))))))*100).toFixed(2);
	document.getElementById("pureKWastage").innerHTML=(((parseFloat(document.getElementById("purchaseWeight").value))-((((parseFloat(document.getElementById("purchaseLess").value)))))*(parseFloat(document.getElementById("purchaseKWastage").value))/100)).toFixed(2);
}
function getPureByWastage(){
	document.getElementById("purchasePure").value=((parseFloat(document.getElementById("purchaseWeight").value)-(((parseFloat(document.getElementById("purchaseLess").value)))))*parseFloat(document.getElementById("purchaseWastage").value)/100).toFixed(2);
	document.getElementById("purchaseKWastage").value=(((parseFloat(parseFloat(document.getElementById("purchasePure").value)/(parseFloat(document.getElementById("purchaseMelting").value)/100)))-((parseFloat(document.getElementById("purchaseWeight").value))-(((parseFloat(document.getElementById("purchaseLess").value))))))/((parseFloat(document.getElementById("purchaseWeight").value))-(((parseFloat(document.getElementById("purchaseLess").value)))))*100).toFixed(2);
	document.getElementById("pureWastage").innerHTML=(((parseFloat(document.getElementById("purchaseWeight").value))*(parseFloat(document.getElementById("purchaseKWastage").value))/100)*((parseFloat(document.getElementById("purchaseMelting").value)/100))).toFixed(2);
	if(document.getElementById('purchaseWastage').value == "" || document.getElementById('purchaseWastage').value == null || document.getElementById('purchaseWastage').value == "0" ){
		document.getElementById("purchasePure").value=((((((parseFloat(document.getElementById("purchaseWeight").value))-(parseFloat(document.getElementById("purchaseLess").value)))*(parseFloat(document.getElementById("purchaseKWastage").value)))/100)+(parseFloat(document.getElementById("purchaseWeight").value)))*(parseFloat(document.getElementById("purchaseMelting").value))/100).toFixed(3);
	}
	else if(document.getElementById('purchaseKWastage').value == "" || document.getElementById('purchaseKWastage').value == null || document.getElementById('purchaseKWastage').value == "0" ){
	
} */

$(document).ready(function () {
    $.fn.enterkeytab = function () {
        $(this).on('keydown', 'input[class=textboxCss],input[class=textboxNumCss],select[class=textboxCss]', function (e) {
            var self = $(this)
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
    $("form").enterkeytab();
}); 

function getNetPureIncludingWastage(){
	if(document.getElementById('purchaseKWastage').value == "" || document.getElementById('purchaseKWastage').value == null || document.getElementById('purchaseKWastage').value == "0" ){
		document.getElementById("purchasePure").value=(((parseFloat(document.getElementById("purchaseWeight").value))-(parseFloat(document.getElementById("purchaseLess").value)))*(parseFloat(document.getElementById("purchaseWastage").value)/100)).toFixed(3);
	
	}	}
function getNetPureKIncludingWastage(){
	if(document.getElementById('purchaseWastage').value == "" || document.getElementById('purchaseWastage').value == null || document.getElementById('purchaseWastage').value == "0" ){
	document.getElementById("purchasePure").value=((((((parseFloat(document.getElementById("purchaseWeight").value))-(parseFloat(document.getElementById("purchaseLess").value)))*(parseFloat(document.getElementById("purchaseKWastage").value)))/100)+(parseFloat(document.getElementById("purchaseWeight").value)))*(parseFloat(document.getElementById("purchaseMelting").value))/100).toFixed(3);
}}

function getCalsbyLess(){
	if(document.getElementById('purchaseWastage').value == "" || document.getElementById('purchaseWastage').value == null || document.getElementById('purchaseWastage').value == "0" ){
		document.getElementById("purchasePure").value=((((((parseFloat(document.getElementById("purchaseWeight").value))-(parseFloat(document.getElementById("purchaseLess").value)))*(parseFloat(document.getElementById("purchaseKWastage").value)))/100)+(parseFloat(document.getElementById("purchaseWeight").value)))*(parseFloat(document.getElementById("purchaseMelting").value))/100).toFixed(3);
	}else{
		document.getElementById("purchasePure").value=(((parseFloat(document.getElementById("purchaseWeight").value))-(parseFloat(document.getElementById("purchaseLess").value)))*(parseFloat(document.getElementById("purchaseWastage").value)/100)).toFixed(3);
	}
}
</script>  

</head>
<body>
<form name="JewelleryPurchasePage"  method="Post" action="JewelleryPurchaseController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryPurchasePage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryPurchasePage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryPurchasePage.jsp"> 
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
<a href="JewelleryPurchaseSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<%
{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
{
	JewelleryPurchaseModel jewelleryPurchaseModel=new JewelleryPurchaseModel();
       JewelleryPurchaseDB jewelleryPurchaseDB=new JewelleryPurchaseDB();
       {
           if(request.getParameter("edit_purchasePno")!= null){
        	   jewelleryPurchaseModel.setPurchasePno(request.getParameter("edit_purchasePno").toString());
        	   jewelleryPurchaseModel=jewelleryPurchaseDB.getJewelleryPurchaseEditSearchPrint(jewelleryPurchaseModel);
           }else if(request.getParameter("delete_purchasePno")!= null){
        	   jewelleryPurchaseModel.setPurchasePno(request.getParameter("delete_purchasePno").toString());
         	 if(jewelleryPurchaseDB.getJewelleryPurchasePNoDelete(jewelleryPurchaseModel)){
						response.sendRedirect("JewelleryPurchasePage.jsp");
						return;
           } }
           else
       {
    	   jewelleryPurchaseModel=jewelleryPurchaseDB.getJewellerypurchasePno();
    	   
              }
       
%>

<div class="pageSecondPurchasediv">
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>PNO</td>
<td><input type="text" name="purchasePno" id="purchasePno" class="textboxCss" style="font-size:10px; max-width: 80px;min-width: 80px;"  value="<%=jewelleryPurchaseModel.getPurchasePno()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="purchaseDate" id="purchaseDate" class="textboxCss" style="font-size:10px; max-width: 80px;min-width: 80px;"  value="<%=jewelleryPurchaseModel.getPurchaseDate()%>"></td>
<td>MODE</td>
<td><input type="text" name="purchaseMode" id="purchaseMode" class="textboxCss" style="font-size:10px; max-width: 80px;min-width: 80px;"  value="<%=jewelleryPurchaseModel.getPurchaseMode()%>"></td>
</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>FROM</td>
<td><input type="text" name="purchaseFrom" id="purchaseFrom" class="textboxCss"  value="<%=jewelleryPurchaseModel.getPurchaseFrom()%>" autofocus></td>
</tr>
<tr>
<td>TYPE</td>
<td><input type="text" name="purchaseType" id="purchaseType" class="textboxCss"  value="<%=jewelleryPurchaseModel.getPurchaseType()%>"></td>
</tr>
<tr>
<tr>
<td>MELTING</td>
<td><input type="text" name="purchaseMelting" id="purchaseMelting" class="textboxCssNvisible" value="<%=jewelleryPurchaseModel.getPurchaseMelting()%>" onkeydown="getCalsbyMelting();" onkeyup="getCalsbyMelting();"></td>
</tr>
<tr>
<td>WEIGHT</td>
<td><input type="text" name="purchaseWeight" id="purchaseWeight" class="textboxNumCss"  value="<%=jewelleryPurchaseModel.getPurchaseWeight()%>"></td>
</tr>
<tr>
<td>LESS</td>
<td><input type="text" name="purchaseLess" id="purchaseLess" class="textboxNumCss"  value="<%=jewelleryPurchaseModel.getPurchaseLess()%>" onkeydown="getCalsbyLess();" onkeyup="getCalsbyLess();"></td>
</tr>
<tr>
<td>WASTAGE</td>
<td><input type="text" name="purchaseWastage" id="purchaseWastage" class="textboxNumCss"  value="<%=jewelleryPurchaseModel.getPurchaseWastage()%>" onkeydown="getNetPureIncludingWastage();" onkeyup="getNetPureIncludingWastage();"></td>
</tr>
<tr>
<td>KATCHA WASTAGE</td>
<td><input type="text" name="purchaseKWastage" id="purchaseKWastage" class="textboxNumCss" value="<%=jewelleryPurchaseModel.getPurchaseKWastage()%>" onkeydown="getNetPureKIncludingWastage();" onkeyup="getNetPureKIncludingWastage();"></td>
</tr>
<tr>
<td>COUNT</td>
<td><input type="text" name="purchaseCount" id="purchaseCount" class="textboxNumCss"  value="<%=jewelleryPurchaseModel.getPurchaseCount()%>"></td>
</tr>
<tr>
<td>PURE</td>
<td><input type="text" name="purchasePure" id="purchasePure" class="textboxNumCss" value="<%=jewelleryPurchaseModel.getPurchasePure()%>" onkeydown="getWastageByPure();" onkeyup="getWastageByPure();" ></td>
</tr>
<tr> 
<td>SETTLED</td>
<td><input type="text" name="purchaseSettle" id="purchaseSettle" class="textboxNumCss"  value="<%=jewelleryPurchaseModel.getPurchaseSettle()%>"></td>
</tr>
<tr>
<td>COMMAND</td>
<td><input type="text" name="purchaseCommand" id="purchaseCommand" class="textboxCss"  value="<%=jewelleryPurchaseModel.getPurchaseCommand()%>"></td>
</tr>


</tbody>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr><td><input type="submit" name="submit" value="SAVE" id="" class="buttonCss"></td></tr>
</table>
</div> 
<div class="pageThirdPurchasediv">
<BR>
<div align="center">
SEARCH &nbsp<input type="search" class="textBoxSearch" placeholder="Filter" onkeydown="filterSumTable();" onkeyup="filterSumTable();" onkeypress="filterSumTable();" style="min-width: 300px; max-width: 300px;">

</div>  
<BR>
<div class="not-found" style="display: none;">No Result Found</div><BR>
<table style="margin-left:auto; margin-right:auto; text-align: center;" class="resultTable" id="resultTable">

<thead >
<tr>
<th style="min-width: 30px; max-width: 30px;" data-tsort-type="number">NO</th>
<th style="min-width: 50px; max-width: 50px;">P NO</th>
<th style="min-width: 80px; max-width: 80px;" data-tsort-type="date">DATE</th> 
<th style="min-width: 100px; max-width: 100px;">FROM</th>
<th style="min-width: 100px; max-width: 100px;">TYPE</th>
<th style="min-width: 60px; max-width: 60px;" data-tsort-type="number">WEIGHT</th>
<th style="min-width: 60px; max-width: 60px;" data-tsort-type="number">LESS</th>
<th style="min-width: 60px; max-width: 60px;" data-tsort-type="number">%</th>
<th style="min-width: 70px; max-width: 70px;" data-tsort-type="number">PURE</th> 

<th style="min-width: 60px; max-width: 60px;" data-tsort-type="number">SETTLE</th>
<th style="min-width: 60px; max-width: 60px;" data-tsort-type="number">COUNT</th>
<th style="min-width: 80px; max-width: 80px;">COMMAND</th>
<th style="min-width: 100px; max-width: 100px;" data-tsort="disabled" data-tfilter="disabled">PRINT</th> 
<th style="min-width: 100px; max-width: 100px;" data-tsort="disabled" data-tfilter="disabled">DELETE</th>
</tr></thead>
<tbody>	

<%	
{
HashMap<Integer, JewelleryPurchaseModel> jewelleryPurchaseModelMap = jewelleryPurchaseDB.getJewelleryPurchaseModelAllData();

Set entrySet = jewelleryPurchaseModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0;
while (iterator.hasNext()) {   
	sno++;
	Map.Entry jewelleryPurchaseModelMapValue = (Map.Entry) iterator.next();
	jewelleryPurchaseModel = (JewelleryPurchaseModel) jewelleryPurchaseModelMapValue.getValue(); %>
<tr>
	<TD style="min-width: 30px; max-width: 30px;" align="center"><%=sno %></TD>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><a href='JewelleryPurchasePage.jsp?edit_purchasePno=<%=jewelleryPurchaseModel.getPurchasePno()%>'><%=jewelleryPurchaseModel.getPurchasePno()%></a></TD>
	<TD style="min-width: 80px; max-width: 80px; overflow: hidden;" align="center"><%=jewelleryPurchaseModel.getPurchaseDate()%></TD> 
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="left"><%=jewelleryPurchaseModel.getPurchaseFrom()%></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden; font-size: 10px;"  align="center"><%=jewelleryPurchaseModel.getPurchaseType()%></TD>
	<TD style="min-width: 60px; max-width: 60px; overflow: hidden;" align="center" id="purchaseNetWeight" ><%=jewelleryPurchaseModel.getPurchaseWeight()%></TD>
	<TD style="min-width: 60px; max-width: 60px;" id="purchaseNetLess"><%=jewelleryPurchaseModel.getPurchaseLess()%></TD>
	<TD style="min-width: 60px; max-width: 60px;"><%=jewelleryPurchaseModel.getPurchaseWastage()%></TD>
	<TD style="min-width: 70px; max-width: 70px;" id="purchaseNetPure"><%=jewelleryPurchaseModel.getPurchasePure()%></TD>
	
	<TD style="min-width: 60px; max-width: 60px;" id="purchaseNetSettle"><%=jewelleryPurchaseModel.getPurchaseSettle()%></TD>
	<TD style="min-width: 60px; max-width: 60px;" id="purchaseNetCount"><%=jewelleryPurchaseModel.getPurchaseCount()%></TD>
	<TD style="min-width: 100px; max-width: 100px;  overflow: hidden; font-size: 10px; "><%=jewelleryPurchaseModel.getPurchaseCommand()%></TD>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryPurchasePage.jsp?print_purchasePno=<%=jewelleryPurchaseModel.getPurchasePno()%>'>PRI</a></td>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryPurchasePage.jsp?delete_purchasePno=<%=jewelleryPurchaseModel.getPurchasePno()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
	</TR>
	<%} %>
</tbody>
<tfoot>
            <tr>
            <td></td>
            <td></td>
            <td id="purchaseNetBalance" style="min-width: 80px; max-width: 80px; text-align: center; font-size: 15px; color: Green; "></td>
            <td></td>
            <td></td>

            <td id="purchaseNetWeightTot" style="min-width: 60px; max-width: 60px; text-align: center; font-size: 15px; color: black;"></td>
			<td id="purchaseNetLessTot" style="min-width: 60px; max-width: 60px; text-align: center; font-size: 15px; color: black;"></td>
            <td></td>
      		<td id="purchaseNetPureTot" style="min-width: 60px; max-width: 60px; text-align: center; font-size: 15px; color: black;"></td>
            
            <td id="purchaseNetSettleTot" style="min-width: 60px; max-width: 60px; text-align: center; font-size: 15px; color: black;"></td>
            <td id="purchaseNetCountTot" style="min-width: 60px; max-width: 60px; text-align: center; font-size: 15px; color: black;"></td>
            </tr>
        </tfoot>
 </table>
</div>

<div class="pageFifthdiv"></div>
</div>
<%}}}
DBConnection.disconnect();
       
       %>
</form>
</body>
</html>

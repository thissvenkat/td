<%@page import="com.ntj.util.DBConnection"%>  
<%@page import="com.ntj.db.JewellerySalesDB"%>
<%@page import="com.ntj.model.JewellerySalesModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%> 
<%@page import="java.util.Date"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<script type="text/javascript" src="assets/js/ajaxFill.js"></script>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script type="text/javascript">
$(function(){
	$('*[name=salesBillDate]').appendDtpicker({
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
$(function () { 
    $("#salesItemTypeSelected").change(function () {
   document.getElementById("salesItemType").value=$("#salesItemTypeSelected").find("option:selected").text();
   document.getElementById("salesItemWastage").value=$("#salesItemTypeSelected").val();
        });
});

$(function () {
    $("#salesMetalCashSelection").change(function () {
        if ($(this).val() == "METAL") {
            $("#METAL").show();
            $("#CASH").hide();
        } else {
        	 $("#METAL").hide();
            $("#CASH").show();
        }
    });
});

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
		$('table tr').each(function()
		{ 
		var value = parseInt($('#foodFootTot', this).eq(index).text());
		var value1 = parseInt($('#foodFootQtyTot', this).eq(index).text());

		if (!isNaN(value))
		{
		total += value;  
		}
		if (!isNaN(value1))
		{
		total1 += value1;  
		}
		});
		$('table tfoot #foodTotAmountTable').eq(index).text(total);
		$('table tfoot #foodTotQuanityTable').eq(index).text(total1);
		}

</script>

<title>.: CUSTOMER || SALES || PAGE :.</title>

<%
{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
				{  
				JewellerySalesModel jewellerySalesModel = new JewellerySalesModel();
				JewellerySalesDB jewellerySalesDB = new JewellerySalesDB();
					{
					 if ((request.getParameter("edit_salesItemNo") != null)&&(request.getParameter("edit_salesBillNo")!= null)) {
						 jewellerySalesModel.setSalesItemNo(request.getParameter("edit_salesItemNo").toString());
						 jewellerySalesModel.setSalesBillNo(request.getParameter("edit_salesBillNo").toString());
						 jewellerySalesModel=jewellerySalesDB.getJewellerySalesEditItemNo(jewellerySalesModel);
					}else if ((request.getParameter("delete_salesItemNo")!= null)&&(request.getParameter("edit_salesBillNo")!= null)) {
						
						jewellerySalesModel.setSalesItemNo(request.getParameter("delete_salesItemNo").toString());
						jewellerySalesModel.setSalesBillNo(request.getParameter("edit_salesBillNo").toString());
						if (jewellerySalesDB.getJewellerySalesItemNoDelete(jewellerySalesModel))
						response.sendRedirect("JewellerySalesPage.jsp?edit_salesBillNo="+jewellerySalesModel.getSalesBillNo());
						return;
				}else if(request.getParameter("edit_salesBillNo")!= null){
					jewellerySalesModel.setSalesBillNo(request.getParameter("edit_salesBillNo").toString());
					jewellerySalesModel=jewellerySalesDB.getJewellerySalesEditBillNo(jewellerySalesModel);
					
					}else if (request.getParameter("delete_salesBillNo") != null) {
						jewellerySalesModel.setSalesBillNo(request.getParameter("delete_salesBillNo").toString());
							if (jewellerySalesDB.getJewellerySalesBillNoDelete(jewellerySalesModel))
							response.sendRedirect("JewellerySalesPage.jsp");
							return;
					}else {
						jewellerySalesModel = jewellerySalesDB.getJewellerySalesBillNoItemNo();
					}
						
			%>

</head>
<body>

<form name="JewellerySalesPage" id="JewellerySalesPage" method="Post" action="JewellerySalesController">
<div class="pageContentdiv"> 

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewellerySalesPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewellerySalesPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewellerySalesPage.jsp"> 
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
<a href="JewellerySalesSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
</div>
</div>


<div class="pageSeconddiv">
<table style="margin-left: auto;  margin-right:  auto;  margin-top: 15px; font-size:10px;"><tbody>
<tr>
<td>DATE</td><td><input type="text" name="salesBillDate" id="salesBillDate" class="textboxCss" style="font-size:10px; max-width: 50px;min-width: 50px;" value="<%=jewellerySalesModel.getSalesBillDate()%>"  readonly></td>
<td>BNO</td><td><input type="text" name="salesBillNo" id="salesBillNo" class="textboxCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesBillNo()%>"  readonly></td>
<td>INO</td><td><input type="text" name="salesItemNo" id="salesItemNo" class="textboxCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesItemNo()%>"  readonly></td>
<td>MNO</td><td><input type="text" name="salesMetalMno" id="salesMetalMno" class="textboxCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesMetalMno()%>"  readonly></td>
<td>BM</td><td><input type="text" name="salesBillMode" id="salesBillMode" class="textboxCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesBillMode()%>" readonly>
<td>IM</td><td><input type="text" name="salesItemMode" id="salesItemMode" class="textboxCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesItemMode()%>" readonly>
<td>MM</td><td><input type="text" name="salesMetalMode" id="salesMetalMode" class="textboxCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesMetalMode()%>" readonly>

</tr>

<tr>
<td>TYPE</td><td colspan="3"><input type="text" name="salesItemType" id="salesItemType" class="textboxCss" style="font-size:12px; max-width: 130px;min-width: 130px;" value="<%=jewellerySalesModel.getSalesItemType()%>"></td>
<td>CODE</td><td><input type="text" name="salesItemCode" id="salesItemCode" class="textboxCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesItemCode()%>"></td>
<td>DISC</td><td><input type="text"  id="salesBillDiscount" name="salesBillDiscount" class="textboxNumCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesBillDiscount()%>"> </td>
<td>HM</td><td><input type="text"  id="salesHCharge" name="salesHCharge" class="textboxNumCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesBillDiscount()%>"> </td>
<td>BAL</td><td><input type="text"  id="salesBalaceMetal" name="salesBalaceMetal" class="textboxNumCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesBillDiscount()%>"> </td>
<td>AMT</td><td><input type="text"  id="salesBalaceAmount" name="salesBalaceAmount" class="textboxNumCss" style="font-size:10px; max-width: 40px;min-width: 40px;" value="<%=jewellerySalesModel.getSalesBillDiscount()%>"> </td>
</tr>
</tbody>
</table>
<table style="margin-left: auto;  margin-right:  auto;  margin-top: 50px;">
<tr><td>NAME</td>
<td><input type="text" id="salesBillName" name="salesBillName" class="textboxNumCss" style="max-width: 200px;min-width: 200px; max-height:  50PX;  min-height: 50px; font-size:  50px" value="<%=jewellerySalesModel.getSalesBillName()%>" required=''> </td>
<td>
<input type="text"  id="salesBillMobile" name="salesBillMobile" class="textboxNumCss" style="max-width: 200px;min-width: 200px; max-height:  50PX;  min-height: 50PX; font-size:  50px;" value="<%=jewellerySalesModel.getSalesBillMobile()%>"> </td>
</tr>
</table>
<table style="margin-left: auto;  margin-right:  auto;  margin-top: 10px; font-size:25px;"><tbody>

<tr><td>TYPE</td>
<td><select id="salesItemTypeSelected" name="salesItemTypeSelected" class="textboxCss" style="max-width: 200px; min-width: 200px;" autofocus >
<option value="" selected="selected"></option>
<%
{

ResultSet resultSet = jewellerySalesDB.getJewelleryItemTypeSelect();
while (resultSet.next()) {
	
if(jewellerySalesModel.getSalesItemType().toString().equalsIgnoreCase(resultSet.getString(3))){
%>
<option value=<%=resultSet.getString(5)%> selected="selected"><%=resultSet.getString(3)%></option>
<%}else{%>
<option value=<%=resultSet.getString(5)%>><%=resultSet.getString(3)%></option>
<%	}}}%> 

</select></td>
<td>WASTAGE</td><td><input type="text" name="salesItemWastage" id="salesItemWastage" class="textboxCss" style="font-size:25px; max-width: 100px;min-width: 100px;" value="<%=jewellerySalesModel.getSalesItemWastage()%>" onkeydown="getQtyBasedAmount()" onkeyup="getQtyBasedAmount()"></td></tr>
<tr>
<td>COUNT</td><td><input type="text" name="salesItemCount" id="salesItemCount" class="textboxCss" style="font-size:25px; max-width: 200px;min-width: 200px;" value="<%=jewellerySalesModel.getSalesItemCount()%>"></td>
<td>PURITY</td><td><input type="text" name="salesItemPurity" id="salesItemPurity" class="textboxCss" style="font-size:25px; max-width: 100px;min-width: 100px;" value="<%=jewellerySalesModel.getSalesItemPurity()%>"></td>
</tr>

<tr><td>WEIGHT</td><td><input type="text" name="salesItemWeight" id="salesItemWeight" class="textboxCss" style="font-size:25px; max-width: 200px;min-width: 200px;" value="<%=jewellerySalesModel.getSalesItemWeight()%>"></td>
<td>PURE</td><td><input type="text" name="salesItemPure" id="salesItemPure" class="textboxCss" style="font-size:25px; max-width: 100px;min-width: 100px;" value="<%=jewellerySalesModel.getSalesItemPure()%>" ></td></tr>
</tbody>
</table>
<table style="margin-left: auto;  margin-right:  auto;  margin-top: 30px;">
<TR><td><input type="submit" id="salesItemAddCart" name="submit" class="buttonCss" value="ADD CART"  onclick="return getEmptyValidation();"> </td>
<td><input type="submit" id="salesBillCart" name="submit" class="buttonCss" value="BILL"> </td></tr>
</table>
<select id="salesMetalCashSelection" class="textboxCss" style="max-width: 100px; min-width: 100px; margin-left: 80px;">
    <option value="METAL">METAL</option> 
    <option value="CASH">CASH</option>
</select>


<div id="METAL"> 
<table style="margin-left: auto;  margin-right:  auto;  margin-top: 10px; font-size: 15PX;">
<tr>
<td>WEIGHT</td><td><input type="text" name="salesMetalWeight" id="salesMetalWeight" class="textboxCss" style="font-size:20px; max-width: 100px;min-width: 100px;" value="<%=jewellerySalesModel.getSalesMetalWeight()%>"></td>
<td>RESULT</td><td><input type="text" name="salesMetalResult" id="salesMetalResult" class="textboxCss" style="font-size:20px; max-width: 100px;min-width: 100px;" value="<%=jewellerySalesModel.getSalesMetalResult()%>"></td>
<td>PURE</td><td><input type="text" name="salesMetalPure" id="salesMetalPure" class="textboxCss" style="font-size:20px; max-width: 100px;min-width: 100px;" value="<%=jewellerySalesModel.getSalesMetalPure()%>"></td>
<td><input type="submit" id="salesMetalAddCart" name="submit" class="buttonCss" value="ADD METAL" onclick="return getEmptyValidation();" style="font-size:10px; max-width: 20px;min-width: 20px; max-height: 50px; min-height: 50px;"> </td>
</tr> 
</table> 
</div>

<div id="CASH" style="display: none"> 
<table style="margin-left: auto;  margin-right:  auto;  margin-top: 10px; font-size: 15PX;">
<tr>
<td>1G AMOUNT</td><td><input type="text" name="salesMetalWeight" id="salesMetalWeight" class="textboxCss" style="font-size:20px; max-width: 100px;min-width: 100px;" value="<%=jewellerySalesModel.getSalesMetalWeight()%>"></td>
<td>METAL BALANCE</td><td><input type="text" name="salesMetalResult" id="salesMetalResult" class="textboxCss" style="font-size:20px; max-width: 100px;min-width: 100px;" value="<%=jewellerySalesModel.getSalesMetalResult()%>"></td>
<td>AMT</td><td><input type="text" name="salesMetalPure" id="salesMetalPure" class="textboxCss" style="font-size:20px; max-width: 100px;min-width: 100px;" value="<%=jewellerySalesModel.getSalesMetalPure()%>"></td>
<td><input type="submit" id="salesMetalAddCart" name="submit" class="buttonCss" value="ADD METAL"  onclick="return getEmptyValidation();" style="font-size:10px; max-width: 20px;min-width: 20px; max-height: 50px; min-height: 50px;"> </td>
</tr>  
</table> 
</div>
</div>

<div class="pageThirddiv">

<table	style="margin-left: auto; margin-right: auto; font-size: 15px; margin-top: 20px; background: white;" class="resultTable" id="resultTable">
					<thead>
						<tr style="color: blue;">

							<th style="min-width: 50px; max-width: 50px;">SNO</th>
							<th style="min-width: 100px; max-width: 100px;" align="left">ITEM TYPE</th>
							<th style="min-width: 30px; max-width: 30px;">QTY</th>
							<th style="min-width: 50px; max-width: 50px;">WEIGHT</th>
							<th style="min-width: 50px; max-width: 50px;">WASTAGE</th>
							<th style="min-width: 50px; max-width: 50px;">PURE</th>
							<th style="min-width: 50px; max-width: 50px;">DEL</th>
							
						
						</tr>
						<thead>
					<tbody>

						<%if(request.getParameter("edit_salesBillNo")== null){
							%>
						<tr><td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						</tr>	
							<%}		else{
								
								jewellerySalesModel.setSalesBillNo(request.getParameter("edit_salesBillNo").toString());
							HashMap<Integer, JewellerySalesModel> jewellerySalesModelMap = jewellerySalesDB.getJewellerySalesBillNoItem(jewellerySalesModel);
											
									Set entrySet = jewellerySalesModelMap.entrySet();
									Iterator iterator = entrySet.iterator();
									int sno = 0;
									while (iterator.hasNext()) {
										sno++;
										Map.Entry jewellerySalesModelMapValue = (Map.Entry) iterator.next();
										jewellerySalesModel = (JewellerySalesModel) jewellerySalesModelMapValue.getValue();
						%>
						


						<tr>
							<td style="min-width: 50px; max-width: 50px; text-align: centre;">&nbsp;<%=sno%></td>
							<td style="min-width: 100px; max-width: 100px; text-align: left;  overflow: hidden;"><a href='JewellerySalesPage.jsp?edit_salesItemNo=<%=jewellerySalesModel.getSalesItemNo()%>&edit_salesBillNo=<%=jewellerySalesModel.getSalesBillNo()%>'><%=jewellerySalesModel.getSalesItemType()%></a></td>
							<td style="min-width: 30px; max-width: 30px; text-align: center;"  id="salesCountTot"><%=jewellerySalesModel.getSalesItemCount()%></td>
							<td style="min-width: 50px; max-width: 50px; text-align: center;"><%=jewellerySalesModel.getSalesItemWeight()%></td>
							<td style="min-width: 50px; max-width: 50px; text-align: center;" id="salesWastageTot"><%=jewellerySalesModel.getSalesItemWastage()%></td>
							<td style="min-width: 50px; max-width: 50px; text-align: center;" id="salesPureTot"><%=jewellerySalesModel.getSalesItemPure()%></td>
							<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewellerySalesPage.jsp?delete_salesItemNo=<%=jewellerySalesModel.getSalesItemNo()%>&edit_salesBillNo=<%=jewellerySalesModel.getSalesBillNo()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>					
						</tr>


						<%
       }
							}
%>
<tfoot>
<tr>

<td></td> 
<td id="foodTotQuanityTable" style="min-width: 100px; max-width: 100px; text-align: center; font-size: 25px; color: white;"></td> 
<td><input type="text" name="foodTotQuanity" id="foodTotQuanity" style="font-size:25px; max-width: 100px;min-width: 100px; color: orange;"></td>
<td id="foodTotAmountTable" style="min-width: 100px; max-width: 100px; text-align: center; font-size: 25px; color: white;"></td>
<td><input type="text" name="foodTotAmount" id="foodTotAmount" style="font-size:25px; max-width: 100px;min-width: 100px; color: orange;"></td>    
</tr>
</tfoot> 
</tbody>   
</table>
<%
       }  
%>
</div>

 

 

<div class="pageFourthdiv">

 <table	style="margin-left: auto; margin-right: auto; font-size: 15px; margin-top: 10px; " class="resultTable" id="resultTable">
					<thead>
						<tr style="color: blue;">

							<th style="min-width: 50px; max-width: 50px;">SNO</th>
							<th style="min-width: 80px; max-width: 80px;">BNO</th> 
							<th style="min-width: 30px; max-width: 30px;">QTY</th>
							<th style="min-width: 80px; max-width: 80px;">AMOUNT</th>
							<th style="min-width: 50px; max-width: 50px;">DEL</th>
						
						</tr>
						<thead>
					<tbody>

					
						
						<%
								
						jewellerySalesModel.setSalesBillDate(new SimpleDateFormat("YYYY-MM-dd").format(new Date()).toString());
						
									HashMap<Integer, JewellerySalesModel> jewellerySalesModelMap = jewellerySalesDB.getJewellerySalesBillNoToday(jewellerySalesModel);
											
									Set entrySet = jewellerySalesModelMap.entrySet();
									Iterator iterator = entrySet.iterator();
									int sno = 0;
									while (iterator.hasNext()) {
										sno++;
										Map.Entry jewellerySalesModelMapValue = (Map.Entry) iterator.next();
										jewellerySalesModel = (JewellerySalesModel) jewellerySalesModelMapValue.getValue();
						%>

						<tr>
							<td style="min-width: 50px; max-width: 50px; text-align: centre;"><%=sno%></td>
							<td style="min-width: 80px; max-width: 80px; text-align: centre; "><a href=JewellerySalesPage.jsp?edit_salesBillNo=<%=jewellerySalesModel.getSalesBillNo()%>><%=jewellerySalesModel.getSalesBillNo()%></a></td>
							<td style="min-width: 30px; max-width: 30px; text-align: center;"><%=jewellerySalesModel.getSalesBillTotItems()%></td>
							<td style="min-width: 80px; max-width: 80px; text-align: center;"><%=jewellerySalesModel.getSalesBillTotWeight()%></td>
							<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href=JewellerySalesPage.jsp?delete_salesBillNo=<%=jewellerySalesModel.getSalesBillNo()%> onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
						
						</tr>

	<%
									
									}
%>

					</tbody>   

				</table>
			

</div>

<div class="pageFifthdiv"></div>

 

 

</div>
<%DBConnection.disconnect();
}%>
</form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ntj.db.JewelleryMetalDB"%> 
<%@page import="com.ntj.model.JewelleryMetalModel"%> 
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
<title>.: AKSHAYAA || METAL :.</title>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script type="text/javascript">
$(function(){
	$('*[name=metalDate]').appendDtpicker({
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


</script>
</head>
<body>
<form name="JewelleryMetalPage"  method="Post" action="JewelleryMetalController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryMetalPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryMetalPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryMetalPage.jsp"> 
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
<a href="JewelleryMetalSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<%
{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
{
	JewelleryMetalModel jewelleryMetalModel=new JewelleryMetalModel();
	JewelleryMetalDB jewelleryMetalDB=new JewelleryMetalDB();
       {
           if(request.getParameter("edit_metalMNo")!= null){
        	   jewelleryMetalModel.setMetalMNo(request.getParameter("edit_metalMNo").toString());
        	   jewelleryMetalModel=jewelleryMetalDB.getJewelleryMetalEditSearchPrint(jewelleryMetalModel);
           }else if(request.getParameter("delete_metalMNo")!= null){
        	   jewelleryMetalModel.setMetalMNo(request.getParameter("delete_metalMNo").toString());
         	 if(jewelleryMetalDB.getJewelleryMetalMNoDelete(jewelleryMetalModel)){
						response.sendRedirect("JewelleryMetalPage.jsp");
						return;
           } }
           else
       {
        	   jewelleryMetalModel=jewelleryMetalDB.getJewelleryMetalMno();
    	   
              }
       
%>

<div class="pageSecondPurchasediv">
<BR>
<table style="margin-left: auto; margin-right: auto; font-size: 12px;">
<tr>
<td>M-NO</td>
<td><input type="text" name="metalMNo" id="metalMNo" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 12px;" value="<%=jewelleryMetalModel.getMetalMNo()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="metalDate" id="metalDate" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 12px;" value="<%=jewelleryMetalModel.getMetalDate()%>"></td>
<td>MODE</td>
<td><input type="text" name="metalMode" id="metalMode" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 12px;" value="<%=jewelleryMetalModel.getMetalMode()%>"></td>
<td>P-RATE</td>
<td><input type="text" name="metalPRate" id="metalPRate" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 12px;" value="<%=jewelleryMetalModel.getMetalPRate()%>"></td>
<td>S-RATE</td>
<td><input type="text" name="metalSRate" id="metalSRate" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 12px;" value="<%=jewelleryMetalModel.getMetalSRate()%>"></td>

</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>TYPE</td>
<td style="max-width:200px;min-width:200px; font-size: 20px;"  align="center">
<select class="textboxCss" style="max-width:200px; min-width:200px; font-size: 12px; text-align: center;" id="metalType" name="metalType">
 <option value="PURCHASE" <%if(jewelleryMetalModel.getMetalType().equalsIgnoreCase("PURCHASE")){%>selected<%}else{%><%} %>>PURCHASE</option> 
<option value="SALES" <%if(jewelleryMetalModel.getMetalType().equalsIgnoreCase("SALES")){%>selected<%}else{%><%} %>>SALES</option>
</select>
</td>
</tr>
<tr>
<td>NAME</td>
<td><input type="text" name="metalName" id="metalName" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryMetalModel.getMetalName()%>"></td>
</tr>
<tr>
<td>WEIGHT</td>
<td><input type="text" name="metalWeight" id="metalWeight" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryMetalModel.getMetalWeight()%>"></td>
</tr>
<tr>
<td>RESULT</td>
<td><input type="text" name="metalResult" id="metalResult" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryMetalModel.getMetalResult()%>"></td>
</tr>

<tr>
<td>PURE</td>
<td><input type="text" name="metalPure" id="metalPure" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryMetalModel.getMetalPure()%>"></td>
</tr>
<tr>
<td>AMOUNT</td>
<td><input type="text" name="metalAmount" id="metalAmount" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryMetalModel.getMetalAmount()%>"></td>
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
<table style="margin-left:auto; margin-right:auto; text-align: center;" class="resultTable" id="resultTable">
<thead >
<tr>
<th style="min-width: 50px; max-width: 50px;">NO</th>
<th style="min-width: 70px; max-width: 70px;">M NO</th>
<th style="min-width: 100px; max-width: 100px;">DATE</th> 
<th style="min-width: 130px; max-width: 130px;">TYPE</th>
<th style="min-width: 80px; max-width: 80px;">NAME </th>
<th style="min-width: 80px; max-width: 80px;">WEIGHT</th>
<th style="min-width: 80px; max-width: 80px;">RESULT</th>
<th style="min-width: 80px; max-width: 80px;">PURE</th>
<th style="min-width: 100px; max-width: 100px;">AMOUNT</th>
<th style="min-width: 100px; max-width: 100px;">P-RATE</th>
<th style="min-width: 100px; max-width: 100px;">S-RATE</th> 
<th style="min-width: 100px; max-width: 100px;">PRI</th>
<th style="min-width: 100px; max-width: 100px;">DELETE</th>
</tr>
<%	
{
HashMap<Integer, JewelleryMetalModel> jewelleryMetalModelMap = jewelleryMetalDB.getJewelleryMetalAllData(); 
 
Set entrySet = jewelleryMetalModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0;
while (iterator.hasNext()) {
	sno++;
	Map.Entry JewelleryMetalModelMapValue = (Map.Entry) iterator.next();
	jewelleryMetalModel = (JewelleryMetalModel) JewelleryMetalModelMapValue.getValue(); %>
	
	<TR>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><%=sno %></TD>
	<TD style="min-width: 70px; max-width: 70px;" align="center"><a href='JewelleryMetalPage.jsp?edit_metalMNo=<%=jewelleryMetalModel.getMetalMNo()%>'><%=jewelleryMetalModel.getMetalMNo()%></a></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center"><%=jewelleryMetalModel.getMetalDate()%></TD> 
	<TD style="min-width: 150px; max-width: 150px; overflow: hidden;" align="left"><%=jewelleryMetalModel.getMetalType()%></TD>
	<TD style="min-width: 100px; max-width: 100px;" align="center"><%=jewelleryMetalModel.getMetalName()%></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center" ><%=jewelleryMetalModel.getMetalWeight()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryMetalModel.getMetalResult()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryMetalModel.getMetalPure()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryMetalModel.getMetalAmount()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryMetalModel.getMetalPRate()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryMetalModel.getMetalSRate()%></TD>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryMetalPage.jsp?print_metalMNo=<%=jewelleryMetalModel.getMetalMNo()%>'>PRI</a></td>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryMetalPage.jsp?delete_metalMNo=<%=jewelleryMetalModel.getMetalMNo()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
	</TR>
	<%}} %>

<tbody>
</tbody>
</table>
<table style="margin-left:auto; margin-right:auto; text-align: center;" class="todayDate">
<thead >

<tbody>
</tbody>
</table>
</div>

<div class="pageFifthdiv"></div>
</div>
<%}}
       DBConnection.disconnect();
       
       %>
</form>
</body>
</html>

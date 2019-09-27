<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.ntj.db.JewelleryOrderDB"%> 
<%@page import="com.ntj.model.JewelleryOrderModel"%> 
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
<title>.: AKSHAYAA || ORDER :.</title> 
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script type="text/javascript">
$(function(){
	$('*[name=orderDate]').appendDtpicker({
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
<form name="JewelleryOrderPage"  method="Post" action="JewelleryOrderController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryOrderPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryOrderPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryOrderPage.jsp"> 
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
<a href="JewelleryOrderSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<%
{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
{
	JewelleryOrderModel jewelleryOrderModel=new JewelleryOrderModel();
	JewelleryOrderDB jewelleryOrderDB=new JewelleryOrderDB();
       {
           if(request.getParameter("edit_orderOno")!= null){
        	   jewelleryOrderModel.setOrderOno(request.getParameter("edit_orderOno").toString());
        	   jewelleryOrderModel=jewelleryOrderDB.getJewelleryOrderEditSearchPrint(jewelleryOrderModel);
           }else if(request.getParameter("delete_orderOno")!= null){
        	   jewelleryOrderModel.setOrderOno(request.getParameter("delete_orderOno").toString());
         	 if(jewelleryOrderDB.getJewelleryOrderONoDelete(jewelleryOrderModel)){
						response.sendRedirect("JewelleryOrderPage.jsp");
						return;
           } }
           else
       {
        	   jewelleryOrderModel=jewelleryOrderDB.getJewelleryOrderOno();
    	   
              }
       
%>

<div class="pageSecondPurchasediv">
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>O-NO</td>
<td><input type="text" name="orderOno" id="orderOno" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryOrderModel.getOrderOno()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="orderDate" id="orderDate" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryOrderModel.getOrderDate()%>"></td>
<td>MODE</td>
<td><input type="text" name="orderMode" id="orderMode" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryOrderModel.getOrderMode()%>"></td>
</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>PARTY NAME</td>
<td><input type="text" name="orderParty" id="orderParty" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryOrderModel.getOrderParty()%>"></td>
</tr>
<tr>
<td>TYPE</td>
<td><input type="text" name="orderType" id="orderType" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryOrderModel.getOrderType()%>"></td>
</tr>
<tr>
<td>WEIGHT</td>
<td><input type="text" name="orderWeight" id="orderWeight" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryOrderModel.getOrderWeight()%>"></td>
</tr>
<tr>
<td>ADVANCE METAL</td>
<td><input type="text" name="orderAMetal" id="orderAMetal" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryOrderModel.getOrderAMetal()%>"></td>
</tr>
<tr>
<td>ADVANCE AMT</td>
<td><input type="text" name="orderAAmount" id="orderAAmount" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryOrderModel.getOrderAAmount()%>"></td>
</tr>
<tr>
<td>WASTAGE</td>
<td><input type="text" name="orderWastage" id="orderWastage" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryOrderModel.getOrderWastage()%>"></td>
</tr>
<tr>
<td>IMAGE</td>
<td><input type="text" name="orderImage" id="orderImage" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryOrderModel.getOrderImage()%>"></td>
</tr>
<tr>
<td>MAKER</td>
<td><input type="text" name="orderMaker" id="orderMaker" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryOrderModel.getOrderMaker()%>"></td>
</tr>
<tr>
<td>COMMAND</td>
<td><input type="text" name="orderCommand" id="orderCommand" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryOrderModel.getOrderCommand()%>"></td>
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
<th style="min-width: 70px; max-width: 70px;">O-NO</th>
<th style="min-width: 100px; max-width: 100px;">DATE</th> 
<th style="min-width: 100px; max-width: 100px;">IMAGE</th> 
<th style="min-width: 130px; max-width: 130px;">PARTY</th>
<th style="min-width: 80px; max-width: 80px;">TYPE</th>
<th style="min-width: 80px; max-width: 80px;">WEIGHT</th>
<th style="min-width: 80px; max-width: 80px;">Adv METAL</th>
<th style="min-width: 80px; max-width: 80px;">Adv AMOUNT</th>
<th style="min-width: 80px; max-width: 80px;">WASTAGE</th>
<th style="min-width: 80px; max-width: 80px;">MAKER</th>
<th style="min-width: 80px; max-width: 80px;">COMMAND</th>
<th style="min-width: 100px; max-width: 100px;">DELETE</th>
</tr>
<%	
{
HashMap<Integer, JewelleryOrderModel> jewelleryOrderModelMap = jewelleryOrderDB.getJewelleryOrderAllData(); 

Set entrySet = jewelleryOrderModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0;
while (iterator.hasNext()) {
	sno++;
	Map.Entry jewelleryOrderModelMapValue = (Map.Entry) iterator.next();
	jewelleryOrderModel = (JewelleryOrderModel) jewelleryOrderModelMapValue.getValue(); %>
	
	<TR>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><%=sno %></TD>
	<TD style="min-width: 70px; max-width: 70px;" align="center"><a href='JewelleryOrderPage.jsp?edit_orderOno=<%=jewelleryOrderModel.getOrderOno()%>'><%=jewelleryOrderModel.getOrderOno()%></a></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center"><%=jewelleryOrderModel.getOrderDate()%></TD> 
	<TD style="min-width: 150px; max-width: 150px; overflow: hidden;" align="left"><%=jewelleryOrderModel.getOrderImage()%></TD>
	<TD style="min-width: 100px; max-width: 100px;" align="center"><%=jewelleryOrderModel.getOrderParty()%></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center" ><%=jewelleryOrderModel.getOrderType()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryOrderModel.getOrderWeight()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryOrderModel.getOrderAMetal()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryOrderModel.getOrderAAmount()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryOrderModel.getOrderWastage()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryOrderModel.getOrderMaker()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryOrderModel.getOrderCommand()%></TD>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryOrderPage.jsp?print_orderOno=<%=jewelleryOrderModel.getOrderOno()%>'>PRI</a></td>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryOrderPage.jsp?delete_orderOno=<%=jewelleryOrderModel.getOrderOno()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.ntj.db.JewelleryCreditDB"%> 
<%@page import="com.ntj.model.JewelleryCreditModel"%> 
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
<title>.: AKSHAYAA || CREDIT :.</title>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script type="text/javascript">
$(function(){
	$('*[name=creditDate]').appendDtpicker({
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
<form name="JewelleryCreditPage"  method="Post" action="JewelleryCreditController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryCreditPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryCreditPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryCreditPage.jsp"> 
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
<a href="JewelleryCreditSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<%
{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
{
	JewelleryCreditModel jewelleryCreditModel=new JewelleryCreditModel();
	JewelleryCreditDB jewelleryCreditDB=new JewelleryCreditDB();
       {
           if(request.getParameter("edit_creditCno")!= null){
        	   jewelleryCreditModel.setCreditCno(request.getParameter("edit_creditCno").toString());
        	   jewelleryCreditModel=jewelleryCreditDB.getJewelleryCreditEditSearchPrint(jewelleryCreditModel);
           }else if(request.getParameter("delete_creditCno")!= null){
        	   jewelleryCreditModel.setCreditCno(request.getParameter("delete_creditCno").toString());
         	 if(jewelleryCreditDB.getJewelleryCreditCNoDelete(jewelleryCreditModel)){
						response.sendRedirect("JewelleryCreditPage.jsp");
						return;
           } }
           else
       {
        	   jewelleryCreditModel=jewelleryCreditDB.getJewelleryCreditCno();
    	   
              }
       
%>

<div class="pageSecondPurchasediv">
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>CNO</td>
<td><input type="text" name="creditCno" id="creditCno" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryCreditModel.getCreditCno()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="creditDate" id="creditDate" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryCreditModel.getCreditDate()%>"></td>
<td>MODE</td>
<td><input type="text" name="creditMode" id="creditMode" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryCreditModel.getCreditMode()%>"></td>
</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>NAME</td>
<td><input type="text" name="creditName" id="creditName" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCreditModel.getCreditName()%>"></td>
</tr>
<tr>
<td>WEIGHT</td>
<td><input type="text" name="creditWeight" id="creditWeight" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCreditModel.getCreditWeight()%>"></td>
</tr>
<tr>
<td>AMOUNT</td>
<td><input type="text" name="creditAmount" id="creditAmount" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCreditModel.getCreditAmount()%>"></td>
</tr>
<tr>
<td>COMMAND</td>
<td><input type="text" name="creditCommand" id="creditCommand" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCreditModel.getCreditCommand()%>"></td>
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
<th style="min-width: 70px; max-width: 70px;">C NO</th>
<th style="min-width: 100px; max-width: 100px;">DATE</th> 
<th style="min-width: 130px; max-width: 130px;">NAME</th>
<th style="min-width: 80px; max-width: 80px;">WEIGHT</th>
<th style="min-width: 80px; max-width: 80px;">AMOUNT</th>
<th style="min-width: 80px; max-width: 80px;">COMMAND</th>
<th style="min-width: 100px; max-width: 100px;">PRINT</th> 
<th style="min-width: 100px; max-width: 100px;">DELETE</th>
</tr>
<%	
{
HashMap<Integer, JewelleryCreditModel> jewelleryCreditModelMap = jewelleryCreditDB.getJewelleryCreditAllData(); 

Set entrySet = jewelleryCreditModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0;
while (iterator.hasNext()) {
	sno++;
	Map.Entry jewelleryCreditModelMapValue = (Map.Entry) iterator.next();
	jewelleryCreditModel = (JewelleryCreditModel) jewelleryCreditModelMapValue.getValue(); %>
	
	<TR>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><%=sno %></TD>
	<TD style="min-width: 70px; max-width: 70px;" align="center"><a href='JewelleryCreditPage.jsp?edit_creditCno=<%=jewelleryCreditModel.getCreditCno()%>'><%=jewelleryCreditModel.getCreditCno()%></a></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center"><%=jewelleryCreditModel.getCreditDate()%></TD> 
	<TD style="min-width: 150px; max-width: 150px; overflow: hidden;" align="left"><%=jewelleryCreditModel.getCreditName()%></TD>
	<TD style="min-width: 100px; max-width: 100px;" align="center"><%=jewelleryCreditModel.getCreditWeight()%></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center" ><%=jewelleryCreditModel.getCreditAmount()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryCreditModel.getCreditCommand()%></TD>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryCreditPage.jsp?print_creditCno=<%=jewelleryCreditModel.getCreditCno()%>'>PRI</a></td>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryCreditPage.jsp?delete_creditCno=<%=jewelleryCreditModel.getCreditCno()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
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

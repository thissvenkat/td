<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ntj.db.JewelleryPartnersDB"%> 
<%@page import="com.ntj.model.JewelleryPartnersModel"%> 
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
<title>.: AKSHAYAA || PARTNERS :.</title>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script type="text/javascript">
$(function(){
	$('*[name=partnerDate]').appendDtpicker({
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
<form name="JewelleryPartnersPage"  method="Post" action="JewelleryPartnersController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryPartnersPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryPartnersPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryPartnersPage.jsp"> 
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
<a href="JewelleryPartnersSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<%
{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
{
	JewelleryPartnersModel jewelleryPartnersModel=new JewelleryPartnersModel();
	JewelleryPartnersDB jewelleryPartnersDB=new JewelleryPartnersDB();
       {
           if(request.getParameter("edit_partnerPNo")!= null){
        	   System.out.println("From page"+request.getParameter("edit_partnerPNo").toString());
        	   jewelleryPartnersModel.setPartnerPNo(request.getParameter("edit_partnerPNo").toString());
        	   jewelleryPartnersModel=jewelleryPartnersDB.getJewelleryPartnersEditSearchPrint(jewelleryPartnersModel);
           }else if(request.getParameter("delete_partnerPNo")!= null){
        	   jewelleryPartnersModel.setPartnerPNo(request.getParameter("delete_partnerPNo").toString());
         	 if(jewelleryPartnersDB.getJewelleryPartnerPNoDelete(jewelleryPartnersModel)){
						response.sendRedirect("JewelleryPartnersPage.jsp");
						return;
           } }
           else
       {
        	   jewelleryPartnersModel=jewelleryPartnersDB.getJewelleryPartnersPno();
    	   
              }
       
%>

<div class="pageSecondPurchasediv">
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>P-NO</td>
<td><input type="text" name="partnerPNo" id="partnerPNo" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerPNo()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="partnerDate" id="partnerDate" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerDate()%>"></td>
<td>MODE</td>
<td><input type="text" name="partnerMode" id="partnerMode" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerMode()%>"></td>
</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>NAME</td>
<td><input type="text" name="partnerName" id="partnerName" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryPartnersModel.getPartnerName()%>"></td>
</tr>
<tr>
<td>AMOUNT</td>
<td><input type="text" name="partnerAmount" id="partnerAmount" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryPartnersModel.getPartnerAmount()%>"></td>
</tr>
<tr>
<td>METAL</td>
<td><input type="text" name="partnerMetal" id="partnerMetal" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryPartnersModel.getPartnerMetal()%>"></td>
</tr>

<tr>
<td>SHARE VALUE</td>
<td><input type="text" name="partnerShareValue" id="partnerShareValue" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr>
<tr>
<td>SHARE %</td>
<td><input type="text" name="partnerSharePercent" id="partnerSharePercent" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryPartnersModel.getPartnerSharePercent()%>"></td>
</tr>
<tr>
<td>DESIGINATION</td>
<td><input type="text" name="partnerDesigination" id="partnerDesigination" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryPartnersModel.getPartnerDesigination()%>"></td>
</tr>
<tr>
<td>COMMAND</td>
<td><input type="text" name="partnerCommand" id="partnerCommand" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryPartnersModel.getPartnerCommand()%>"></td>
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
<th style="min-width: 70px; max-width: 70px;">P NO</th>
<th style="min-width: 100px; max-width: 100px;">DATE</th> 
<th style="min-width: 130px; max-width: 130px;">NAME</th>
<th style="min-width: 80px; max-width: 80px;">AMOUNT </th>
<th style="min-width: 80px; max-width: 80px;">METAL</th>
<th style="min-width: 80px; max-width: 80px;">SHARE VALUE</th>
<th style="min-width: 80px; max-width: 80px;">SHARE %</th>
<th style="min-width: 100px; max-width: 100px;">DESIGINATION</th>
<th style="min-width: 100px; max-width: 100px;">COMMAND</th>
<th style="min-width: 100px; max-width: 100px;">PRI</th> 
<th style="min-width: 100px; max-width: 100px;">DELETE</th>
</tr>
<%	
{
HashMap<Integer, JewelleryPartnersModel> jewelleryPartnersModelMap = jewelleryPartnersDB.getJewelleryPartnersAllData(); 

Set entrySet = jewelleryPartnersModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0;
while (iterator.hasNext()) {
	sno++;
	Map.Entry JewelleryPartnersModelMapValue = (Map.Entry) iterator.next();
	jewelleryPartnersModel = (JewelleryPartnersModel) JewelleryPartnersModelMapValue.getValue(); %>
	
	<TR>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><%=sno %></TD>
	<TD style="min-width: 70px; max-width: 70px;" align="center"><a href='JewelleryPartnersPage.jsp?edit_partnerPNo=<%=jewelleryPartnersModel.getPartnerPNo()%>'><%=jewelleryPartnersModel.getPartnerPNo()%></a></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center"><%=jewelleryPartnersModel.getPartnerDate()%></TD> 
	<TD style="min-width: 150px; max-width: 150px; overflow: hidden;" align="left"><%=jewelleryPartnersModel.getPartnerName()%></TD>
	<TD style="min-width: 100px; max-width: 100px;" align="center"><%=jewelleryPartnersModel.getPartnerAmount()%></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center" ><%=jewelleryPartnersModel.getPartnerMetal()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryPartnersModel.getPartnerShareValue()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryPartnersModel.getPartnerSharePercent()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryPartnersModel.getPartnerDesigination()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryPartnersModel.getPartnerCommand()%></TD>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryPartnersPage.jsp?print_partnerPNo=<%=jewelleryPartnersModel.getPartnerPNo()%>'>PRI</a></td>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryPartnersPage.jsp?delete_partnerPNo=<%=jewelleryPartnersModel.getPartnerPNo()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
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

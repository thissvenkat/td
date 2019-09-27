<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ntj.db.JewelleryCustomerDB"%> 
<%@page import="com.ntj.model.JewelleryCustomerModel"%> 
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
<title>.: AKSHAYAA || CUSTOMER :.</title>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script type="text/javascript">
$(function(){
	$('*[name=customerDate]').appendDtpicker({ 
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
<script type="text/javascript">
$(document).ready(function () {
    var d = new Date(),
        date = (d.getFullYear()+'-'+(d.getMonth()+1) + '-' + (d.getDate()) + ' '+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds() );
    $('#custDate').val(date);       
});
</script>

</head>
<body>
<form name="JewelleryCustomerPage"  method="Post" action="JewelleryCustomerController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryCustomerPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryCustomerPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryCustomerPage.jsp"> 
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
<a href="JewelleryCustomerSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<%

{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
{
	
	JewelleryCustomerModel jewelleryCustomerModel=new JewelleryCustomerModel();
	JewelleryCustomerDB jewelleryCustomerDB=new JewelleryCustomerDB();
       {
           if(request.getParameter("edit_custCNo")!= null){
        	   jewelleryCustomerModel.setCustCNo(request.getParameter("edit_custCNo").toString());
        	   jewelleryCustomerModel=jewelleryCustomerDB.getJewelleryCustomerEditSearchPrint(jewelleryCustomerModel);
           }else if(request.getParameter("delete_custCNo")!= null){
        	   jewelleryCustomerModel.setCustCNo(request.getParameter("delete_custCNo").toString());
         	 if(jewelleryCustomerDB.getJewelleryCustCNoDelete(jewelleryCustomerModel)){
         		 response.sendRedirect("JewelleryCustomerPage.jsp");
						return;
           } }
           else
       {
        	   jewelleryCustomerModel=jewelleryCustomerDB.getJewelleryCustomerCno();
    	   
              }
        
%>

<div class="pageSecondPurchasediv">
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>C-NO</td>
<td><input type="text" name="custCNo" id="custCNo" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryCustomerModel.getCustCNo()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="custDate" id="custDate" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryCustomerModel.getCustDate()%>"></td>
<td>MODE</td>
<td><input type="text" name="custMode" id="custMode" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryCustomerModel.getCustMode()%>"></td>
</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>C.NAME/JEWELLERY NAME</td>
<td><input type="text" name="custName" id="custName" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustName()%>"></td>
</tr>
<tr>
<td>MBL NO</td>
<td><input type="text" name="custMobile" id="custMobile" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustMobile()%>"></td>
</tr>
<tr>
<td>ADDRESS1</td>
<td><input type="text" name="custAddress1" id="custAddress1" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustAddress1()%>"></td>
</tr>
<tr>
<td>ADDRESS2</td>
<td><input type="text" name="custAddress2" id="custAddress2" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustAddress2()%>"></td>
</tr>
<tr>
<td>CITY</td>
<td><input type="text" name="custCity" id="custCity" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustCity()%>"></td>
</tr>
<tr>
<td>STATE</td>
<td><input type="text" name="custState" id="custState" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustState()%>"></td>
</tr>
<tr>
<td>GST NO</td>
<td><input type="text" name="custGSTNo" id="custGSTNo" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustGSTNo()%>"></td>
</tr>
<tr>
<td>PAN NO</td>
<td><input type="text" name="custPANNo" id="custPANNo" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustPANNo()%>"></td>
</tr>
<tr>
<td>COMMAND</td>
<td><input type="text" name="custCommand" id="custCommand" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustCommand()%>"></td>
</tr>
<tr>
<td>OLD-MBAL</td>
<td><input type="text" name="custOldMbal" id="custOldMbal" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustOldMbal()%>"></td>
</tr>
<tr>
<td>OLD-CBAL</td>
<td><input type="text" name="custOldCbal" id="custOldCbal" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustOldCbal()%>"></td>
</tr>

<tr>
<td>MBAL</td>
<td><input type="text" name="custMbal" id="custMbal" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustMbal()%>"></td>
</tr>
<tr>
<td>CBAL</td>
<td><input type="text" name="custCbal" id="custCbal" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryCustomerModel.getCustCbal()%>"></td>
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
<th style="min-width: 130px; max-width: 130px;">NAME</th>
<th style="min-width: 80px; max-width: 80px;">MBL</th>
<th style="min-width: 80px; max-width: 80px;">ADDRESS1</th>
<th style="min-width: 80px; max-width: 80px;">ADDRESS2</th>
<th style="min-width: 80px; max-width: 80px;">CITY</th>
<th style="min-width: 100px; max-width: 100px;">STATE</th>
<th style="min-width: 100px; max-width: 100px;">GSTNO</th>
<th style="min-width: 100px; max-width: 100px;">PAN</th> 
<th style="min-width: 100px; max-width: 100px;">COMMAND</th>
<th style="min-width: 100px; max-width: 100px;">M-BAL</th>
<th style="min-width: 100px; max-width: 100px;">C-BAL</th>
<th style="min-width: 100px; max-width: 100px;">OLD-MBAL</th>
<th style="min-width: 100px; max-width: 100px;">OLD-CBAL</th>
<th style="min-width: 100px; max-width: 100px;">DEL</th>
</tr>
<%	
{
HashMap<Integer, JewelleryCustomerModel> jewelleryCustomerModelMap = jewelleryCustomerDB.getJewelleryCustAllData(); 

Set entrySet = jewelleryCustomerModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0;
while (iterator.hasNext()) {
	sno++;
	Map.Entry JewelleryCustomerModelMapValue = (Map.Entry) iterator.next();
	jewelleryCustomerModel = (JewelleryCustomerModel) JewelleryCustomerModelMapValue.getValue(); %>
	
	<TR>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><%=sno %></TD>
	<TD style="min-width: 70px; max-width: 70px;" align="center"><a href='JewelleryCustomerPage.jsp?edit_custCNo=<%=jewelleryCustomerModel.getCustCNo()%>'><%=jewelleryCustomerModel.getCustCNo()%></a></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center"><%=jewelleryCustomerModel.getCustName()%></TD> 
	<TD style="min-width: 150px; max-width: 150px; overflow: hidden;" align="left"><%=jewelleryCustomerModel.getCustMobile()%></TD>
	<TD style="min-width: 100px; max-width: 100px;" align="center"><%=jewelleryCustomerModel.getCustAddress1()%></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center" ><%=jewelleryCustomerModel.getCustAddress2()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryCustomerModel.getCustCity()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryCustomerModel.getCustState()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryCustomerModel.getCustGSTNo()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryCustomerModel.getCustPANNo()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryCustomerModel.getCustMbal()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryCustomerModel.getCustCbal()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryCustomerModel.getCustOldMbal()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryCustomerModel.getCustOldCbal()%></TD>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryCustomerPage.jsp?delete_custCNo=<%=jewelleryCustomerModel.getCustCNo()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
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

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
<title>.: NTJ || Customer Invoice :.</title>
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
<form name="JewelleryInvoiceCustomerPage"  method="Post" action="JewelleryInvoiceCustomerController">
<div class="pageContentdiv">  
<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryInvoiceCustomerPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryInvoiceCustomerPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryInvoiceCustomerPage.jsp"> 
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
<a href="JewelleryInvoiceCustomerSearchPage.jsp"> 
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

<div class="pageSecondInvoicediv">
<table style="margin-left: AUTO; margin-right: auto; margin-top: 10PX;">
<tr>
<td>CB-NO</td>
<td><input type="text" name="invoiceCBillNo" id="invoiceCBillNo" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 10px;" value="<%=jewelleryPartnersModel.getPartnerPNo()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="invoiceCDate" id="invoiceCDate" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 10px;" value="<%=jewelleryPartnersModel.getPartnerDate()%>"></td>
<td>HSN</td>
<td><input type="text" name="invoiceCHSNCode" id="invoiceCHSNCode" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 10px;" value="<%=jewelleryPartnersModel.getPartnerMode()%>"></td>
<td>MODE</td>
<td><input type="text" name="invoiceCMode" id="invoiceCMode" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 10px;" value="<%=jewelleryPartnersModel.getPartnerMode()%>"></td>
</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>Customer Name</td>
<td><input type="text" name="invoiceCName" id="partnerName" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 15px;" value="<%=jewelleryPartnersModel.getPartnerName()%>" autofocus></td>
<td>MOBILE</td>
<td><input type="text" name="invoiceCMobile" id="invoiceCMobile" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 15px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr>
<tr>
<td>ADDRESS</td>
<td><input type="text" name="invoiceCAddress1" id="partnerAmount" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 15px;" value="<%=jewelleryPartnersModel.getPartnerAmount()%>"></td>
<TD><input type="text" name="invoiceCAddress2" id="partnerMetal" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 15px;" value="<%=jewelleryPartnersModel.getPartnerMetal()%>"></td>
<td><input type="text" name="invoiceCAddress3" id="partnerShareValue" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 15px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr>
<tr>
<td>GST NO</td>
<td><input type="text" name="invoiceCGST" id="partnerShareValue" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 15px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr>
</tbody>
</table>

<table style="margin-left: auto; margin-right: auto;">
<tr style="font-size: 12px;">
<th>S.NO</th>
<th>NAME</th>
<th>WEIGHT</th>
<th>LESS</th>
<th>GWEIGHT</th>
<th>WASTAGE</th>
<th>NET.WEI</th>
<th>RATE</th>
<th>AMOUNT</th>
</tr>
<tbody>
<tr>
<td><input type="text" name="invoiceCSNo1" id="partnerShareValue" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCParticular1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCLess1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCGWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWastage1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCNWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCRate1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCAmount1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr>
<tr>
<td><input type="text" name="invoiceCSNo1" id="partnerShareValue" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCParticular1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCLess1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCGWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWastage1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCNWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCRate1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCAmount1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr><tr>
<td><input type="text" name="invoiceCSNo1" id="partnerShareValue" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCParticular1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCLess1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCGWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWastage1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCNWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCRate1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCAmount1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr><tr>
<td><input type="text" name="invoiceCSNo1" id="partnerShareValue" class="textboxCss" style="max-width:50px;min-width:50px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCParticular1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCLess1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCGWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWastage1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCNWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCRate1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCAmount1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr>
</tbody>
</table>
<table style="margin-left: auto; margin-right: auto;">
<tbody>
<tr>
<td colspan="2">HM CHARGES</td>
<td><input type="text" name="invoiceCAmount1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr>
<tr>
<td colspan="2">&nbsp;PAY MODE</td>
<td style="width: 15px;" colspan="2"><input type="text" name="invoiceCAmount1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr>
<tr style="font-size: 12px;">
<td style="width: 120px;">TOT WEIGHT</td>
<td style="width: 120px;">TOT LESS</td>
<td style="width: 120px;">NET WEIGHT</td>
<td style="width: 120px;">SUB TOTAL</td>
<td style="width: 103px;">&nbsp;SGST</td>
<td style="width: 104px;">&nbsp;CGST</td>
<td style="width: 15px;">&nbsp;RoundOff</td>
<td style="width: 15px;">&nbsp;Total</td>
</tr>
<tr>
<td><input type="text" name="invoiceCGWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWastage1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCGWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCGWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCWastage1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCNWeight1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCRate1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
<td><input type="text" name="invoiceCAmount1" id="partnerShareValue" class="textboxCss" style="max-width:100px;min-width:100px; font-size: 12px;" value="<%=jewelleryPartnersModel.getPartnerShareValue()%>"></td>
</tr>
<tr>
<td colspan="8">
<input type="submit" name="submit" value="SAVE" id="" class="buttonCss">
</td>
</tr>
</tbody>
</table>
<!-- DivTable.com -->
<!-- DivTable.com -->
</div> 
<div class="pageThirdInvoicediv">
<BR>
<table style="margin-left:auto; margin-right:auto; text-align: center; font-size: 10PX;" class="resultTable" id="resultTable">
<thead >
<tr>
<th style="min-width: 50px; max-width: 50px;">SNO</th>
<th style="min-width: 70px; max-width: 70px;">INO</th>
<th style="min-width: 100px; max-width: 100px;">TYPE</th> 
<th style="min-width: 130px; max-width: 130px;">QTY</th>
<th style="min-width: 80px; max-width: 80px;">WEI </th>
<th style="min-width: 80px; max-width: 80px;">WASTAGE</th>
<th style="min-width: 80px; max-width: 80px;">F.WEI</th>
<th style="min-width: 80px; max-width: 80px;">AMT</th>
<th style="min-width: 100px; max-width: 100px;">DEL</th>
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

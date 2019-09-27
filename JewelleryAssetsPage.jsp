<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.ntj.db.JewelleryAssetsDB"%> 
<%@page import="com.ntj.model.JewelleryAssetsModel"%> 
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
<title>.: AKSHAYAA || ASSETS :.</title>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script type="text/javascript"> 
$(function(){
	$('*[name=assetDate]').appendDtpicker({
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
<form name="JewelleryAssetsPage"  method="Post" action="JewelleryAssetsController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryAssetsPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryAssetsPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryAssetsPage.jsp"> 
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
<a href="JewelleryAssetsSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<%
{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}

{
	JewelleryAssetsModel jewelleryAssetsModel=new JewelleryAssetsModel();
	JewelleryAssetsDB jewelleryAssetsDB=new JewelleryAssetsDB();
       {
           if(request.getParameter("edit_assetAno")!= null){
        	   jewelleryAssetsModel.setAssetAno(request.getParameter("edit_assetAno").toString());
        	   jewelleryAssetsModel=jewelleryAssetsDB.getJewelleryAssetEditSearchPrint(jewelleryAssetsModel);
           }else if(request.getParameter("delete_assetAno")!= null){
        	   jewelleryAssetsModel.setAssetAno(request.getParameter("delete_assetAno").toString());
         	 if(jewelleryAssetsDB.getJewelleryAssetANoDelete(jewelleryAssetsModel)){
						response.sendRedirect("JewelleryAssetsPage.jsp");
						return;
           } }
           else
       {
        	   jewelleryAssetsModel=jewelleryAssetsDB.getJewelleryAssetAno();
    	   
              }
       
%>

<div class="pageSecondPurchasediv">
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>ANO</td>
<td><input type="text" name="assetAno" id="assetAno" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryAssetsModel.getAssetAno()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="assetDate" id="assetDate" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryAssetsModel.getAssetDate()%>"></td>
<td>MODE</td>
<td><input type="text" name="assetMode" id="assetMode" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryAssetsModel.getAssetMode()%>"></td>
</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>NAME</td>
<td><input type="text" name="assetName" id="assetName" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryAssetsModel.getAssetName()%>"></td>
</tr>
<tr>
<td>PRICE</td>
<td><input type="text" name="assetPrice" id="assetPrice" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryAssetsModel.getAssetPrice()%>"></td>
</tr>
<tr>
<td>COMPANY</td>
<td><input type="text" name="assetCompany" id="assetCompany" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryAssetsModel.getAssetCompany()%>"></td>
</tr>

<tr>
<td>PURCHASE BY</td>
<td><input type="text" name="assetPurchaseBy" id="assetPurchaseBy" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryAssetsModel.getAssetPurchaseBy()%>"></td>
</tr>
<tr>
<td>COMMAND</td>
<td><input type="text" name="assetCommand" id="assetCommand" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryAssetsModel.getAssetCommand()%>"></td>
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
<th style="min-width: 70px; max-width: 70px;">I NO</th>
<th style="min-width: 100px; max-width: 100px;">DATE</th> 
<th style="min-width: 130px; max-width: 130px;">NAME</th>
<th style="min-width: 80px; max-width: 80px;">PRICE </th>
<th style="min-width: 80px; max-width: 80px;">COMPANY</th>
<th style="min-width: 80px; max-width: 80px;">PURCHASED BY</th>
<th style="min-width: 80px; max-width: 80px;">COMMAND</th>
<th style="min-width: 100px; max-width: 100px;">PRINT</th> 
<th style="min-width: 100px; max-width: 100px;">DELETE</th>
</tr>
<%	
{
HashMap<Integer, JewelleryAssetsModel> jewelleryAssetsModelMap = jewelleryAssetsDB.getJewelleryAssetAllData(); 

Set entrySet = jewelleryAssetsModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0;
while (iterator.hasNext()) {
	sno++;
	Map.Entry jewelleryAssetsModelMapValue = (Map.Entry) iterator.next();
	jewelleryAssetsModel = (JewelleryAssetsModel) jewelleryAssetsModelMapValue.getValue(); %>
	
	<TR>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><%=sno %></TD>
	<TD style="min-width: 70px; max-width: 70px;" align="center"><a href='JewelleryAssetsPage.jsp?edit_assetAno=<%=jewelleryAssetsModel.getAssetAno()%>'><%=jewelleryAssetsModel.getAssetAno()%></a></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center"><%=jewelleryAssetsModel.getAssetDate()%></TD> 
	<TD style="min-width: 150px; max-width: 150px; overflow: hidden;" align="left"><%=jewelleryAssetsModel.getAssetName()%></TD>
	<TD style="min-width: 100px; max-width: 100px;" align="center"><%=jewelleryAssetsModel.getAssetPrice()%></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center" ><%=jewelleryAssetsModel.getAssetCompany()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryAssetsModel.getAssetPurchaseBy()%></TD>
	
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryAssetsModel.getAssetCommand()%></TD>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryAssetsPage.jsp?print_assetAno=<%=jewelleryAssetsModel.getAssetAno()%>'>PRI</a></td>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryAssetsPage.jsp?delete_assetAno=<%=jewelleryAssetsModel.getAssetAno()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
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

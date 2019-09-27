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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script>
$(function(){
	$('*[name=salesItemSearchDateFrom],*[name=salesItemSearchDateTo]').appendDtpicker({
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

<title>.:Sales Search Page :.</title> 
</head>
<%
{
JewellerySalesItemModel jewellerySalesItemModel=new JewellerySalesItemModel();
JewellerySalesItemDB jewellerySalesItemDB=new JewellerySalesItemDB();
if(request.getParameter("salesItemSearchDateFrom")!= null){
	jewellerySalesItemModel.setSalesItemSearchDateFrom((request.getParameter("salesItemSearchDateFrom").toString()));
	jewellerySalesItemModel.setSalesItemSearchDateTo((request.getParameter("salesItemSearchDateTo").toString()));
	jewellerySalesItemModel.setSalesItemSearchBillNo((request.getParameter("salesItemSearchBillNo").toString()));
	jewellerySalesItemModel.setSalesItemSearchCustNo((request.getParameter("salesItemSearchCustNo").toString()));
	jewellerySalesItemModel.setSalesItemSearchCustName((request.getParameter("salesItemSearchCustName").toString()));
}
%>

<body>
<form name="JewellerySalesItemSearchPage"  method="post" action="JewellerySalesItemSearchPage.jsp">
<div class="pageContentdiv">  
<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewellerySalesItemSearchPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewellerySalesItemSearchPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewellerySalesItemSearchPage.jsp"> 
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
<a href="JewellerySalesItemPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<div class="pageSecondSalesItemSearchdiv">
<div class="pageSecondSalesItemSearchHeaddiv" align="center">
<table style="margin-top: 40px;">
<tr>
<td>FROM</td>
<td><input type="text" name="salesItemSearchDateFrom" id="salesItemSearchDateFrom" class="textboxCss" style="max-width:150px;min-width:150px; " ></td>
<td>TO</td>
<td><input type="text" name="salesItemSearchDateTo" id="salesItemSearchDateTo" class="textboxCss" style="max-width:150px;min-width:150px;" ></td>
<td>BILL NO</td>
<td><input type="text" name="salesItemSearchBillNo" id="salesItemSearchBillNo" class="textboxCss" style="max-width:150px;min-width:150px;" ></td>
<td>CUST NO</td>
<td><input type="text" name="salesItemSearchCustNo" id="salesItemSearchCustNo" class="textboxCss" style="max-width:150px;min-width:150px;" ></td>
<td>NAME</td>
<td><input type="text" name="salesItemSearchCustName" id="salesItemSearchCustName" class="textboxCss" style="max-width:150px;min-width:150px;" ></td>
</tr>

<tr>
<td colspan="10" align="center"><input  type="submit" value="SEARCH" class="buttonCss" style="max-width:150px;min-width:150px; font-size: 20px;" ></td>
</tr>
</table></div>
<div class="pageSecondSalesItemSearchFirstdiv">
<div class="not-found" style="display: none;">No Result Found</div><BR>
<p style="text-align: center; color: green;">SALES BILLS</p>
<table style="margin-left:auto; margin-right:auto; text-align: center; font-size: 12px;" class="resultTable">
<thead >
<tr>
<th style="min-width: 20px; max-width: 20px;" data-tsort-type="number">SNO</th>
<th style="min-width: 40px; max-width: 40px;" data-tsort-type="number">BNO</th>
<th style="min-width: 40px; max-width: 40px;">CNO</th>
<th style="min-width: 50px; max-width: 50px; font-size: 09px;" data-tsort-type="date">DATE</th>
<th style="min-width: 80px; max-width: 70px; text-align: left;">NAME</th>
<th style="min-width: 50px; max-width: 50px;">MBL</th>
<th style="min-width: 60px; max-width: 60px;">I-W</th>
<th style="min-width: 50px; max-width: 50px;">S-P</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">R-P</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">CH-P</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">O-MOB</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">O-COB</th> 
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">N-MOB</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">N-COB</th> 
<th style="min-width: 40px; max-width: 40px;" data-tsort="disabled" data-tfilter="disabled">PRI</th> 
<th style="min-width: 40px; max-width: 40px;" data-tsort="disabled" data-tfilter="disabled">DEL</th>
</tr></thead>
<tbody id="resultTable">	

<%	
{
HashMap<Integer, JewellerySalesItemModel> jewellerySalesBillModelMap = jewellerySalesItemDB.getJewellerySalesBillAllData(jewellerySalesItemModel);
JewellerySalesItemModel jewellerySalesItemModel1=new JewellerySalesItemModel();
Set entrySet = jewellerySalesBillModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0; 
while (iterator.hasNext()) {
	sno++; 
	Map.Entry jewellerySalesBillModelMapValue = (Map.Entry) iterator.next();
	jewellerySalesItemModel1 = (JewellerySalesItemModel) jewellerySalesBillModelMapValue.getValue();%>
<tr>
	<TD style="min-width: 20px; max-width: 20px;" align="center"><%=sno %></TD>
	<TD style="min-width: 40px; max-width: 40px;" align="center"><a href='JewellerySalesItemPage.jsp?edit_salesItemBNo=<%=jewellerySalesItemModel1.getSalesItemBNo()%>'><%=jewellerySalesItemModel1.getSalesItemBNo()%></a></TD>
	<TD style="min-width: 40px; max-width: 40px;"><%=jewellerySalesItemModel1.getSalesItemCNo()%></TD>
	<TD style="min-width: 50px; max-width: 50px; font-size: 09px;"><%=jewellerySalesItemModel1.getSalesItemBDate()%></TD>
	<TD style="min-width: 80px; max-width: 80px; overflow: hidden; white-space: nowrap; text-align: left;"><%=jewellerySalesItemModel1.getSalesItemCname()%></TD>
	<TD style="min-width: 50px; max-width: 50px; text-align: left;"><%=jewellerySalesItemModel1.getSalesItemCmobile()%></TD>
	<TD style="min-width: 50px; max-width: 50px;"><%=jewellerySalesItemModel1.getSalesItemSNetWeightTot()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemSNetWeight"><%=jewellerySalesItemModel1.getSalesItemSPureTot()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemRNetWeight"><%=jewellerySalesItemModel1.getSalesItemRPureTot()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemCHNetWeight"><%=jewellerySalesItemModel1.getSalesItemCHPure()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemOMNetWeight"><%=jewellerySalesItemModel1.getSalesItemOldMbal()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemOCNetWeight"><%=jewellerySalesItemModel1.getSalesItemOldCbal()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemNMNetWeight"><%=jewellerySalesItemModel1.getSalesItemMbal()%></TD>
	<TD style="min-width: 50px; max-width: 50px;" id="tableSalesItemNCNetWeight"><%=jewellerySalesItemModel1.getSalesItemCbal()%></TD>
	<TD style="min-width: 40px; max-width: 40px;" align="center"><a href='JewellerySalesItemPrintPage.jsp?print_salesItemBNo=<%=jewellerySalesItemModel1.getSalesItemBNo()%>'>PRI</a></TD>
	<TD style="min-width: 40px; max-width: 40px;" align="center"><a href='JewellerySalesItemPrintPage.jsp?delete_salesItemBNo=<%=jewellerySalesItemModel1.getSalesItemBNo()%>'>DEL</a></TD>
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
<div class="pageSecondSalesItemSearchSeconddiv">

<div class="not-found" style="display: none;">No Result Found</div><BR>
<p style="text-align: center; color: green;">SALES ITEM</p>
<table style="margin-left:auto; margin-right:auto; text-align: center; font-size: 12px;" class="resultTable"> 
<thead>  
<tr> 
<th style="min-width: 40px; max-width: 40px;" data-tsort-type="number">SNO</th>
<th style="min-width: 40px; max-width: 40px;">INO</th>
<th style="min-width: 40px; max-width: 40px;" data-tsort-type="number">BNO</th>
<th style="min-width: 40px; max-width: 40px;" data-tsort-type="number">CNO</th>
<th style="min-width: 80px; max-width: 80px; font-size: 09px;" data-tsort-type="date">DATE</th>
<th style="min-width: 100px; max-width: 100px;" data-tsort-type="number">NAME</th>
<th style="min-width: 80px; max-width: 80px; text-align: left;">TYPE</th>
<th style="min-width: 50px; max-width: 50px;">COUNT</th>
<th style="min-width: 60px; max-width: 60px;">WEI</th>
<th style="min-width: 50px; max-width: 50px;">-</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">NET WEI</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">-%-</th>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">PURE</th>
<th style="min-width: 40px; max-width: 40px;" data-tsort="disabled" data-tfilter="disabled">PRI</th> 
<th style="min-width: 40px; max-width: 40px;" data-tsort="disabled" data-tfilter="disabled">DEL</th>
</tr></thead>
<tbody id="resultTable">	
<%
{
HashMap<Integer, JewellerySalesItemModel> jewellerySalesItemModelMap = jewellerySalesItemDB.getSalesItemEditSearchPrintAllData(jewellerySalesItemModel);

Set entrySet = jewellerySalesItemModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0; 
while (iterator.hasNext()) {
	sno++; 
	Map.Entry jewellerySalesItemModelMapValues = (Map.Entry) iterator.next();
	jewellerySalesItemModel = (JewellerySalesItemModel) jewellerySalesItemModelMapValues.getValue();
	
%>
<tr> 
	<TD style="min-width: 40px; max-width: 40px;" align="center"><%=sno %></TD>
	<TD style="min-width: 40px; max-width: 40px;" align="center"><%=jewellerySalesItemModel.getSalesItemSSNo()%></TD>
	<TD style="min-width: 40px; max-width: 40px;" align="center"><%=jewellerySalesItemModel.getSalesItemBNo()%></TD>
	<TD style="min-width: 40px; max-width: 40px;" align="center"><%=jewellerySalesItemModel.getSalesItemCNo()%></TD>
	<TD style="min-width: 80px; max-width: 80px;"><%=jewellerySalesItemModel.getSalesItemSTime()%></TD>
	<TD style="min-width: 100px; max-width: 100px;"><%=jewellerySalesItemModel.getSalesItemCname()%></TD>
	<TD style="min-width: 80px; max-width: 80px; text-align: left;"><%=jewellerySalesItemModel.getSalesItemSType()%></TD>
	<TD style="min-width: 50px; max-width: 50px;"><%=jewellerySalesItemModel.getSalesItemSCount()%></TD> 
	<TD style="min-width: 60px; max-width: 60px;"><%=jewellerySalesItemModel.getSalesItemSWeight()%></TD>
	<TD style="min-width: 50px; max-width: 50px;"><%=jewellerySalesItemModel.getSalesItemSMinus()%></TD>
	<TD style="min-width: 50px; max-width: 50px;"><%=jewellerySalesItemModel.getSalesItemSNetWeight()%></TD>
	<TD style="min-width: 50px; max-width: 50px;"><%=jewellerySalesItemModel.getSalesItemSWastage()%></TD>
	<TD style="min-width: 50px; max-width: 50px;"><%=jewellerySalesItemModel.getSalesItemSPure()%></TD>
	<TD style="min-width: 40px; max-width: 40px;" align="center"><a href='JewellerySalesItemPrintPage.jsp?print_salesItemBNo=<%=jewellerySalesItemModel.getSalesItemBNo()%>'>PRI</a></TD>
	
	
</tr>
<%}}%> 
</tbody></table>
</div> 
</div>
<%
DBConnection.disconnect();
}%>
</div>
<div class="pageFifthdiv">
<div class="pageSecondSalesItemSearchThirddiv">
C</div>
<div class="pageSecondSalesItemSearchFourthdiv">
D</div>
</div>

</form>
</body>
</html>

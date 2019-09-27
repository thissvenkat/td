<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ntj.db.JewelleryItemDB"%> 
<%@page import="com.ntj.model.JewelleryItemModel"%> 
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
<title>.: AKSHAYAA || ITEM TYPES :.</title>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script src="assets/js/tablefilter.js"> </script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 
<script type="text/javascript">
$(function(){
	$('*[name=itemDate]').appendDtpicker({
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
</script>
</head>
<body>
<form name="JewelleryItemPage"  method="Post" action="JewelleryItemController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryItemPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryItemPage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryItemPage.jsp"> 
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
<a href="JewelleryItemSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div>
</div>
<%

{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
{
	JewelleryItemModel jewelleryItemModel=new JewelleryItemModel();
	JewelleryItemDB jewelleryItemDB=new JewelleryItemDB();
       {
           if(request.getParameter("edit_itemIno")!= null){
        	   jewelleryItemModel.setItemIno(request.getParameter("edit_itemIno").toString());
        	   jewelleryItemModel=jewelleryItemDB.getJewelleryItemEditSearchPrint(jewelleryItemModel);
           }else if(request.getParameter("delete_itemIno")!= null){
        	   jewelleryItemModel.setItemIno(request.getParameter("delete_itemIno").toString());
         	 if(jewelleryItemDB.getJewelleryItemINoDelete(jewelleryItemModel)){
						response.sendRedirect("JewelleryItemPage.jsp");
						return;
           } }
           else
       {
        	   jewelleryItemModel=jewelleryItemDB.getJewelleryItemIno();
    	   
              }
       
%>

<div class="pageSecondPurchasediv">
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>CNO</td>
<td><input type="text" name="itemIno" id="itemIno" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryItemModel.getItemIno()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="itemDate" id="itemDate" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryItemModel.getItemDate()%>"></td>
<td>MODE</td>
<td><input type="text" name="itemMode" id="itemMode" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryItemModel.getItemMode()%>"></td>
</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>TYPE</td>
<td><input type="text" name="itemType" id="itemType" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryItemModel.getItemType()%>"></td>
</tr>
<tr>
<td>PURCHASE %</td>
<td><input type="text" name="itemPurchase" id="itemPurchase" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryItemModel.getItemPurchase()%>"></td>
</tr>
<tr>
<td>SELLING %</td>
<td><input type="text" name="itemSelling" id="itemSelling" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryItemModel.getItemSelling()%>"></td>
</tr>
<tr>
<td>P.STONE %</td>
<td><input type="text" name="itemPStone" id="itemPStone" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryItemModel.getItemPStone()%>"></td>
</tr>
<tr>
<td>S.STONE %</td>
<td><input type="text" name="itemSStone" id="itemSStone" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryItemModel.getItemSStone()%>"></td>
</tr>
<tr>
<td>COMMAND</td>
<td><input type="text" name="itemCommand" id="itemCommand" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryItemModel.getItemCommand()%>"></td>
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
SEARCH &nbsp<input type="search" class="textBoxSearch" placeholder="Filter" style="min-width: 300px; max-width: 300px;">
</div>  
<BR>
<div class="not-found" style="display: none;">No Result Found</div>
<table style="margin-left:auto; margin-right:auto; text-align: center;" class="resultTable" id="resultTable">
<thead>
<tr>
<th style="min-width: 50px; max-width: 50px;" data-tsort-type="number">NO</th>
<th style="min-width: 50px; max-width: 50px;">I NO</th>
<th style="min-width: 100px; max-width: 100px;" data-tsort-type="date">DATE</th> 
<th style="min-width: 100px; max-width: 100px;">TYPE</th>
<th style="min-width: 100px; max-width: 100px;">PURCHASE %</th>
<th style="min-width: 100px; max-width: 100px;">SELLING %</th>
<th style="min-width: 100px; max-width: 100px;">P.STONE %</th>
<th style="min-width: 100px; max-width: 100px;">S.STONE %</th>
<th style="min-width: 100px; max-width: 100px;">COMMAND</th>
<th style="min-width: 100px; max-width: 100px;" data-tsort="disabled" data-tfilter="disabled">PRINT</th> 
<th style="min-width: 100px; max-width: 100px;" data-tsort="disabled" data-tfilter="disabled">DELETE</th>
</tr>
</thead>
<tbody>
	<TR>
<%	

{
HashMap<Integer, JewelleryItemModel> jewelleryItemModelMap = jewelleryItemDB.getJewelleryItemAllData(); 

Set entrySet = jewelleryItemModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0;
while (iterator.hasNext()) {
	sno++; 
	Map.Entry jewelleryItemModelMapValue = (Map.Entry) iterator.next();
	jewelleryItemModel = (JewelleryItemModel) jewelleryItemModelMapValue.getValue(); %>
	
	<TD style="min-width: 50px; max-width: 50px;" align="center"><%=sno %></TD>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><a href='JewelleryItemPage.jsp?edit_itemIno=<%=jewelleryItemModel.getItemIno()%>'><%=jewelleryItemModel.getItemIno()%></a></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center"><%=jewelleryItemModel.getItemDate()%></TD> 
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="left"><%=jewelleryItemModel.getItemType()%></TD>
	<TD style="min-width: 100px; max-width: 100px;" align="center"><%=jewelleryItemModel.getItemPurchase()%></TD>
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center" ><%=jewelleryItemModel.getItemSelling()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryItemModel.getItemPStone()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryItemModel.getItemSStone()%></TD>
	<TD style="min-width: 100px; max-width: 100px; font-size: 10px;"><%=jewelleryItemModel.getItemCommand()%></TD>
	<td style="min-width: 100px; max-width: 100px; text-align: center;"><a href='JewelleryItemPage.jsp?print_itemIno=<%=jewelleryItemModel.getItemIno()%>'>PRI</a></td>
	<td style="min-width: 100px; max-width: 100px; text-align: center;"><a href='JewelleryItemPage.jsp?delete_itemIno=<%=jewelleryItemModel.getItemIno()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
	</TR>
	<%}%>


</tbody>
</table>

</div>

<div class="pageFifthdiv"></div>
</div>
<%
}}}   DBConnection.disconnect();
       
       %>
</form>
</body>
</html>

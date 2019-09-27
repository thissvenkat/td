<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.ntj.db.JewelleryExpenseDB"%>  
<%@page import="com.ntj.model.JewelleryExpenseModel"%> 
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
<title>.: AKSHAYAA || EXPENSE :.</title>
<link rel="stylesheet" href="assets/css/jewelleryPurchaseSalesCss.css"/>  
<link rel="stylesheet" href="assets/css/commonCss.css"/> 



<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="assets/css/jquery.simple-dtpicker.css" rel="stylesheet" /> 

<script type="text/javascript">
$(function(){
	$('*[name=expenseDate]').appendDtpicker({
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
$(function(){
	$('*[name=expenseATime]').appendDtpicker({
		"inline": false,
		"locale": "foo",
		"externalLocale": {  
			foo: { 
				days: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
				months: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
				sep: '-',
				format: 'YYYY-MM-DD hh:mm',
				prevMonth: 'Foo',
				nextMonth: 'Bar',
				today: 'Foobar'
			} 
		}
	});
});


$(document).ready(function() {
    $('#example').DataTable( {
        columnDefs: [ {
            targets: [ 0 ],
            orderData: [ 0, 1 ]
        }, {
            targets: [ 1 ],
            orderData: [ 1, 0 ]
        }, {
            targets: [ 4 ],
            orderData: [ 4, 0 ]
        } ]
    } );
} );

</script>

</head>
<body>
<form name="JewelleryExpensePage"  method="Post" action="JewelleryExpenseController">
<div class="pageContentdiv">  

<div class="pageFirstdiv">
<div class="pageFirstLeftdiv">
<a href="JewelleryExpensePage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a>
<a href="JewelleryExpensePage.jsp"> 
<img  src="images/Search.jpg" width="30%" height="85%" > 
</a>
<a href="JewelleryExpensePage.jsp"> 
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
<a href="JewelleryExpenseSearchPage.jsp"> 
<img  src="assets/images/search.jpg" width="90%" height="85%" style="margin-top: 5px; margin-left: 15px;" > 
</a> 
</div> 
</div>
<%
{if(session.getAttribute("userName")==null){response.sendRedirect("JewelleryLoginPage.html");}}
{
	JewelleryExpenseModel jewelleryExpenseModel=new JewelleryExpenseModel();
	JewelleryExpenseDB jewelleryExpenseDB=new JewelleryExpenseDB();
       {
           if(request.getParameter("edit_expenseEno")!= null){
        	   jewelleryExpenseModel.setExpenseEno(request.getParameter("edit_expenseEno").toString());
        	   jewelleryExpenseModel=jewelleryExpenseDB.getJewelleryExpenseEditSearchPrint(jewelleryExpenseModel);
           }else if(request.getParameter("delete_expenseEno")!= null){
        	   jewelleryExpenseModel.setExpenseEno(request.getParameter("delete_expenseEno").toString());
         	 if(jewelleryExpenseDB.getJewelleryExpenseENoDelete(jewelleryExpenseModel)){
						response.sendRedirect("JewelleryExpensePage.jsp");
						return;
           } }
           else
       {
        	   jewelleryExpenseModel=jewelleryExpenseDB.getJewelleryExpenseEno();
    	   
              }
       
%>

<div class="pageSecondPurchasediv">
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr> 
<td>ENO</td>
<td><input type="text" name="expenseEno" id="expenseEno" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryExpenseModel.getExpenseEno()%>" readonly></td>
<td>DATE</td>
<td><input type="text" name="expenseDate" id="expenseDate" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryExpenseModel.getExpenseDate()%>"></td>
<td>MODE</td>
<td><input type="text" name="expenseMode" id="expenseMode" class="textboxCss" style="max-width:80px;min-width:80px; font-size: 12px;" value="<%=jewelleryExpenseModel.getExpenseMode()%>"></td>
</tr>
</table>
<BR>
<table style="margin-left: auto; margin-right: auto;">
<tr>
<td>TYPE</td>
<td style="max-width:200px;min-width:200px; font-size: 20px;"  align="center">
<select class="textboxCss" style="max-width:200px; min-width:200px; font-size: 12px; text-align: center;" id="expenseType" name="expenseType">
 <option value="EXPENSE" <%if(jewelleryExpenseModel.getExpenseType().equalsIgnoreCase("EXPENSE")){%>selected<%}else{%><%} %>>EXPENSE</option> 
<option value="INCOME" <%if(jewelleryExpenseModel.getExpenseType().equalsIgnoreCase("INCOME")){%>selected<%}else{%><%} %>>INCOME</option> 
<option value="CREDIT" <%if(jewelleryExpenseModel.getExpenseType().equalsIgnoreCase("CREDIT")){%>selected<%}else{%><%} %>>CREDIT</option>
</select>
</td>


</tr>
<tr>
<td>TIME</td>
<td><input type="text" name="expenseATime" id="expenseATime" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryExpenseModel.getExpenseATime()%>"></td>
</tr>
<tr>
<td>PARTICULAR</td>
<td><input type="text" name="expenseParticular" id="expenseParticular" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryExpenseModel.getExpenseParticular()%>"></td>
</tr>
<tr>
<td>AMOUNT</td>
<td><input type="text" name="expenseAmount" id="expenseAmount" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryExpenseModel.getExpenseAmount()%>"></td>
</tr>
<tr>
<td>METAL</td>
<td><input type="text" name="expenseMetal" id="expenseMetal" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryExpenseModel.getExpenseMetal()%>"></td>
</tr>
<tr>
<td>COMMAND</td>
<td><input type="text" name="expenseCommand" id="expenseCommand" class="textboxCss" style="max-width:200px;min-width:200px; font-size: 20px;" value="<%=jewelleryExpenseModel.getExpenseCommand()%>"></td>
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
<table style="margin-left:auto; margin-right:auto; text-align: center;" id="example" class="display">
<thead>
<tr>
<th style="min-width: 50px; max-width: 50px;">NO</th>
<th style="min-width: 50px; max-width: 50px;">E NO</th>
<th style="min-width: 80px; max-width: 80px;">DATE</th> 
<th style="min-width: 100px; max-width: 100px;">TYPE</th>
<th style="min-width: 80px; max-width: 80px;">TIME</th>
<th style="min-width: 250px; max-width: 250px;">PARTICULAR</th>
<th style="min-width: 70px; max-width: 70px;">AMOUNT</th>
<th style="min-width: 70px; max-width: 70px;">METAL</th> 
<th style="min-width: 150px; max-width: 150px;">COMMAND</th>
<th style="min-width: 50px; max-width: 50px;">PRI</th> 
<th style="min-width: 50px; max-width: 50px;">DEL</th>
</tr>
</thead>
<%	
{
HashMap<Integer, JewelleryExpenseModel> jewelleryExpenseModelMap = jewelleryExpenseDB.getJewelleryExpenseModelAllData();

Set entrySet = jewelleryExpenseModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0;
while (iterator.hasNext()) {
	sno++;
	Map.Entry jewelleryExpenseModelMapValue = (Map.Entry) iterator.next();
	jewelleryExpenseModel = (JewelleryExpenseModel) jewelleryExpenseModelMapValue.getValue(); %>
	<tbody>
	<TR>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><%=sno %></TD>
	<TD style="min-width: 50px; max-width: 50px;" align="center"><a href='JewelleryExpensePage.jsp?edit_expenseEno=<%=jewelleryExpenseModel.getExpenseEno()%>'><%=jewelleryExpenseModel.getExpenseEno()%></a></TD>
	<TD style="min-width: 80px; max-width: 80px; overflow: hidden;" align="center"><%=jewelleryExpenseModel.getExpenseDate()%></TD> 
	<TD style="min-width: 100px; max-width: 100px; overflow: hidden;" align="center" align="left"><%=jewelleryExpenseModel.getExpenseType()%></TD>
	<TD style="min-width: 80px; max-width: 80px;" align="center"><%=jewelleryExpenseModel.getExpenseTime()%></TD>
	<TD style="min-width: 250px; max-width: 250px; overflow: hidden;" align="center" ><%=jewelleryExpenseModel.getExpenseParticular()%></TD>
	<TD style="min-width: 70px; max-width: 70px; font-size: 10px;"><%=jewelleryExpenseModel.getExpenseAmount()%></TD>
	<TD style="min-width: 70px; max-width: 70px; font-size: 10px;"><%=jewelleryExpenseModel.getExpenseMetal()%></TD>
	<TD style="min-width: 150px; max-width: 150px; font-size: 10px;"><%=jewelleryExpenseModel.getExpenseCommand()%></TD>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryExpensePage.jsp?print_expenseEno=<%=jewelleryExpenseModel.getExpenseEno()%>'>PRI</a></td>
	<td style="min-width: 50px; max-width: 50px; text-align: center;"><a href='JewelleryExpensePage.jsp?delete_expenseEno=<%=jewelleryExpenseModel.getExpenseEno()%>' onclick="return confirm('Are you sure you want to Delete?');">DEL</a></td>
	</TR>
	<%}} %>

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

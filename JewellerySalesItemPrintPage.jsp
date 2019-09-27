<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.ntj.model.JewellerySalesItemModel"%>
    <%@page import="com.ntj.db.JewellerySalesItemDB"%>
<%@page import="com.ntj.model.JewelleryCustomerModel"%>
    <%@page import="com.ntj.db.JewelleryCustomerDB"%>
    <%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>  
<%@page import="com.ntj.util.DBConnection"%>
<%@page import="com.ntj.util.IdGenerator"%>
<%@page import="java.text.DecimalFormat"%>



    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>.: Sales Item Print :.</title>
<style>
table, td {

    border: 1px dashed black;

    border-collapse: collapse;

}

</style>
</head>
<%{
	DecimalFormat decimalFormat = new DecimalFormat("#.###");
	IdGenerator idGenerator = new IdGenerator();
	JewellerySalesItemModel jewellerySalesItemModel=new JewellerySalesItemModel();
	JewellerySalesItemModel jewellerySalesItemModel1=new JewellerySalesItemModel();
	JewellerySalesItemModel jewellerySalesItemModel2=new JewellerySalesItemModel();
	JewellerySalesItemModel jewellerySalesItemModel3=new JewellerySalesItemModel();
	JewellerySalesItemDB jewellerySalesItemDB=new JewellerySalesItemDB(); 
	JewelleryCustomerDB jewelleryCustomerDB=new JewelleryCustomerDB();
	JewelleryCustomerModel jewelleryCustomerModel=new JewelleryCustomerModel();
       if(request.getParameter("print_salesItemBNo")!= null){ 
    	   jewellerySalesItemModel.setSalesItemBNo(request.getParameter("print_salesItemBNo").toString());
    	   jewellerySalesItemModel=jewellerySalesItemDB.getJewellerySalesItemEditBillNo(jewellerySalesItemModel);
       
       } 
      
%>


<body>

<table> 
<tr>
<td colspan="4" style="text-align: center;">Estimate</td>
<td colspan="2" style="font-size: 09px;"><%=jewellerySalesItemModel.getSalesItemBDate()%></td>
</tr>
<tr>
<td colspan="6" >Name:&nbsp;<%=jewellerySalesItemModel.getSalesItemCname().toUpperCase()%></td>
</tr>
<tr >
<td style="width: 69px; ">Item</td>
<td style="width: 70px; ">Gross</td>
<td style="width: 70px; ">%</td>
<td style="width: 70px; ">Pure</td>
<td style="width: 30px; ">Qty</td>
<td style="width: 30px; ">Amt</td>
<%if(Double.parseDouble(jewellerySalesItemModel.getSalesItemOldMbal())>0||Double.parseDouble(jewellerySalesItemModel.getSalesItemOldCbal())>0){ %>
</tr>
<tr style="border: none;">
<td style="border: none;">OB</td>
<td style="border: none;"></td>
<td style="border: none;"></td>
<td style="border: none;"><%=jewellerySalesItemModel.getSalesItemOldMbal()%></td>
<td style="border: none;"></td>
<td style="border: none;"><%=jewellerySalesItemModel.getSalesItemOldCbal()%></td>
</tr>
<%}	{
{
HashMap<Integer, JewellerySalesItemModel> jewellerySalesItemModelMap = jewellerySalesItemDB.getSalesItemEditSearchPrint(jewellerySalesItemModel);

Set entrySet = jewellerySalesItemModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0; 
while (iterator.hasNext()) {   
	sno++;
	Map.Entry jewellerySalesItemModelMapValue = (Map.Entry) iterator.next();
	jewellerySalesItemModel1 = (JewellerySalesItemModel) jewellerySalesItemModelMapValue.getValue();%>
<tr>
	<%-- <TD style="min-width: 30px; max-width: 30px;" align="center"><%=sno %></TD> --%> 
	<TD style="min-width: 30px; max-width: 30px; border: none;"><%=jewellerySalesItemModel1.getSalesItemSType().toUpperCase()%></TD>
	<TD style="min-width: 50px; max-width: 50px; border: none;"><%=jewellerySalesItemModel1.getSalesItemSNetWeight()%></TD>
	<TD style="min-width: 70px; max-width: 70px; border: none;"><%=jewellerySalesItemModel1.getSalesItemSWastage()%></TD>
	<TD style="min-width: 70px; max-width: 70px; border: none;"><%=jewellerySalesItemModel1.getSalesItemSPure()%></TD>
	<TD style="min-width: 70px; max-width: 70px; border: none;"><%=jewellerySalesItemModel1.getSalesItemSCount()%></TD>
	</TR>
	<%} 
jewellerySalesItemModel1=null;
}} %>

<tr> 
<td></td>
<td><%=jewellerySalesItemModel.getSalesItemSNetWeightTot() %></td> 
<td></td>
<td><%=decimalFormat.format(Double.parseDouble(jewellerySalesItemModel.getSalesItemOldMbal())+Double.parseDouble(jewellerySalesItemModel.getSalesItemSPureTot()))%></td>
<td><%=jewellerySalesItemModel.getSalesItemSCountTot()%></td> 
<td><%=Double.parseDouble(jewellerySalesItemModel.getSalesItemSCountTot())*25%></td>
</tr>
<tr>
<td colspan="6" style="border: none;">&nbsp;</td> 
</tr>
<%	{
{
HashMap<Integer, JewellerySalesItemModel> jewellerySalesItemReceiveModelMap = jewellerySalesItemDB.getSalesItemReceiveEditSearchPrint(jewellerySalesItemModel);
Set entrySet = jewellerySalesItemReceiveModelMap.entrySet();
Iterator iterator = entrySet.iterator();
int sno = 0; 
while (iterator.hasNext()) {   
	sno++;
	Map.Entry jewellerySalesItemReceiveModelMapValue = (Map.Entry) iterator.next();
	jewellerySalesItemModel2 = (JewellerySalesItemModel) jewellerySalesItemReceiveModelMapValue.getValue();%>
<tr>
	<TD colspan="3" style="border: none;" >&nbsp;<%=jewellerySalesItemModel2.getSalesItemRWeight()%>&nbsp;*&nbsp;<%=jewellerySalesItemModel2.getSalesItemRResult()%>&nbsp;*&nbsp;<%=jewellerySalesItemModel2.getSalesItemRCalc()%></TD>
	<TD colspan="3" style="border: none;"><%=jewellerySalesItemModel2.getSalesItemRPure()%></TD> 
	
	</TR>
	<%}}}%>

<tr>
<%{

	jewellerySalesItemModel3=jewellerySalesItemDB.getJewellerySalesCashEditBillNo(jewellerySalesItemModel);
	
%>

<td colspan="3" style="border: none;">&nbsp;Rate Cut(&nbsp;<%=idGenerator.getZeroForNull(jewellerySalesItemModel3.getSalesItemCHCash())%>&nbsp;/<%=idGenerator.getZeroForNull(jewellerySalesItemModel3.getSalesItemCHRate())%>)</td>
<td colspan="3" style="border: none;">&nbsp;<%=jewellerySalesItemModel3.getSalesItemCHPure()%></td>

<% 
DBConnection.disconnect();
}	%>
</tr>
 
<tr>
<td colspan="3">TOTAL</td>
<td colspan="3"><%=decimalFormat.format(((Double.parseDouble(jewellerySalesItemModel.getSalesItemRPureTot()))+(Double.parseDouble(jewellerySalesItemModel.getSalesItemCHPure()))))%></td>
</tr>
<tr>
<td colspan="6">&nbsp;</td>
</tr>
<tr>
<td colspan="3">Balance</td>
<td style="width: 70px; "><%=jewellerySalesItemModel.getSalesItemMbal()%></td>
<td></td>
<td style="width: 70px; "><%=jewellerySalesItemModel.getSalesItemCbal()%></td>
</tr>
<tr>
<td colspan="6" style="text-align: center;"> Thank You Visit Again</td>
</tr>
</tbody>
</table>
<%


} %>
</body>
</html>

$x(document)
		.ready(
				function() {
					$("#JewellerySalesItemPage").submit(function(e) {
						e.preventDefault();
					});
					$("#salesItemCmobile").focus(function(e) {
					//$(document).keydown(function(e) { 
					//if(e.which==112){
					dataString = $("#JewellerySalesItemPage").serialize();
					var salesItemCname = $("input#salesItemCname").val();
					
					dataString = "salesItemCname="+ salesItemCname;
								$.ajax({
													type : "POST",
													url : "JewelleryCustomerInfoController",
												 	data : dataString,
													dataType : "json",
													success : function(data,
															textStatus, jqXHR) {
														if (data.success) {
															$("#salesItemCmobile").val(data.jewelleryCustomerModel.custMobile);
															$("#salesItemMbal").val(data.jewelleryCustomerModel.custMbal);
															$("#salesItemCbal").val(data.jewelleryCustomerModel.custCbal);
															$("#salesItemCMode").val(data.jewelleryCustomerModel.custMode);
															$("#salesItemCNo").val(data.jewelleryCustomerModel.custCNo);
															$("#salesItemNewMBal").val(data.jewelleryCustomerModel.custMbal);
															$("#salesItemNewCBal").val(data.jewelleryCustomerModel.custCbal);
														}
														else { 

															$("#salesItemCmobile").val("");
															$("#salesItemMbal").val("0");
															$("#salesItemCbal").val("0");
															$("#salesItemCMode").val("NEW");
															$("#salesItemCNo").val(data.jewelleryCustomerModel.custCNoNext);
															$("#salesItemNewMBal").val("0");
															$("#salesItemNewCBal").val("0");
														}
													}, 
													error : function(jqXHR,textStatus,errorThrown) {
													console.log("Something really bad happened "+ textStatus);
														$("#ajaxResponse")
																.html(
																		jqXHR.responseText);
													},
													beforeSend : function(jqXHR, settings) {
														settings.data += "&dummyData=whatever"; 
														$('#myButton').attr("disabled",true);
													},
													complete : function(jqXHR,textStatus) {
				  										$('#myButton').attr("disabled",false);
													}
												});
					//}
					});
				});

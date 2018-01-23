<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page session="false" %>

<!DOCTYPE html> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Zoom using CSS Scale Transform</title>
	<spring:url value="/resources/images/alpha" var="var_alpha" />
	<link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.2.custom.css'/>
	<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
	<script type="text/javascript" src='${pageContext.request.contextPath}/resources/js/jquery-1.9.1.js'></script>
	<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	<script type="text/javascript" src='${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.2.custom.min.js'></script>

	<!-- # include file="src/src.primitives.html"-->
	
	<script type="text/javascript" src='${pageContext.request.contextPath}/resources/js/primitives.min.js?3710'></script>
	
	<link href='${pageContext.request.contextPath}/resources/css/primitives.latest.css?3710' media="screen" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
		jQuery(document).ready(function () {
			var dialog, form;
			var treeNodes = ${items};
        	var options = new primitives.orgdiagram.Config();
        	var items = [];
        	var buttons = [];
        	
			$('form').on('submit', function(e){
				e.preventDefault();
				return false;
			});
			
			dialog = $("#create-Profile-form").dialog({
				autoOpen: false,
				height: 400,
				width: 350,
				modal: true,
				buttons: {
			        "Create an Profile": function(){
			        	
			        	var profileData = {};
			        	profileData.profileName = $("#in_profileName").val();
			        	profileData.firstName = $("#in_firstName").val();
			        	profileData.lastName = $("#in_lastName").val();
			        	profileData.gender = $("#in_gender").val(),
			        	profileData.parentId = $("#in_parentId").val();

			        	$.ajax({
							type: "POST",
							url: "../profile/save",
							async: true,
							headers: {
			                    'Accept': 'application/json',
			                    'Content-Type': 'application/json'
			                },
							data: JSON.stringify(profileData),
							success: function(result){
								console.log(result);
								dialog.dialog("close");
								items = treeNodesToItems(result.object);
								updateTreeWithItems(items);
							},
							error: function(jqXhr, textStatus, errorThrown){
								console.log(textStatus);
								 alert('error:' +textStatus + '\n:' +errorThrown);
							}
						});
						dialog.dialog( "close" );
			        },
			        Cancel: function() {
			          dialog.dialog( "close" );
			        }
			      },
			      close: function() {
			        //form[ 0 ].reset();
			        //allFields.removeClass( "ui-state-error" );
			      }
			});
			
			dialog.dialog("close");
			
			buttons.push(new primitives.orgdiagram.ButtonConfig("add", "ui-icon-person", "Add"));
			buttons.push(new primitives.orgdiagram.ButtonConfig("delete", "ui-icon-close", "Delete"));
        	        	
        	items = treeNodesToItems(treeNodes);
        	
			options.pageFitMode = primitives.common.PageFitMode.None;
			options.items = items;
			options.buttons = buttons;			
			options.cursorItem = 0;
			options.hasSelectorCheckbox = primitives.common.Enabled.False;
			options.onButtonClick = function (e, data) {
				switch (data.name) {
					case "delete": //alert('clicked on delete:'+JSON.stringify(data.context));
							if(data.context.parent==null || data.context.parent==''){
								alert('you can not delete the parent node')
							}
							else{
								$.ajax({
									type: "DELETE",
									url: "../profile/delete/"+data.context.id,
									//dataType: "json",
									headers: {
				                	    'Accept': 'application/json',
				                    	'Content-Type': 'application/json'
				                	} ,
									success: function(result){
										items = treeNodesToItems(result.object);
										updateTreeWithItems(items);
										console.log(result);
									},
									error: function(jqXhr, textStatus, errorThrown){
										console.log(textStatus);
										alert('error:' +textStatus + '\n:' +errorThrown);
									}
								});
							}
						break;
					case "add": 
						/* get items collection */
						//var items = jQuery("#orgdiagram").orgDiagram("option", "items");
						/* create new item */
						$('#in_parentId').val(data.context.id);
						dialog.dialog( "open" );
						break;
				}
			};
			jQuery("#orgdiagram").orgDiagram(options);

			$("#btn50").button().click(function () { onScale(0.5); });
			$("#btn80").button().click(function () { onScale(.8); });
			$("#btn100").button().click(function () { onScale(1); });
			$("#btn130").button().click(function () { onScale(1.3); });
		});

		function treeNodesToItems(treeNodes){
			var new_items = [];
			jQuery.each(treeNodes, function(index , val){
				new_items.push(
        				new primitives.orgdiagram.ItemConfig({
        					id: val.id,
        					parent: val.parent,
        					title: val.title,
        					description: val.description,
        					image: "${var_alpha}/../"+val.gender+".png"
        				}));
        	});
			
			return new_items;
		}
		
		function updateTreeWithItems(items){
			//alert('updating tree graph');
			jQuery("#orgdiagram").orgDiagram({
				items: items
			});
			jQuery("#orgdiagram").orgDiagram("update", /*Refresh: use fast refresh to update chart*/ primitives.orgdiagram.UpdateMode.Refresh);
		}
		
		
		function onScale(scale) {
			if (scale != null) {
				jQuery("#orgdiagram").orgDiagram({ scale: scale });
			}
			jQuery("#orgdiagram").orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
		}
	</script>
</head>
<body>
	
	<div id="create-Profile-form" title="Create new user">
		<p class="validateTips">All form fields are required.</p>
		
		
		<form:form commandName="profile">
			<table>
				<c:if test="${!empty profile.profileId && profile.profileId!=0}">
					<tr>
						<td>
							<form:label path="profileId">
								<spring:message text="Profile ID"/>
							</form:label>
						</td>
						<td>
							<form:input path="profileId" readonly="true" size="8"  disabled="true" />
							<form:hidden path="profileId" />
						</td> 
					</tr>
				</c:if>
				<tr>
					<td>
						
					</td>
					<td>
						<form:hidden id="in_parentId" path="parentId" />
					</td> 
				</tr>
				<tr>
					<td>
						<form:label path="profileName">
							<spring:message text="Full Name"/>
						</form:label>
					</td>
					<td>
						<form:input id="in_profileName" path="profileName" />
					</td> 
				</tr>
				<tr>
					<td>
						<form:label path="firstName">
							<spring:message text="First Name"/>
						</form:label>
					</td>
					<td>
						<form:input id="in_firstName" path="firstName" />
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="lastName">
							<spring:message text="Last Name"/>
						</form:label>
					</td>
					<td>
						<form:input id="in_lastName" path="lastName" />
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="gender">
							<spring:message text="Gender"/>
						</form:label>
					</td>
					<td>
						<form:select id="in_gender" path="gender" size="1">
							<form:option value="male">Male</form:option>
							<form:option value="female">Female</form:option>
						</form:select>
					</td>
				</tr>
			</table>	
		</form:form>
		
	</div>
	
	<div id="orgdiagram" style="width: 90%; height: 480px; position: absolute; overflow: hidden; border-style: dotted; border-width: 1px;"></div>
	<div id="btn50">50%</div>
	<div id="btn80">80%</div>
	<div id="btn100">100%</div>
	<div id="btn130">130%</div>
</body>
</html>

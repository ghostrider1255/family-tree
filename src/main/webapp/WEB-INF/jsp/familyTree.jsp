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
			
			dialog = $("#create-Profile-form").dialog({
				autoOpen: false,
				height: 400,
				width: 350,
				modal: true,
				buttons: {
			        "Create an Profile": function(){
			        	
			        	alert('adding profile to the tree')
			        	var p_profileName = $("#in_profileName"),
						p_firstname = $("#in_firstName"),
						p_lastname = $("#in_lastName"),
						p_gender = $("#in_gender");
						
			        	$.ajax({
							type: "POST",
							url: "/profile/add",
							dataType: "json",
							data: { profileName: p_profileName,
									firstName: p_firstname,
									lastName: p_lastname,
									p_gender: gender},
							success: function(response){
								alert('profile added')
								dialog.dialog("close");
							},
							error: alert('error adding profile'),
							fail: alert('fail adding profile')
						});
						
						dialog.dialog( "close" );
			        },
			        Cancel: function() {
			          dialog.dialog( "close" );
			        }
			      },
			      close: function() {
			        form[ 0 ].reset();
			        allFields.removeClass( "ui-state-error" );
			      }
			});
			
			dialog.dialog("close");
			
			var treeNodes = ${items};
        	var options = new primitives.orgdiagram.Config();
        	var items = [];
        	var buttons = [];
			buttons.push(new primitives.orgdiagram.ButtonConfig("add", "ui-icon-person", "Add"));
			buttons.push(new primitives.orgdiagram.ButtonConfig("delete", "ui-icon-close", "Delete"));
			
        	jQuery.each(treeNodes, function(index , val){
        		items.push(
        				new primitives.orgdiagram.ItemConfig({
        					id: val.id,
        					parent: val.parent,
        					title: val.title,
        					description: val.description,
        					image: "${var_alpha}/../male.png"
        				}));
        	});
			options.pageFitMode = primitives.common.PageFitMode.None;
			options.items = items;
			options.buttons = buttons;			
			options.cursorItem = 0;
			options.hasSelectorCheckbox = primitives.common.Enabled.False;
			options.onButtonClick = function (e, data) {
				switch (data.name) {
					
					case "delete": alert('clicked on delete');
						jQuery("#orgdiagram").orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
						break;
					case "add": 
						/* get items collection */
						var items = jQuery("#orgdiagram").orgDiagram("option", "items");
						//alert('existing number of nodes are '+items.length);
						/* create new item */
						dialog.dialog( "open" );
						var newItem;
						//end creating new item
						
						/* add it to items collection and put it back to chart, actually it is the same reference*/
						items.push(newItem);
						jQuery("#orgdiagram").orgDiagram({
							items: items,
							cursorItem: newItem.id
						});
						jQuery("#orgdiagram").orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
						break;
				}
			};
			jQuery("#orgdiagram").orgDiagram(options);

			$("#btn50").button().click(function () { onScale(0.5); });
			$("#btn80").button().click(function () { onScale(.8); });
			$("#btn100").button().click(function () { onScale(1); });
			$("#btn130").button().click(function () { onScale(1.3); });
		});

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
		
		<c:url var="addAction" value="/profile/add" />
		
		<form:form action="${addAction}" commandName="profile" method="POST">
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
				<%-- <tr>
					<td colspan="2">
						<c:if test="${!empty profile.profileId && profile.profileId!=0}">
							<input type="submit"
								value="<spring:message text="Edit Profile"/>" />
						</c:if>
						<c:if test="${profile.profileId==0 || empty profile.profileId}">
							<input type="submit"
								value="<spring:message text="Add Profile"/>" />
						</c:if>
					</td>
				</tr> --%>
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

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Zoom using CSS Scale Transform</title>
	<spring:url value="/resources/images/alpha" var="var_alpha" />
	<link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.2.custom.css'/>
	<script type="text/javascript" src='${pageContext.request.contextPath}/resources/js/jquery-1.9.1.js'></script>

	<script type="text/javascript" src='${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.2.custom.min.js'></script>

	<!-- # include file="src/src.primitives.html"-->
	
	<script type="text/javascript" src='${pageContext.request.contextPath}/resources/js/primitives.min.js?3710'></script>
	
	<link href='${pageContext.request.contextPath}/resources/css/primitives.latest.css?3710' media="screen" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
		jQuery(document).ready(function () {
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
	<div id="orgdiagram" style="width: 90%; height: 480px; position: absolute; overflow: hidden; border-style: dotted; border-width: 1px;"></div>
	<div id="btn50">50%</div>
	<div id="btn80">80%</div>
	<div id="btn100">100%</div>
	<div id="btn130">130%</div>
</body>
</html>

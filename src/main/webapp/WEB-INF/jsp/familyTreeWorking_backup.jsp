<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
	
	<link href='${pageContext.request.contextPath}/resources/css/primitives.latest.css?2106' media="screen" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
		jQuery(document).ready(function () {
			$.ajax({
				type: "GET",
				url: "/ft/ ",
				dataType : 'json',
				contentType : 'application/json; charset=utf-8',
                success : function(result) {
                	alert(result);
                	alert(result.items);
                    console.log(result);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                	var itsm = ${items};
                	var options = new primitives.orgdiagram.Config();
                	var items = [];
                	jQuery.each(itsm, function(index , val){
                		items.push(
                				new primitives.orgdiagram.ItemConfig({
                					id: val.id,
                					parent: val.parent,
                					title: val.title,
                					description: val.description,
                					image: "${var_alpha}/a.png"
                				})
                				);
                	});
        			options.pageFitMode = primitives.common.PageFitMode.None;
        			options.items = items;
        			
        			options.cursorItem = 0;
        			options.hasSelectorCheckbox = primitives.common.Enabled.False;
        			jQuery("#orgdiagram").orgDiagram(options);

        			$("#btn50").button().click(function () { onScale(0.5); });
        			$("#btn100").button().click(function () { onScale(1); });
        			$("#btn150").button().click(function () { onScale(1.5); });
                }
			});
			
			
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
	<div id="btn100">100%</div>
	<div id="btn150">150%</div>
</body>
</html>

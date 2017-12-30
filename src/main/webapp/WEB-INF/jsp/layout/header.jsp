<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">

div {
	display: block;
}
#top{
	width: 100%;
	height: 70px;
	//border: 2px ridge red;
}
#logoBody{
	width: 1200px;
	height: 70px;
	margin: 0 auto;
	//border: 2px ridge red;
}

#logoContainer{
	width: 980px;
	height: 70px;
	//background-color: white;
	float: right;
	//border: 1px ridge black;
}

#categoryHeader{
	width: 200px;
	height: 30px;
	background-color: #589ADB;
	border-radius: 10px 10px 0px 0px;
	position: absolute;
	bottom: 0px;
	font-style: Bold;
	font-size: 20px;
	color: white;
	float: left;
	padding: 5px 0px 5px;
}
#horizontalMenuArea{
	position: absolute;
	top: 0px;
	width: 75%;
	height: 50px;
	background-color: #102841;
	border-radius: 0px 0px 0px 0px;
	font-style: Bold;
	font-size: 17px;
	color: white;
	bottom: 10px;
	margin-top: 0px;
	margin-left: 1px;
}

ul.horizMenu{
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	
}
li.horizMenu{
	float: left;
}
li a.horizMenu{
	display: block;
	color: white;
	text-align: center;
	padding: 20px 30px;
	text-decoration: none;
}
li a.horizMenu:hover{
	color: #589ADB;
}

li.horizMenu:first-child a.horizMenu{
	color: #589ADB;
}

#logo_twitter{
	right: 300px;
	width: 27px;
	background: url('<c:url value='/images/social-media-icons.jpg' />) -124px -19px;
	border-radius: 10px 10px 10px 10px;
}
#logo_twitter a:hover{
	right: 300px;
	width: 27px;
	background: url('file:/images/social-media-icons.jpg') -124px -118px;
	border-radius: 10px 10px 10px 10px;
}
#logo_gPlus{
	right: 268px;
	width: 27px;
	background: url('file:/images/social-media-icons.jpg') -87px -19px;
	border-radius: 10px 10px 10px 10px;
}
#logo_gPlus a:hover{
	right: 268px;
	width: 27px;
	background: url('images/social-media-icons.jpg') -87px -118px;
	border-radius: 10px 10px 10px 10px;
}
#logo_fb{
	right: 234px;
	width: 27px;
	background: url('images/social-media-icons.jpg') -342px -19px;
	border-radius: 10px 10px 10px 10px;
}

#logo_fb a:hover{
	right: 234px;
	width: 27px;
	background: url('images/social-media-icons.jpg') -342px -118px;
	border-radius: 10px 10px 10px 10px;
}


</style>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<div id="top">
			<div id="logoBody">
				<div id="logoContainer">
					<div id="horizontalMenuArea">
						<ul class="horizMenu">
							<li class="horizMenu"><a class="horizMenu" href="${contextPath}/profile/viewprofile">Home</a></li>
							<li class="horizMenu"><a class="horizMenu" href="${contextPath}/ft/viewtree">View Tree</a></li>
							<li class="horizMenu"><a class="horizMenu" href="#">Contact US</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
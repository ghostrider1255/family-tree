<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>view Profiles</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>Add Profile</h1>

<c:url var="addAction" value="/profile/add" ></c:url>

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
			<form:input path="profileName" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="firstName">
				<spring:message text="First Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="firstName" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="lastName">
				<spring:message text="Last Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="lastName" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="gender">
				<spring:message text="Gender"/>
			</form:label>
		</td>
		<td>
			<form:select path="gender" size="1">
				<form:option value="male">Male</form:option>
				<form:option value="female">Female</form:option>
			</form:select>
		</td>
	</tr>
	<tr>
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
	</tr>
</table>	
</form:form>
<br>
<h3>Profile List</h3>
<c:if test="${!empty listProfiles}">
	<table class="tg">
	<tr>
		<th width="80">Profile ID</th>
		<th width="120">Profile Name</th>
		<th width="120">First Name</th>
		<th width="120">Last Name</th>	
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listChapters}" var="chapter">
		<tr>
			<td>${profile.profileId}</td>
			<td>${profile.profileName}</td>
			<td>${profile.firstName}</td>
			<td>${profile.lastName}</td>
			<td><a href="<c:url value='/editProfile/${profile.profileId}' />" >Edit</a></td>
			<td><a href="<c:url value='/removeProfile/${profile.profileId}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
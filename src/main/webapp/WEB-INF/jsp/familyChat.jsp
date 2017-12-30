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
<h1>
	Add Profile
</h1>

<c:url var="addAction" value="/chapter/add" ></c:url>

<form:form action="${addAction}" commandName="chapter">
<table>
	<c:if test="${!empty chapter.chapterId && chapter.chapterId!=0}">
	<tr>
		<td>
			<form:label path="chapterId">
				<spring:message text="Chapter ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="chapterId" readonly="true" size="8"  disabled="true" />
			<form:hidden path="chapterId" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="chapterCode">
				<spring:message text="Chapter Code"/>
			</form:label>
		</td>
		<td>
			<form:input path="chapterCode" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="chapterName">
				<spring:message text="Chapter Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="chapterName" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="chapterDesc">
				<spring:message text="Chapter Description"/>
			</form:label>
		</td>
		<td>
			<form:input path="chapterDesc" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty chapter.chapterId && chapter.chapterId!=0}">
				<input type="submit"
					value="<spring:message text="Edit Chapter"/>" />
			</c:if>
			<c:if test="${chapter.chapterId==0}">
				<input type="submit"
					value="<spring:message text="Add Chapter"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Chapters List</h3>
<c:if test="${!empty listChapters}">
	<table class="tg">
	<tr>
		<th width="80">Chapter ID</th>
		<th width="120">Chapter Code</th>
		<th width="120">Chapter Name</th>
		<th width="120">Chapter Description</th>
		<th width="120">Status</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listChapters}" var="chapter">
		<tr>
			<td>${chapter.chapterId}</td>
			<td>${chapter.chapterCode}</td>
			<td>${chapter.chapterName}</td>
			<td>${chapter.chapterDesc}</td>
			<td>${chapter.chapterStatus}</td>
			<td><a href="<c:url value='/editChapter/${chapter.chapterId}' />" >Edit</a></td>
			<td><a href="<c:url value='/removeChapter/${chapter.chapterId}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ page session="false" %>
<html>
<head>
	<title>Scraping-Test</title>
</head>
<body>

<div style="height:30px;
			width:650px;
			background-color: rgb(100,100,100);
			border-radius: 12px;
			margin: 20 20;
			padding: 20 20;">
		<form method="GET" id="url" action="/showmethecard/webscrapping/showcard.action">
			<input type="text" id="url" name="url" style="width:600px"/>
			<button type="submit" id="searchbtn" style="height:25px;">써치</button>
		</form>
</div>

</body>
</html>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>layout page</title>
</head>
<body>
	<div> <tiles:insertAttribute name="header" /> </div>
	<div style="float: left; padding: 10px; width: 100%; height: 100%;">
		<tiles:insertAttribute name="body" />
	</div>
	<div> <tiles:insertAttribute name="footer" /> </div>

</body>
</html>
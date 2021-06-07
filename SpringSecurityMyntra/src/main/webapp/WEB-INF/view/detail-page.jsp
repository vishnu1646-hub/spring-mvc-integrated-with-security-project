<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>details page</title>
<style type="text/css">
table {
	padding: 10px;
	border: 2px solid #000000;
	border-radius: 5px;
}

table.tableCenter {
	border: 5px solid black;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>

	<div>
		<table class="tableCenter">
			<tr>
				<td><img style="height: 225px; width: 225px;"
					src="data:image/jpg;base64,${productDetails.base64Image}" /></td>
				<td></td>
			</tr>
			<tr>
				<td><h2>${productDetails.description}</h2></td>
				<td></td>
			</tr>
			<tr>
				<td><h1>${productDetails.name}</h1></td>
				<td></td>
			</tr>
			<tr>
				<td><h1>&#x20B9;${productDetails.price}</h1></td>
				<td><sec:authorize access='hasAuthority("USER")'>
						<a
							href="${pageContext.request.contextPath}/cartpage/${productDetails.productCode}"><button>ADD
								TO CART</button></a>
					</sec:authorize></td>
			</tr>
		</table>
	</div>

</body>
</html>
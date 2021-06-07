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
<title>cart page</title>
<style type="text/css">
table {
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 10px;
	border: 2px solid #000000;
	border-radius: 5px;
	border-spacing: 10px;
}

table.cartCenter {
	border: 5px solid black;
	margin-left: 65px;
	float: left;
}

.cart {
	text-align: center;
}
</style>
</head>
<body>
	<div class="cart">
		<h1>
			<b>My Cart</b>
		</h1>
	</div>
	<div>
		<c:forEach var="cartList" items="${cartDetails}">
			<table class="cartCenter">
				<tr>
					<td><img style="height: 225px; width: 225px;"
						src="data:image/jpg;base64,${cartList.base64Image}" /></td>
					<td></td>
				</tr>
				<tr>
					<td><h2>${cartList.description}</h2></td>
					<td></td>
				</tr>
				<tr>
					<td><h1>${cartList.name}</h1></td>
					<td></td>
				</tr>
				<tr>
					<td><h1>&#x20B9;${cartList .price}</h1></td>
					<td><a href="${pageContext.request.contextPath}/checkOut"><button>CHECK
								OUT</button></a></td>
				</tr>
			</table>
		</c:forEach>
	</div>

</body>
</html>
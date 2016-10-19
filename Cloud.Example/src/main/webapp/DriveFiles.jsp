<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drive Files Manager</title>
</head>
<body>

<div>
	<span> Nuevo documento</span>
	<form action="AddNewDriveDocument">
	  <input type="text" name="newDocument" placeholder="Nombre"><br>
	  <input type="submit" value="Crear">
	</form> 
</div>




<table border="1">
<span>Lista de archivos en el ROOT de drive:</span>
<c:forEach items="${sessionScope.fileNameList}" var="name">
    <tr>      
        <td>${name}</td>
    </tr>
</c:forEach>

</table>


</body>
</html>
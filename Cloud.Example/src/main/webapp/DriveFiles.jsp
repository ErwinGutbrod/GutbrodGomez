<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drive Files Manager</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div style="margin-bottom: 25px; margin-top: 43px; margin-left: 20px;" class="form-group">
	<form action="AddNewDriveDocument">
	  <label for="newDoc">Nuevo documento:</label>
	  <input type="text" name="newDocument" placeholder="Nombre"><br>
	  <input type="submit" class="btn-success" value="Crear">
	</form> 
</div>

<div class="table-responsive" style="margin-left: 115px">
	<table border="1"class="table-striped ">
		<span>Lista de archivos en el ROOT de drive:</span>
		<c:forEach items="${sessionScope.fileNameList}" var="name">
		    <tr>      
		        <td>${name}</td>
		    </tr>
		</c:forEach>

	</table>

</div>


</body>
</html>
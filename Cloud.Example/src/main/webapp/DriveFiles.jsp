<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
String[] myStringArray = new String[]{"zzz.tar","bb.java","ar.js"};
%>
<div> 
	<span> Lista de archivos en la raiz de su Google drive</span>
</div>

<div>
	<table width="59%" border="1">
	<%
	                 for(int i = 0; i< myStringArray.length ;i++)
	                    { %>
	 <tr>
	 
	                 
	                     <td>
	                     <%= myStringArray[i] %>
	                     </td>
	                                 
	                </tr>
	      <% 
	                    }
	                %>  

	</table>
</div>




</body>
</html>
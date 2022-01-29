<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title><font color="white">
<style type="text/css">
.right {text-align: right;
}
</style>
<style>
body
{
background-image: url("6.png");
background-repeat: no-repeat;
background-size:cover;
}
</style>
</head>

<body >
 <p>
   <%@ page import="java.sql.*" %>
   
 Welcome <%=session.getAttribute("uname")%>,
 <p>Click <a href="main2.jsp
"><font color="white">here</font></a> to go to the Home Page.
   </p> 
</font>
</body>
</html>
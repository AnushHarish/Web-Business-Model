<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>REG</title>
<style type="text/css">
.right {text-align: right;
}
</style>
</head>

<body>
<font color="white">
<style>
body
{
background-image: url("4.png");
background-repeat: no-repeat;
background-size:cover;
}
</style>
 <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
       
<%
        String m=null, mn=null;
        String s=request.getParameter("name");
        String s1=request.getParameter("id");
        String s2=request.getParameter("password");
        
        String s4=request.getParameter("address");
		String s5=request.getParameter("phone");
        PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
       Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","");
      
         Statement st=con.createStatement();
       
          ps= con.prepareStatement("insert into register1 values (?,?,?,?,?)");
            ps.setString(1,s);
            ps.setString(2,s1);
            ps.setString(3,s2);
           
            ps.setString(4,s4);
           ps.setString(5,s5);
               int insertResult = ps.executeUpdate();
             if (insertResult!=0)
            {
                 out.println("Successfully registered");
            }          
        %>
        
               To Login <a href="login.jsp"><font color="white">Click Here</font></a>
       </font>         
</body>
</html>
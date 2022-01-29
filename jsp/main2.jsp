
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%
        Connection conn = null;
        
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","");
        
        PreparedStatement psSelectRecord=null;
        ResultSet rsSelectRecord=null;
        String sqlSelectRecord=null;
   
        sqlSelectRecord ="SELECT * FROM products";
        psSelectRecord=conn.prepareStatement(sqlSelectRecord);
        rsSelectRecord=psSelectRecord.executeQuery();
%>
<html>

<body>
<style>
body
{
background-image: url("m1.jpg");
background-repeat: no-repeat;
background-size:cover;
}
</style>
  <a href="logout.jsp"><font color="black">Logout</font></a>
 <div align="center">
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   
 <table border='0' cellpadding='3' width='700'>
 <tr>
   <td  bgcolor="grey">PRODUCT ID</td>
   <td  bgcolor="grey">PRODUCT NAME</td>
   <td  bgcolor="grey">PRICE</td> 
   <td  bgcolor="grey">ADD TO CART</td> 
   </tr>
  
  <%
  
  while(rsSelectRecord.next())
  {
  %>
   
   <tr>
  
   <td><%=rsSelectRecord.getString("pid")%></td>
   <td><%=rsSelectRecord.getString("Pname")%></td>
   <td><%=rsSelectRecord.getInt("price")%></td> 
   
   <td><b><span lang="en-us"><a href="buy.jsp"><input type="submit" value="ADD"> </a></span></b></td>
  
  </tr>
  
  <%
   
  } 
  %>
  
  </table>
 </div>
</body>
</html>
<%
try{
          if(psSelectRecord!=null)
          {
            psSelectRecord.close();
          }
          if(rsSelectRecord!=null)
          {
            rsSelectRecord.close();
          }
          
          
          if(conn!=null)
          {
           conn.close();
          }
        }
        catch(Exception e)
        {
          e.printStackTrace(); 
        }
%>

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
<style>
body
{
background-image: url("5.png");
background-repeat: no-repeat;
background-size:cover;
}
</style>
<table border=1>
<tr>
<th>Product Id</th>
<th>Product Name</th>
<th>Price</th>
</tr>
 <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
          
       
<%
       
        String s=request.getParameter("id");
        String s1=request.getParameter("pid");
        PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
        ResultSet rs1= null;
        ResultSet rs2=null;
        int insertResult=0;
        String pname=null;
        String price=null;
        String s2=null;
        String s3=null;
        
        %>
        <% 
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","");
        Statement st=con.createStatement();
    
        CallableStatement cs=null;
        String sp="{call prosum3(?,?)}";
        rs=st.executeQuery("SELECT pname FROM products WHERE pid="+s1);
        while(rs.next())
        {
        	 s2=rs.getString("pname");
        }
       
        rs1=st.executeQuery("SELECT price FROM products WHERE pid="+s1);
        while(rs1.next())
        {
        s3=rs1.getString("price");
        }
        ps= con.prepareStatement("insert into orders values (?,?,?,?)");
        ps.setString(1,s);
        ps.setString(2,s1);
        ps.setString(3,s2);
        ps.setString(4,s3);
        insertResult=ps.executeUpdate();
      
         %>
         <% 
        if (insertResult!=0)
         {  out.println("CART<br>");
            ps= con.prepareStatement("SELECT pid,pname,price FROM orders WHERE id = ?");
            ps.setString(1,s);
            rs2=ps.executeQuery();
            while(rs2.next())
            {
            %>
             <tr>
            
             <td><%=rs2.getString("pid")%></td>
             <td><%=rs2.getString("pname")%></td>
             <td><%=rs2.getString("price")%></td> 
             
            
            
            </tr>
             
            
            <%
             
            } 
         
        
            cs = con.prepareCall(sp);
            cs.setString(1,s);
            cs.registerOutParameter(2,Types.INTEGER);
            cs.execute();
        	int total=cs.getInt(2);
        	out.print("TOTAL AMOUNT= ");
            out.print(total);
        	
            
        	cs.close();
        
         }
        else
        {%>
        
        <jsp:forward page="buy.jsp"/>
       
        <%
        }
        
        }
        
         
            catch (Exception e) { 
         	out.println (e); 
         	} 
       
         %>
         </table> 
            <br></br>
         <form action="main2.jsp">
        <input type="submit" value="HOME" />
        </form>
        <br></br>
    
         <form action="confirmed.jsp">
        <input type="submit" value="PLACE ORDER" />
        </form>
       
</body>
</html>
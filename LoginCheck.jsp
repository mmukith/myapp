<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.io.*"%>
    <html> 
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Check</title> 
        </head> 
<body> 
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String driver = "oracle.jdbc.driver.OracleDriver";
        String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
        String dbuser = "bud";
        String dbpassword = "bud";
        Connection theConnection = null;
        PreparedStatement theStatement = null;

     try{  
         Class.forName(driver);
         theConnection=DriverManager.getConnection(dbURL,dbuser,dbpassword);  
         theStatement = theConnection.prepareStatement("select * from USERTBL1 where usrname=? and pasword=?");
	 theStatement.setString(1,request.getParameter("username"));
         theStatement.setString(2,request.getParameter("password"));

    ResultSet theResult = theStatement.executeQuery();

      if(theResult.next())
//         out.println("Success");

	response.sendRedirect("Home.jsp");
         else
//         out.println("Failed");
	response.sendRedirect("Error.jsp");
          }catch(Exception e){
           out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
         }  

        %>
</body>
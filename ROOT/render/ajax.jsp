<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

boolean first = true;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost/railgun?user=root&password=&serverTimezone=UTC");
    stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT text FROM reviewed WHERE time='" + request.getParameter("time") +"'");

    // Do something with the Connection

} catch (SQLException ex) {
    // handle any errors
    System.out.println("SQLException: " + ex.getMessage());
    System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
}
%>
[
<%
while(rs.next())
{
if (first){
    first = false;
}else{
    %>,<%
}

%>
 '<%=rs.getString("text")%>'
<% 

}
%>
]
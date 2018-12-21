<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

boolean first = true;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost/railgun?user=root&password=U$wfZw6C&serverTimezone=UTC");
    stmt = conn.createStatement();
	if(request.getParameter("status").equals("accept"))
		stmt.executeUpdate("INSERT INTO reviewed ( id, openid, text, reviewer ) VALUES (\"" + request.getParameter("id")+"\", \"" + request.getParameter("openid") +"\", \"" + request.getParameter("text")+"\", \"" + request.getParameter("reviewer")+"\")");
    stmt.executeUpdate("DELETE FROM request WHERE id = " + request.getParameter("id"));
} catch (SQLException ex) {%>
    SQLException:   <%=ex.getMessage()%>
    SQLState:   <%=ex.getSQLState()%>
    VendorError:   <%=ex.getErrorCode()%>
<%
return;
}
%>
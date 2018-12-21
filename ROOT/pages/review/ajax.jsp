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
    rs = stmt.executeQuery("SELECT text , id FROM reviewed WHERE id > " + request.getParameter("id"));

    // Do something with the Connection

} catch (SQLException ex) {%>
    SQLException:   <%=ex.getMessage()%>
    SQLState:   <%=ex.getSQLState()%>
    VendorError:   <%=ex.getErrorCode()%>
<%
return;
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
 {"text":"<%=rs.getString("text")%>","id":<%=rs.getString("id")%>}
<% 

}
%>
]
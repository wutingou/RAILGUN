﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "";

boolean first = true;
try{
	Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost/railgun?user=root&password=U$wfZw6C&serverTimezone=UTC");
    stmt = conn.createStatement();
	sql = "SELECT id , openid , text , time , reviewer FROM request";
	rs = stmt.executeQuery(sql);
	
} catch (SQLException ex) {%>
    SQLException:   <%=ex.getMessage()%>
    SQLState:   <%=ex.getSQLState()%>
    VendorError:   <%=ex.getErrorCode()%>
<%
return;
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>元旦文艺汇演弹幕管理系统</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="../../node_modules/jqvmap/dist/jqvmap.min.css" />
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="../../index.jsp"><img src="../../images/logo.svg" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="../../index.jsp"><img src="../../images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-stretch">
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
              <div class="nav-profile-text">
                <p class="mb-1 text-black">HundunStar</p>
              </div>
            </a>
            <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">
                <i class="mdi mdi-logout mr-2 text-primary"></i>
                Signout
              </a>
            </div>
          </li>
          <li class="nav-item nav-logout d-none d-lg-block">
            <a class="nav-link" href="#">
              <i class="mdi mdi-power"></i>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
	
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="../../">
              <span class="menu-title">实时情况</span>
              <i class="mdi mdi-home menu-icon"></i>
            </a>
          </li>
		  
		  <li class="nav-item active">
            <a class="nav-link" href="index.jsp">
              <span class="menu-title">弹幕审核</span>
              <i class="mdi mdi-contacts menu-icon"></i>
            </a>
          </li>
		  
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">UI Elements</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi-crosshairs-gps menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
              </ul>
            </div>
          </li>
          
        </ul>
      </nav>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="page-header">
            <h3 class="page-title">
              弹幕审核
            </h3>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Review</a></li>
              </ol>
            </nav>
          </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">等待中的弹幕</h4>
                  <p class="card-description">
                    审核机位：<b>1</b>
                  </p>
                  <table style="text-align: center;" class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          #
                        </th>
                        <th>
                          弹幕发送者
                        </th>
                        <th>
                          内容
                        </th>
                        <th>
                          是否通过
                        </th>
                      </tr>
                    </thead>
                    <tbody>
					  <%
					    try{
							while(rs.next()){
								String Json="[{\"id\":\""+rs.getInt("id")+"\",\"openid\":\""+rs.getString("openid")
									+"\",\"text\":\""+rs.getString("text")+"\",\"reviewer\":\""+rs.getString("reviewer")+"\"}]";
					  %>
					  <tr id="<%=rs.getInt("id")%>">
					    <td width=8%>
							<%=rs.getInt("id")%>
						</td>
						<td width=18%>
							<%=rs.getString("openid")%>
						</td>
						<td>
						    <%=rs.getString("text")%>
					    </td>
                        <td width=16%>
                          <button type="button" class="btn btn-gradient-success btn-sm" id="accept" info='<%=Json%>'>通过</button>
					      <button type="button" class="btn btn-gradient-danger btn-sm" id="reject" info='<%=Json%>'>拒绝</button>
                        </td>
                      </tr>
					  <%
							}
						}catch (SQLException ex) {
					  %>
						SQLException:   <%=ex.getMessage()%>
						SQLState:   <%=ex.getSQLState()%>
						VendorError:   <%=ex.getErrorCode()%>
					  <%
							return;
						}
					  %>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017 <a href="#" target="_blank">Bootstrap Dash</a>. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Powered By <b>EFZTV</b></span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <script src="../../vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>

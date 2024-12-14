<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Package" %>


<!DOCTYPE html>
<html>

<head>
    <title>All PACKAGES</title>
    <link rel="stylesheet" href="css/addpackageStyle.css">
</head>

<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebarHead">

                <h1>Heara</h1>
                <h3>Admin Dashboard</h3>
            </div>
            <br><br>
            <ul>
                <li><a href="/EventPlaningSystem/getPackages">All Packages</a></li>
                <li><a href="addpackages.jsp">Add Package</a></li>
             
                <li><a href="./logout.php">Logout</a></li>
            </ul>
        </div>
        <div class="main-content">
            <div>
                <h2>All Packages</h2>
            </div>
            <div style="display:flex;justify-content: space-around;flex-wrap: wrap;">
              <% 
                List<Package> packages = (List<Package>) request.getAttribute("packages");
                if (packages != null) {
                    for (Package pkg : packages) { %>
                       <div class="movie-card" style="color:black;">
                        <img src="<%= pkg.getPackagePoster() %>" alt="${pkg.packageName}" style="width:100%">
                        <div class="container">
                            <h4><b><%=pkg.packageName %></b></h4>
                            <p><%=pkg.type %></p>
                            <p>Released Year: <%=pkg.releasedYear %></p>
                            <p>Language: <%=pkg.language %></p>
                            <p>Price: <%=pkg.packagePrice %></p>
                            <p>Available Time Period: <%=pkg.availableTimePeriod %></p>
                            <a href="<%= request.getContextPath() %>/getPackages?action=edit&id=<%= pkg.getPackageId() %>">
        Update
    </a>

    <!-- Delete link -->
    <a href="<%= request.getContextPath() %>/getPackages?action=deletePackage&id=<%= pkg.getPackageId() %>">
        Delete
    </a>
                        </div>
                    </div>
                <%} } %>
            </div>
        </div>
    </div>
</body>

</html>

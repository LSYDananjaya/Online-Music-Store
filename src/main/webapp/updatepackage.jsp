<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Package" %>
<%@ page import="java.util.List" %>
<%-- Retrieve the package object from the request --%>
<% Package pkg = (Package) request.getAttribute("package"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Your head content -->
    <title>Update Package</title>
    <link rel="stylesheet" type="text/css" href="css/addpackageStyle.css">
</head>
<body>

<!-- Your header content -->

<div class="background1">
    <h1>Update a Package!</h1>
</div>

<section>
    <form method="post" action="<%= request.getContextPath() %>/getPackages?action=updatePackage&id=<%= pkg.getPackageId() %>">
        <div class="form-group">
            <label>Package Name:</label>
            <input type="hidden" name="phgID" value="<%= pkg.getPackageId() %>" readonly>
            <input type="text" name="packageName" value="<%= pkg.getPackageName() %>" required>
        </div>
        <div class="form-group">
            <label>Type:</label>
            <select name="type" required>
                <option value="Action">Action</option>
                <option value="Popular">Most Popular</option>
                <option value="Release">New Release</option>
                <option value="Rock">Rock</option>
                <option value="Pop">Pop</option>
                <option value="Acoustic">Acoustic</option>
                <option value="Old Hits">Old Hits</option>
                <option value="Classical">Classical</option>
                <option value="Jazz">Jazz</option>
                <option value="Reggae">Reggae</option>
                <option value="Disco">Disco</option>
                <!-- Add other types as needed -->
            </select>
        </div>
        <div class="form-group">
            <label>Released Year:</label>
            <input type="text" name="releasedYear" value="<%= pkg.getReleasedYear() %>" required>
        </div>
        <div class="form-group">
            <label>Language:</label>
            <select name="language" required>
                <option value="Mix">Mix</option>
                <option value="English">English</option>
                <option value="Sinhala">Sinhala</option>
                <option value="Tamil">Tamil</option>
                <option value="Spanish">Spanish</option>
                <option value="French">French</option>
                <option value="German">German</option>
                <!-- Add other language options -->
            </select>
        </div>
        <div class="form-group">
            <label>Number of Songs:</label>
            <input type="text" name="numberOfSongs" value="<%= pkg.getNumberOfSongs() %>" required>
        </div>
        <div class="form-group">
            <label>Package Price:</label>
            <input type="number" name="packagePrice" value="<%= pkg.getPackagePrice() %>" required>
        </div>
        <div class="form-group">
            <label>Available Time Periods:</label>
            <select name="availableTimePeriod" required>
                <option value="One Month">One Month</option>
                <option value="Three Months">Three Months</option>
                <option value="Six Months">Six Months</option>
                <option value="One Year">One Year</option>
                <option value="Life Time">Life Time</option>
            </select>
        </div>
        <div class="form-group">
            <label>Package Poster:</label>
            <input type="text" name="packagePoster" value="<%= pkg.getPackagePoster() %>" placeholder="image-url" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Update Package">
        </div>
    </form>
</section>

<!-- Your footer content -->

</body>
</html>

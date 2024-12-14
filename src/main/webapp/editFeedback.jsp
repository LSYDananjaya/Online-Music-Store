<%@ page import="java.util.List" %>
<%@ page import="models.Feedback" %>
<%@ page import="models.Package" %>
<%@ page import="services.FeedbackService" %>
<%@ page import="services.PackageService" %>

<%
    Feedback feedback = (Feedback) request.getAttribute("feedback");
    List<Package> packages = (List<Package>) request.getAttribute("packages");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Feedback</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom styles -->
    <style>
        .button {
  padding: 3px 20px;
  color:#fff;
  
  border: 2px solid #fff;
  background: transparent;
  border-radius: 5px;
  cursor: pointer;
}
.button:hover {
  padding : 3px 20px;
  border: 2px solid #650009;
}
.button:active {
  transform: scale(0.98);
}

.button1 {
  padding: 3px 20px;
  color:#fff;
  
  border: 2px solid #fff;
  background: #000000;
  border-radius: 5px;
  cursor: pointer;
}
.nav {
  position: sticky;
  padding: 15px 200px;
  background: #000000;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}
.nav,
.nav .nav-links {
  display: flex;
  align-items: center;
}
.nav {
  justify-content: space-between;
}
a {
  color: #fff;
  text-decoration: none;
}
.nav .logo {
	margin-left:-100px;
  position:relative;
  font-size: 32px;
  font-weight: 900;
}
.nav .nav-links {
	  font-size: 15px;
  column-gap: 20px;
  list-style: none;
}
.nav .nav-links a {
  transition: all 0.2s linear;
}
.nav.openSearch .nav-links a {
  opacity: 0;
  pointer-events: none;
}

.nav .navOpenBtn,
.nav .navCloseBtn {
  display: none;
}
     body {
     
  height: 100%;
  margin: 0px;
  min-height: 100vh;
  align-items: center;
  justify-content: center;
  background-image: linear-gradient(#650009,#000000) !important;
  font-family: "Poppins", sans-serif;
}


        form {
            color:#fff;
            max-width: 600px;
            margin: auto;
        }

        h1 {
             color:#fff;
            text-align: center;
        }
          /*footer*/
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins" , sans-serif;
}

footer{
  position: relative;
  background: #000;
  width: 100%;
  bottom: 0;
  left: 0;
  height:450px;
}


/*
There is a bug with this code, this code displays a gray color horizontal bar in the 
footer::before{
  content: '';
  position: absolute;
  left: 0;
  top: 100px;
  height: 50px;
  width: 100%;
  background: #AFAFB6;
}
*/

footer .content{
  max-width: 1250px;
  margin: auto;
  padding: 30px 40px 40px 40px;
}
footer .content .top{
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 50px;
}
.content .top .logo-details{
  color: #fff;
  font-size: 32px;
  font-weight:bold;
}
.content .top .media-icons{
  display: flex;
  padding-right:0px;
  margin-top:10px;
  margin-right:450px;
  position:relative;
  
}
.content .top .media-icons a{
  height: 40px;
  width: 40px;
  margin: 0 8px;
  border-radius: 50%;
  text-align: center;
  line-height: 40px;
  color: #fff;
  font-size: 17px;
  text-decoration: none;
  transition: all 0.4s ease;
  
}
.top .media-icons a:nth-child(1){
  background: #4267B2;

}
.top .media-icons a:nth-child(1):hover{
  color: #4267B2;
  background: #fff;
}
.top .media-icons a:nth-child(2){
  background: #1DA1F2;
}
.top .media-icons a:nth-child(2):hover{
  color: #1DA1F2;
  background: #fff;
}
.top .media-icons a:nth-child(3){
  background: #E1306C;
}
.top .media-icons a:nth-child(3):hover{
  color: #E1306C;
  background: #fff;
}
.top .media-icons a:nth-child(4){
  background: #0077B5;
}
.top .media-icons a:nth-child(4):hover{
  color: #0077B5;
  background: #fff;
}
.top .media-icons a:nth-child(5){
  background: #FF0000;
}
.top .media-icons a:nth-child(5):hover{
  color: #FF0000;
  background: #fff;
}
footer .content .link-boxes{
  width: 100%;
  display: flex;
  
}
footer .content .link-boxes .box{
  width: calc(100% / 5 - 10px);
}
       
       
       
    </style>
</head>
<body>

<nav class="nav">
      <i class="uil uil-bars navOpenBtn"></i>
      <a href="#" class="logo">Heara</a>

      <ul class="nav-links">
        <i class="uil uil-times navCloseBtn"></i>
         <li><a href="index.php">Home</a></li>
        <li><a href="../Theater/home.html">Packages</a></li>
        <li><a href="movies.php">Artists</a></li>
        <li><a href="#">Songs</a></li>
        <li><a href="../About_us/home.html">About Us</a></li>
      </ul>
    <a  class="button" href="loginFile.php">Login</a>
	  <a class="button" href="signupFile.php">Register</a>
	  
    </nav>
    <br><br>
<h1>Edit Feedback</h1>

<!-- Form for editing feedback -->
<form action="feedbacks?action=update&id=<%=feedback.getFeedbackId()%>" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="rId" value="<%= feedback.getFeedbackId() %>">

    <div class="form-group">
        <label for="rating1">Rating 1:</label>
        <input type="number" class="form-control" name="rating1" value="<%= feedback.getRating1() %>" required>
    </div>

    <div class="form-group">
        <label for="rating2">Rating 2:</label>
        <input type="number" class="form-control" name="rating2" value="<%= feedback.getRating2() %>" required>
    </div>

    <div class="form-group">
        <label for="rating3">Rating 3:</label>
        <input type="number" class="form-control" name="rating3" value="<%= feedback.getRating3() %>" required>
    </div>

    <div class="form-group">
        <label for="comment">Comment:</label>
        <textarea class="form-control" name="comment" required><%= feedback.getComment() %></textarea>
    </div>

    <div class="form-group">
        <label for="packageId">Package ID:</label>
        <select class="form-control" name="packageId" disabled>
            <% for (Package aPackage : packages) { %>
                <option value="<%= aPackage.getPackageId() %>" <%= (aPackage.getPackageId() == feedback.getPackageId()) ? "selected" : "" %>><%= aPackage.getPackageId() %></option>
            <% } %>
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Update Feedback</button>
</form>

<br>
<br>

<footer>
	
    <div class="content">
      <div class="top">
        <div class="logo-details">
          <i class="fab fa-slack"></i>
		  
		  
          <span class="logo_name">Heara</span>
        </div>
        <section class="media-icons" style="text-align:left;">
          <a href="#"><i class="fab fa-facebook-f"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-linkedin-in"></i></a>
          <a href="#"><i class="fab fa-youtube"></i></a>
        </section>
      </div>
      <div class="link-boxes">
        <ul class="box">
          <li class="link_name">Company</li>
          <li><a href="index.php">Home</a></li>
          <li><a href="#">Contact us</a></li>
          <li><a href="about.php">About us</a></li>
          <li><a href="#">Get started</a></li>
        </ul>
        <ul class="box">
          <li class="link_name">Services</li>
          <li><a href="viewAlbums.php">Buy a Package</a></li>
          <li><a href="index.php#background3">Search artist</a></li>
          <li><a href="#">Search songs</a></li>
          <li><a href="#">Others</a></li>
        </ul>
        
        <ul class="box input-box">
          <li class="link_name">Subscribe</li>
          <li><input type="text" placeholder="Enter your email"></li>
          <li><input type="button" value="Subscribe"></li>
        </ul>
      </div>
	  
    </div>
    <div class="bottom-details">
      <div class="bottom_text">
        <span class="copyright_text">Copyright &#169; 2023 <a href="#">Heara.</a>All rights reserved</span>
        <span class="policy_terms">
          <a href="#">Privacy policy</a>
          <a href="#">Terms & condition</a>
        </span>
      </div>
    </div>
	
	</footer>

</body>
</html>

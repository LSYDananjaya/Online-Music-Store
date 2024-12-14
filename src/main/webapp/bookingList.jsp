<%@ page import="java.util.List" %>
<%@ page import="models.Booking" %>
<%@ page import="models.Package" %>
<%@ page import="services.BookingService" %>
<%@ page import="services.PackageService" %>
<%
    PackageService pkg = new PackageService();
    List<Booking> bookings =(List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking List</title>
    <!-- Add your Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyO2BUbuKRcJNoN9vI82+cO+hXO1NQPD8X"
          crossorigin="anonymous">
    <style>
       
body {
  height: 100%;
  margin: 0px;
  min-height: 100vh;
  align-items: center;
  justify-content: center;
  background-image: linear-gradient(#650009,#000000) !important;
  font-family: "Poppins", sans-serif;
}

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

/* responsive */
@media screen and (max-width: 1160px) {
  .nav {
    padding: 15px 100px;
  }
  .nav .search-box {
    right: 150px;
  }
}
@media screen and (max-width: 950px) {
  .nav {
    padding: 15px 50px;
  }
  .nav .search-box {
    right: 100px;
    max-width: 400px;
  }
}
@media screen and (max-width: 768px) {
  .nav .navOpenBtn,
  .nav .navCloseBtn {
    display: block;
  }
  .nav {
    padding: 15px 20px;
  }

  
  .nav .nav-links {
    position: fixed;
    top: 0;
    left: -100%;
    height: 100%;
    max-width: 280px;
    width: 100%;
    padding-top: 100px;
    row-gap: 30px;
    flex-direction: column;
    background-color: #272952;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    transition: all 0.4s ease;
    z-index: 100;
  }
  .nav.openNav .nav-links {
    left: 0;
  }
  .nav .navOpenBtn {
    color: #fff;
    font-size: 20px;
    cursor: pointer;
  }
  .nav .navCloseBtn {
    position: absolute;
    top: 20px;
    right: 20px;
    color: #fff;
    font-size: 20px;
    cursor: pointer;
  }
  .nav .search-box {
    top: calc(100% + 10px);
    max-width: calc(100% - 20px);
    right: 50%;
    transform: translateX(50%);
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  }
}


  .nav a:hover{
	
  color: #650009;
}

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        /* styles.css */

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

/*logo12 customization*/

.logo12 {
            
            bottom: 20px;
            left: 20px;
            display: flex;
            align-items: center;
			
        }

        .logo12 img {
            width: 60px;
            margin-left: 90px;
			margin-bottom:-100px;
			position: absoulte;
        }

        @media screen and (max-width: 480px) {
            .logo12 {
                bottom: 10px;
                left: 10px;
            }
        }




.content .link-boxes .box .link_name{
  color: #fff;
  font-size: 18px;
  font-weight: 400;
  margin-bottom: 10px;
  position: relative;
}
.link-boxes .box .link_name::before{
  content: '';
  position: absolute;
  left: 0;
  bottom: -2px;
  height: 2px;
  width: 35px;
  background: #fff;
}
.content .link-boxes .box li{
  margin: 6px 0;
  list-style: none;
}
.content .link-boxes .box li a{
  color: #fff;
  font-size: 14px;
  font-weight: 400;
  text-decoration: none;
  opacity: 0.8;
  transition: all 0.4s ease
}
.content .link-boxes .box li a:hover{
  opacity: 1;
  text-decoration: underline;
}
.content .link-boxes .input-box{
  margin-right: 55px;
}
.link-boxes .input-box input{
  height: 40px;
  width: calc(100% + 55px);
  outline: none;
  border: 2px solid #AFAFB6;
  background: #690005;
  border-radius: 4px;
  padding: 0 15px;
  font-size: 15px;
  color: #fff;
  margin-top: 5px;
}
.link-boxes .input-box input::placeholder{
  color: #AFAFB6;
  font-size: 16px;
}
.link-boxes .input-box input[type="button"]{
  background: #fff;
  color: #140B5C;
  border: none;
  font-size: 18px;
  font-weight: 500;
  margin: 4px 0;
  opacity: 0.8;
  cursor: pointer;
  transition: all 0.4s ease;
}
.input-box input[type="button"]:hover{
  opacity: 1;
}
footer .bottom-details{
  width: 100%;
  margin-top:50px;
  background: #000000;
}
footer .bottom-details .bottom_text{
  max-width: 1250px;
  margin: auto;
  padding: 20px 40px;
  display: flex;
  justify-content: space-between;
}
.bottom-details .bottom_text span,
.bottom-details .bottom_text a{
  font-size: 14px;
  font-weight: 300;
  color: #fff;
  opacity: 0.8;
  text-decoration: none;
}
.bottom-details .bottom_text a:hover{
  opacity: 1;
  text-decoration: underline;
}
.bottom-details .bottom_text a{
  margin-right: 10px;
}
@media (max-width: 900px) {
  footer .content .link-boxes{
    flex-wrap: wrap;
  }
  footer .content .link-boxes .input-box{
    width: 40%;
    margin-top: 10px;
  }
}
@media (max-width: 700px){
  footer{
    position: relative;
  }
  .content .top .logo-details{
    font-size: 26px;
  }
  .content .top .media-icons a{
    height: 35px;
    width: 35px;
    font-size: 14px;
    line-height: 35px;
  }
  footer .content .link-boxes .box{
    width: calc(100% / 3 - 10px);
  }
  footer .content .link-boxes .input-box{
    width: 60%;
  }
  .bottom-details .bottom_text span,
  .bottom-details .bottom_text a{
    font-size: 12px;
  }
}
@media (max-width: 520px){
  footer::before{
    top: 145px;
  }
  footer .content .top{
    flex-direction: column;
  }
  .content .top .media-icons{
    margin-top: 16px;
  }
  footer .content .link-boxes .box{
    width: calc(100% / 2 - 10px);
  }
  footer .content .link-boxes .input-box{
    width: 100%;
  }
}

/*End of footer*/

.container {

    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-top: 20px;
}

h1 {
    color: #007bff;
}

.btn-primary {
    background-color: #007bff;
    border: 1px solid #007bff;
}

.btn-primary:hover {
    background-color: #0056b3;
    border: 1px solid #0056b3;
}

.table {
    width: 100%;
    margin-top: 20px;
    border-collapse: collapse;
    text-align: left;
}

.table th, .table td {
    padding: 12px;
    border-bottom: 1px solid #dee2e6;
}

.table th {
    background-color: #007bff;
    color: white;
}
.table tr {
    color: #fff;
   
}

.table tbody tr:hover {
    background-color: #000;
}
        
    </style>
</head>
<body>
 <nav class="nav">
        <i class="uil uil-bars navOpenBtn"></i>
        <a href="#" class="logo">Heara</a>
        <ul class="nav-links">
        <i class="uil uil-times navCloseBtn"></i>
         <li><a href="index.jsp">Home</a></li>
        <li><a href="getPackages">Packages</a></li>
        <li><a href="Artists.jsp">Artists</a></li>
        <li><a href="songs.jsp">Songs</a></li>
        <li><a href="#">About Us</a></li>
      </ul>
    
   
          <a class="button" href="#">Hello </a>
    </nav>
<div class="container">
    <h1 class="mt-4 mb-4">Booking List</h1>
	<a href="bookreserve.jsp">Add Booking</a>
    
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Booking ID</th>
            <th>Package Name</th>
            <th>Name</th>
            
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Booking booking : bookings) { 
        	int id =booking.getPackageId();
        	Package pakg = pkg.getPackageById(id);
        %>
        	
            <tr>
                <td><%= booking.getBookingId() %></td>
                
                <td><%= pakg.getPackageName() %></td>
                <td><%= booking.getCustomerName() %></td>
                <!-- Add more columns as needed -->
                <td>
                    <a href="bookings?action=edit&id=<%= booking.getBookingId() %>" class="btn btn-primary btn-sm">Edit</a>
                    <a href="bookings?action=delete&id=<%= booking.getBookingId() %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>

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


<!-- Add your Bootstrap JS and jQuery scripts here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-XrEUWmON8ZlVaCz9dILC7NjuEfnN6gngVrj4yzgF3HcqTQp0FqRIpswqLQlmh/jW"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyO2BUbuKRcJNoN9vI82+cO+hXO1NQPD8X"
        crossorigin="anonymous"></script>

</body>
</html>

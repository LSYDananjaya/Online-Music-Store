<%@ page import="models.Booking" %>
<%@ page import="services.PackageService" %>
<%@ page import="models.Package" %>
<%@ page import="services.BookingService" %>
<%@ page import="java.util.List" %>

<%
    Booking booking = (Booking) request.getAttribute("booking");
    List<Package> packages = (List<Package>) request.getAttribute("packages");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Booking</title>
    <!-- Custom Styles -->
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
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px auto;
            width: 70%;
        }

        form {
            width: 100%;
            margin: auto;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
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
          <a class="button" href="#">Hello </a>
    </nav>
<div class="container">
    <h1>Edit Booking</h1>

    <form method="POST" action="bookings?action=edit">
        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">

        <div>
            <label for="packageName">Package Name:</label>
            <select name="packageId">
                <% for (Package aPackage : packages) { %>
                    <option value="<%= aPackage.getPackageId() %>" <%= aPackage.getPackageId() == booking.getPackageId() ? "selected" : "" %>><%= aPackage.getPackageName() %></option>
                <% } %>
            </select>
        </div>

        <div>
            <label for="customerName">Customer Name:</label>
            <input type="text" name="customerName" value="<%= booking.getCustomerName() %>" required>
        </div>

        <div>
            <label for="contactNumber">Contact Number:</label>
            <input type="text" name="contactNumber" value="<%= booking.getContactNumber() %>" required>
        </div>

        <div>
            <label for="venueId">Venue:</label>
            <select name="venueId" required>
                <option value="1" <%= 1 == booking.getVenueId() ? "selected" : "" %>>Venue 1</option>
                <option value="2" <%= 2 == booking.getVenueId() ? "selected" : "" %>>Venue 2</option>
                <!-- Add more options as needed -->
            </select>
        </div>

        <button type="submit">Update Booking</button>
    </form>
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

</body>
</html>

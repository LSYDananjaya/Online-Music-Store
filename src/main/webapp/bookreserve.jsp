<%@ page import="java.util.List" %>
<%@ page import="models.Package" %>
<%@ page import="services.PackageService" %>

<%
    PackageService packageService = new PackageService();
    List<Package> packages = packageService.getAllPackages();
%>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Buy Package</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/packageStyle.css">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="swiper-bundle.min.css">
    <!-- Unicons CSS -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
    <script src="script.js" defer></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <script src="script.js" defer></script>
</head>
<body>
    <!--header------------>	
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
    <br>
    <div class="background1">
        <h1>Buy a new Package !</h1>
    </div>
    <section>
        <form method="POST" action="bookings?action=create">
    <div class="form-section phgFrm">
        <img src="photos/login/pic1.jpg" width="100px" height="100px" style="border-radius:50%">
        <div class="form-group">
            <label>Package Name:</label>
            <input type="hidden" name="phgID" value="photographerId" readonly>
            <select name="packageId" onchange="updatePrice(this);">
                <option value="" disabled selected>Select Package</option>
                <% for (Package aPackage : packages) { %>
                    <option value="<%= aPackage.getPackageId() %>" data-price="<%= aPackage.getPackagePrice() %>"><%= aPackage.getPackageName() %></option>
                <% } %>
            </select>
        </div>
        <div class="form-group">
            <label>Fee:</label>
            <input type="text" name="phgFee" id="phgFee" readonly>
        </div>
    </div>
    <div class="form-section" style="border-left: 1px solid; padding-left: 20px; margin-left: 20px;">
        <div class="form-group">
            <label>Your Name:</label>
            <input type="text" name="name" placeholder="YourName">
        </div>
        <div class="form-group">
            <label>Contact No:</label>
            <input type="text" name="pno" placeholder="YourMobile">
        </div>
        <div class="form-group">
            <label>Time Period:</label>
            <select name="venueId" required>
                <option value="1"> 1 month</option>
                <option value="2">3 months</option>
                <!-- Add more options as needed -->
            </select>
        </div>
        <div class="form-group"></div>
        <div class="form-group">
            <input type="submit" value="Buy Package">
        </div>
    </div>
</form>


        
    </section>
    <!--footer------------>	
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

    <script>
        function updatePrice(select) {
            var selectedOption = select.options[select.selectedIndex];
            var price = selectedOption.getAttribute("data-price");
            document.getElementById("phgFee").value = price;
        }
    </script>

</body>
</html>

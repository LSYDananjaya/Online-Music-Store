
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home Page</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/indexStyle.css" />
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
        <li><a href="bookreserve.jsp">Packages</a></li>
        <li><a href="Artists.jsp">Artists</a></li>
        <li><a href="songs.jsp">Songs</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
      </ul>
    
	  <a class="button" href="<%= request.getContextPath() %>/profile">Profile</a>
	  
    </nav>
      
<br><br>
		<div class="wrapper">
     
      <div class="carousel">
        <img src="photos/artists/pic1.jpg" alt="img" draggable="true">
        <img src="photos/artists/pic2.jpg" alt="img" draggable="true">
        <img src="photos/artists/pic3.jpg" alt="img" draggable="true">
        <img src="photos/artists/pic4.jpg" alt="img" draggable="true">
        <img src="photos/artists/pic5.jpg" alt="img" draggable="true">
        
     </div>
	<br><br><div><hr></div><br><br>
</div>
	
<!--package cards-------------------------->
	
	<div class="content">
      <div class="card one">
        <div class="top">
          <div class="title">Basic</div>
          <div class="price-sec">
            <span class="dollar">Rs</span>
            <span class="price">589</span>
            <span class="decimal">.99</span>
          </div>
        </div>
        <div class="info">Limited features you will get on this package or plan</div>
        <div class="details">
          <div class="one">
            <span>New Released songs</span>
            <i class="fas fa-check"></i>
          </div>
          <div class="one">
            <span>5GB cloud Storage</span>
            <i class="fas fa-check"></i>
          </div>
          <div class="one">
            <span>Adds Free</span>
            <i class="fas fa-times"></i>
          </div>
          <div class="one">
            <span>Unlimited play hours per day </span>
            <i class="fas fa-times"></i>
          </div>
          <button>Purchase</button>
        </div>
      </div>
      <div class="card two">
        <div class="top">
          <div class="title">Extended</div>
          <div class="price-sec">
            <span class="dollar">Rs</span>
            <span class="price">1179</span>
            <span class="decimal">.99</span>
          </div>
        </div>
        <div class="info">Only some features you will get on this package or plan</div>
        <div class="details">
          <div class="one">
            <span>New Released songs</span>
            <i class="fas fa-check"></i>
          </div>
          <div class="one">
            <span>10GB cloud Storage</span>
            <i class="fas fa-check"></i>
          </div>
          <div class="one">
            <span>Adds Free</span>
            <i class="fas fa-check"></i>
          </div>
          <div class="one">
            <span>Unlimited play hours per day </span>
            <i class="fas fa-times"></i>
          </div>
          <button>Purchase</button>
        </div>
      </div>
      <div class="card three">
        <div class="top">
          <div class="title">Premium</div>
          <div class="price-sec">
            <span class="dollar">Rs</span>
            <span class="price">3214</span>
            <span class="decimal">.99</span>
          </div>
        </div>
        <div class="info">All features you will get on this package or plan</div>
        <div class="details">
          <div class="one">
           <span>New Released songs</span>
            <i class="fas fa-check"></i>
          </div>
          <div class="one">
            <span>15GB cloud Storage</span>
            <i class="fas fa-check"></i>
          </div>
          <div class="one">
            <span>Adds Free</span>
            <i class="fas fa-check"></i>
          </div>
          <div class="one">
            <span>Unlimited play hours per day </span>
            <i class="fas fa-check"></i>
          </div>
          <button>Purchase</button>
        </div>
      </div>
    </div>

	<br><br>
	<br><br>
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
  </body>
</html>

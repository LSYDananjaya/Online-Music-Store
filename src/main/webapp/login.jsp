<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login | Movie</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/loginStyle.css" />
    <!-- Unicons CSS -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
    <script src="script.js" defer></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  
	
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
    
    <a  class="button" href="login.jsp">Login</a>
	  <a class="button" href="register.jsp">Register</a>
	  
    </nav>
	
	





	
	
	<!--form-->
	
	<div class="wrapper">
        <header>Login Form</header>
        <form action="LoginServlet" method="POST">
            <div class="field email">
                <div class="input-area">
                    <input type="email" placeholder="Email Address" name="email">
                    <i class="icon fas fa-envelope"></i>
                    <i class="error error-icon fas fa-exclamation-circle"></i>
                </div>
                <div class="error error-txt">Email can't be blank</div>
            </div>
            <div class="field password">
                <div class="input-area">
                    <input type="password" placeholder="Password" name="password">
                    <i class="icon fas fa-lock"></i>
                    <i class="error error-icon fas fa-exclamation-circle"></i>
                </div>
                <div class="error error-txt">Password can't be blank</div>
            </div>
       
            <input type="submit" value="Login"><br>
        </form>
        <div class="sign-txt">Still don't have an account?</div>
        <button class="sign"><a href="register.jsp">Sign Up</button><br>
        <a href="#">Terms & Conditions  |  Privacy</a>
    </div>
      
 
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

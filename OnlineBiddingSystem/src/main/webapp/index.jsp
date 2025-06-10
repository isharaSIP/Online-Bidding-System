<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Online Bidding System</title>
  <script src="https://cdn.tailwindcss.com"></script>
 
  <link rel="stylesheet" href="styles/animations.css">
</head>
<body class="bg-gray-100 text-gray-800">

	<!-- Navbar -->
	<header class="bg-gray-200 shadow">
	  <div class="container mx-auto px-4 py-4 flex flex-wrap justify-between items-center">
	
	    <!-- Business Name -->
	    <div class="w-full md:w-1/3 flex justify-center md:justify-start">
	      <h1 class="text-xl md:text-2xl font-bold text-red-600">BidZone.lk</h1>
	    </div>
	
	    <!-- Center: Nav Items -->
	    <nav class="w-full md:w-1/3 flex justify-center space-x-4 text-sm md:text-base mt-2 md:mt-0">
	
	      <a href="index.jsp" class="hover:text-blue-500">Home</a>
	
	      <!-- Register Dropdown -->
	      <div class="relative inline-block text-left">
	        <button onclick="toggleDropdown()" class="inline-flex items-center hover:text-blue-500 focus:outline-none">
	          Register
	          <svg class="ml-1 w-4 h-4 fill-current text-gray-600" viewBox="0 0 20 20">
	            <path d="M5.25 7.5L10 12.25L14.75 7.5H5.25Z" />
	          </svg>
	        </button>
	        <div id="dropdownMenu" class="hidden absolute z-10 mt-2 bg-white border border-gray-200 rounded shadow-lg w-40">
	          <a href="registerSeller.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Register as Seller</a>
	          <a href="buyerRegister.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Register as Bidder</a>
	        </div>
	      </div>
	
	      <!-- Login Dropdown -->
	      <div class="relative inline-block text-left">
	        <button onclick="toggleLoginDropdown()" class="inline-flex items-center hover:text-red-500 focus:outline-none">
	          Login
	          <svg class="ml-1 w-4 h-4 fill-current text-gray-600" viewBox="0 0 20 20">
	            <path d="M5.25 7.5L10 12.25L14.75 7.5H5.25Z" />
	          </svg>
	        </button>
	        <div id="loginDropdownMenu" class="hidden absolute z-10 mt-2 bg-white border border-gray-200 rounded shadow-lg w-40">
	          <a href="buyerlogin.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Login as Bidder</a>
	          <a href="sellerlogin.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Login as Seller</a>
	          <a href="adminLogin.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Login as Admin</a>
	        </div>
	      </div>
	      <a href="about.jsp" class="hover:text-blue-500">About Us</a>
	    </nav>
	    </div>
	</header>

<br>

    <!-- Hero Section with Image Slider -->
	<section class="relative h-96 overflow-hidden">
	    <div class="relative w-full h-full">
	        <div id="slider" class="w-full h-full">
	            <!-- Slide 1 -->
	            <div class="absolute inset-0 bg-cover bg-center transition-opacity duration-1000" style="background-image: url('images/7.jpg');"></div>
	            <!-- Slide 2 -->
	            <div class="absolute inset-0 bg-cover bg-center transition-opacity duration-1000 opacity-0" style="background-image: url('images/6.jpg');"></div>
	            <!-- Slide 3 -->
	            <div class="absolute inset-0 bg-cover bg-center transition-opacity duration-1000 opacity-0" style="background-image: url('images/8.jpg');"></div>
	        </div>
	        <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center text-center text-white">
	            <div>
	                <h2 class="text-4xl font-bold mb-4">Bid on What You Love</h2>
	                <p class="text-lg mb-6">Find amazing deals on unique items every day.</p>
	                <a href="buyerlogin.jsp">
					<button class="mt-4 px-6 py-2 bg-red-600 hover:bg-red-700 rounded-full text-white font-medium transition-colors duration-300 animate-pulse">Start Bidding Now</button>
			  		</a>
	            </div>
	        </div>
	    </div>
	</section>

	<!-- Summary Statistics Section -->
	<section class="py-16 px-4 bg-white">
	  <div class="container mx-auto text-center">
	    <h3 class="text-2xl md:text-3xl font-bold text-red-600 mb-8">Why Choose BidZone?</h3>
	    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
	      
	      <!-- First Stat Card -->
	      <div class="bg-gray-200 p-6 rounded-lg shadow-md text-center transition-all duration-300 hover:shadow-xl hover:-translate-y-2 hover:bg-blue-100 group">
	        <!-- Image -->
	        <div class="w-24 h-24 rounded-full overflow-hidden mx-auto mb-4">
	          <img src="images/cart.png" alt="Items Sold" class="w-full h-full object-cover">
	        </div>
	        <h4 class="text-3xl font-bold text-blue-600 mb-2 group-hover:text-blue-700 transition-colors duration-300">
	          <span id="count1">0</span>+
	        </h4>
	        <p class="text-gray-700 mt-2 group-hover:text-gray-900 transition-colors duration-300">Items Being Sold</p>
	        <div class="mt-4 h-1 w-16 bg-blue-200 mx-auto group-hover:w-24 group-hover:bg-blue-400 transition-all duration-500"></div>
	      </div>
	
	      <!-- Second Stat Card -->
	      <div class="bg-gray-200 p-6 rounded-lg shadow-md text-center transition-all duration-300 hover:shadow-xl hover:-translate-y-2 hover:bg-green-100 group">
	        <!-- Image -->
	        <div class="w-24 h-24 rounded-full overflow-hidden mx-auto mb-4">
	          <img src="images/seller.png" alt="Trusted Sellers" class="w-full h-full object-cover">
	        </div>
	        <h4 class="text-3xl font-bold text-green-600 mb-2 group-hover:text-green-700 transition-colors duration-300">
	          <span id="count2">0</span>+
	        </h4>
	        <p class="text-gray-700 mt-2 group-hover:text-gray-900 transition-colors duration-300">Trusted Sellers</p>
	        <div class="mt-4 h-1 w-16 bg-green-200 mx-auto group-hover:w-24 group-hover:bg-green-400 transition-all duration-500"></div>
	      </div>
	
	      <!-- Third Stat Card -->
	      <div class="bg-gray-200 p-6 rounded-lg shadow-md text-center transition-all duration-300 hover:shadow-xl hover:-translate-y-2 hover:bg-purple-100 group">
	        <!-- Image -->
	        <div class="w-24 h-24 rounded-full overflow-hidden mx-auto mb-4">
	          <img src="images/buyer.png" alt="Registered Buyers" class="w-full h-full object-cover">
	        </div>
	        <h4 class="text-3xl font-bold text-purple-600 mb-2 group-hover:text-purple-700 transition-colors duration-300">
	          <span id="count3">0</span>+
	        </h4>
	        <p class="text-gray-700 mt-2 group-hover:text-gray-900 transition-colors duration-300">Registered Buyers</p>
	        <div class="mt-4 h-1 w-16 bg-purple-200 mx-auto group-hover:w-24 group-hover:bg-purple-400 transition-all duration-500"></div>
	      </div>
	
	    </div>
	  </div>
	</section>

  <!-- Footer -->
	<footer class="bg-gray-900 text-gray-300 mt-12">
	  <div class="container mx-auto px-6 py-10 grid grid-cols-1 md:grid-cols-4 gap-8">
	    
	    <!-- Branding -->
	    <div>
	      <h3 class="text-xl font-bold text-white mb-4">BidZone.lk</h3>
	      <p>Your trusted online auction platform.</p>
	    </div>
	
	    <!-- Quick Links -->
	    <div>
	      <h4 class="text-lg font-semibold mb-3">Quick Links</h4>
	      <ul class="space-y-2 text-sm">
	        <li><a href="#" class="hover:underline">Home</a></li>
	        <li><a href="#auctions" class="hover:underline">Auctions</a></li>
	        <li><a href="registerSeller.jsp" class="hover:underline">Register as Seller</a></li>
	        <li><a href="register_buyer.jsp" class="hover:underline">Register as Buyer</a></li>
	      </ul>
	    </div>
	
	    <!-- Support -->
	    <div>
	      <h4 class="text-lg font-semibold mb-3">Support</h4>
	      <ul class="space-y-2 text-sm">
	        <li><a href="about.jsp" class="hover:underline">About Us</a></li>
	        <li><a href="#" class="hover:underline">FAQs</a></li>
	        <li><a href="#" class="hover:underline">Help Center</a></li>
	        <li><a href="#" class="hover:underline">Terms & Conditions</a></li>
	      </ul>
	    </div>
	
	    <!-- Social -->
	    <div>
	      <h4 class="text-lg font-semibold mb-3">Follow Us</h4>
	      <div class="flex space-x-4">
	        <a href="#" aria-label="Facebook" class="hover:text-white">
	          <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24"><path d="M22 12.07C22 6.486 17.514 2 12 2S2 6.486 2 12.07c0 4.991 3.657 9.128 8.438 9.878v-6.988H7.897v-2.89h2.541V9.845c0-2.507 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.462h-1.26c-1.243 0-1.63.772-1.63 1.562v1.877h2.773l-.443 2.89h-2.33v6.988C18.343 21.198 22 17.061 22 12.07z"/></svg>
	        </a>
	        <a href="#" aria-label="Twitter" class="hover:text-white">
	          <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24"><path d="M22.46 6c-.77.35-1.6.58-2.46.69a4.301 4.301 0 001.88-2.38 8.59 8.59 0 01-2.73 1.04 4.27 4.27 0 00-7.26 3.9A12.1 12.1 0 013 5.19a4.26 4.26 0 001.32 5.69 4.23 4.23 0 01-1.93-.54v.05a4.28 4.28 0 003.42 4.19 4.29 4.29 0 01-1.93.07 4.28 4.28 0 004 2.97A8.57 8.57 0 012 19.54a12.09 12.09 0 006.56 1.92c7.88 0 12.2-6.53 12.2-12.2 0-.19-.01-.37-.02-.55A8.64 8.64 0 0024 5.2a8.56 8.56 0 01-2.54.7z"/></svg>
	        </a>
	        <a href="#" aria-label="Instagram" class="hover:text-white">
	          <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24"><path d="M7.75 2h8.5A5.76 5.76 0 0122 7.75v8.5A5.76 5.76 0 0116.25 22h-8.5A5.76 5.76 0 012 16.25v-8.5A5.76 5.76 0 017.75 2zm0 1.5A4.25 4.25 0 003.5 7.75v8.5A4.25 4.25 0 007.75 20.5h8.5A4.25 4.25 0 0020.5 16.25v-8.5A4.25 4.25 0 0016.25 3.5h-8.5zm4.25 3.25a5.5 5.5 0 110 11 5.5 5.5 0 010-11zm0 1.5a4 4 0 100 8 4 4 0 000-8zm5.75-.75a1 1 0 110 2 1 1 0 010-2z"/></svg>
	        </a>
	      </div>
	    </div>
	  </div>
	
	  <div class="bg-gray-800 text-center py-4 text-sm text-gray-400">
	    &copy; 2025 BidZone.lk. All rights reserved.
	  </div>
	</footer>
  

  <!-- Scripts -->
  <script>
    function placeBid(itemName) {
      alert('You have placed a bid on ' + itemName + '!');
    }

    function toggleDropdown() {
      const dropdown = document.getElementById('dropdownMenu');
      dropdown.classList.toggle('hidden');
    }

    function toggleLoginDropdown() {
      const dropdown = document.getElementById('loginDropdownMenu');
      dropdown.classList.toggle('hidden');
    }

    window.addEventListener('click', function(e) {
      const regBtn = document.querySelector('button[onclick="toggleDropdown()"]');
      const regMenu = document.getElementById('dropdownMenu');
      if (regBtn && !regBtn.contains(e.target) && !regMenu.contains(e.target)) {
        regMenu.classList.add('hidden');
      }

      const loginBtn = document.querySelector('button[onclick="toggleLoginDropdown()"]');
      const loginMenu = document.getElementById('loginDropdownMenu');
      if (loginBtn && !loginBtn.contains(e.target) && !loginMenu.contains(e.target)) {
        loginMenu.classList.add('hidden');
      }
    });
    
 	// Function to animate counting
    function animateCount(id, target, duration = 2000) {
        const element = document.getElementById(id);
        const start = 0;
        const increment = target / (duration / 16); // 60fps
        
        let current = start;
        const timer = setInterval(() => {
          current += increment;
          if (current >= target) {
            clearInterval(timer);
            current = target;
          }
          element.textContent = Math.floor(current).toLocaleString();
        }, 16);
      }

      // Start counting when page loads
      window.addEventListener('load', () => {
        animateCount('count1', 200000, 1000);
        animateCount('count2', 2000, 1000);
        animateCount('count3', 10000, 1000);
      });
      
      //Scripts for Slider
      let currentSlide = 0;
      const slides = document.querySelectorAll('#slider > div');
      const totalSlides = slides.length;

      function changeSlide() {
          // Hide the current slide
          slides[currentSlide].classList.add('opacity-0');
          slides[currentSlide].classList.remove('opacity-100');

          // Move to the next slide, and loop back to the first one
          currentSlide = (currentSlide + 1) % totalSlides;

          // Show the next slide
          slides[currentSlide].classList.add('opacity-100');
          slides[currentSlide].classList.remove('opacity-0');
      }

      // Change the slide every 5 seconds
      setInterval(changeSlide, 4000);

      // Show the first slide initially
      slides[currentSlide].classList.add('opacity-100');
  </script>
  
</body>
</html>

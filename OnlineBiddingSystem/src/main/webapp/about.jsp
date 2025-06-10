<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>About Us - BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

<!-- Navbar -->
<header class="bg-[#d9d9d9] shadow">
  <div class="container mx-auto px-4 py-4 flex flex-wrap justify-between items-center">

    <!-- Left: Logo -->
    <div class="w-full md:w-1/3 flex justify-center md:justify-start">
      <h1 class="text-xl md:text-2xl font-bold text-red-600">BidZone.lk</h1>
    </div>

    <!-- Center: Nav Items -->
    <nav class="w-full md:w-1/3 flex justify-center space-x-4 text-sm md:text-base mt-2 md:mt-0">

      <a href="index.jsp" class="hover:text-blue-500">Home</a>
      <a href="about.jsp" class="hover:text-blue-500">About Us</a>

      <!-- Register Dropdown (Hover) -->
      <div class="relative group inline-block text-left">
        <button class="inline-flex items-center hover:text-blue-500 focus:outline-none">
          Register
        </button>
        <div class="absolute z-10 mt-2 bg-white border border-gray-200 rounded shadow-lg w-40 hidden group-hover:block">
          <a href="registerSeller.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Register as Seller</a>
          <a href="register_buyer.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Register as Bidder</a>
        </div>
      </div>

      <!-- Login Dropdown (Hover) -->
      <div class="relative group inline-block text-left">
        <button class="inline-flex items-center hover:text-red-500 focus:outline-none">
          Login
        </button>
        <div class="absolute z-10 mt-2 bg-white border border-gray-200 rounded shadow-lg w-40 hidden group-hover:block">
          <a href="userlogin.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Login as Bidder</a>
          <a href="sellerlogin.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Login as Seller</a>
          <a href="adminLogin.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Login as Admin</a>
        </div>
      </div>

    </nav>
  </div>
</header>



  <!-- About Us Section -->
	<section class="py-16 px-6 bg-white">
	  <div class="container mx-auto text-center">
	    <h2 class="text-3xl font-bold text-red-600 mb-6">Your Trusted Online Auction Platform</h2>
	    <div class="grid grid-cols-1 md:grid-cols-2 gap-12">
	      
	      <!-- Mission Section -->
	      <div class="text-gray-700 transition-all duration-300 hover:bg-red-50 p-6 rounded-lg shadow-lg hover:shadow-2xl hover:-translate-y-2">
	        <h3 class="text-xl font-semibold mb-4 transition-colors duration-300 hover:text-red-600">Our Mission</h3>
	        <p class="mb-4">
	          At BidZone.lk, our mission is to provide a secure and reliable platform for buyers and sellers to engage in online auctions. We aim to bring people together to discover unique products, items, and experiences through our innovative online marketplace. We are dedicated to delivering transparency, trust, and an unmatched customer experience.
	        </p>
	      </div>
	      
	      <!-- Vision Section -->
	      <div class="text-gray-700 transition-all duration-300 hover:bg-red-50 p-6 rounded-lg shadow-lg hover:shadow-2xl hover:-translate-y-2">
	        <h3 class="text-xl font-semibold mb-4 transition-colors duration-300 hover:text-red-600">Our Vision</h3>
	        <p class="mb-4">
	          We envision BidZone.lk as the leading online auction platform in Sri Lanka, empowering individuals and businesses to buy and sell with ease. Our goal is to offer a seamless auction experience, continuously improving our platform to meet the evolving needs of our users.
	        </p>
	      </div>
	
	    </div>
	  </div>
	</section>
  

  <!-- Team Section -->
	<section class="bg-gray-50 py-16 px-6">
	  <div class="container mx-auto text-center">
	    <h2 class="text-3xl font-bold text-red-600 mb-6">Meet Our Team</h2>
	    <p class="text-lg text-gray-700 mb-4">A group of passionate individuals committed to transforming the auction industry.</p>
	    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-12">
	      
	      <!-- Team Member 1 -->
	      <div class="bg-white p-6 rounded-lg shadow-lg transition-all duration-300 hover:shadow-2xl hover:scale-105 hover:bg-red-50">
	        <img src="images/ceo.png" alt="Team Member 1" class="w-32 h-32 object-cover rounded-full mb-4 mx-auto transition-all duration-300 hover:scale-110">
	        <h4 class="text-xl font-semibold text-gray-800">Mr. Sheron Pathum</h4>
	        <p class="text-gray-600">Founder</p>
	      </div>
	
	      <!-- Team Member 2 -->
	      <div class="bg-white p-6 rounded-lg shadow-lg transition-all duration-300 hover:shadow-2xl hover:scale-105 hover:bg-red-50">
	        <img src="images/coCeo.png" alt="Team Member 2" class="w-32 h-32 object-cover rounded-full mb-4 mx-auto transition-all duration-300 hover:scale-110">
	        <h4 class="text-xl font-semibold text-gray-800">Mr. Lahiru De Silva</h4>
	        <p class="text-gray-600">Co-Founder</p>
	      </div>
	
	      <!-- Team Member 3 -->
	      <div class="bg-white p-6 rounded-lg shadow-lg transition-all duration-300 hover:shadow-2xl hover:scale-105 hover:bg-red-50">
	        <img src="images/director.png" alt="Team Member 3" class="w-32 h-32 object-cover rounded-full mb-4 mx-auto transition-all duration-300 hover:scale-110">
	        <h4 class="text-xl font-semibold text-gray-800">Mr. Rayan Fernando</h4>
	        <p class="text-gray-600">Marketing Director</p>
	      </div>
	
	    </div>
	  </div>
	</section>
  
  

  <!-- Footer -->
  <footer class="bg-[#d9d9d9] shadow mt-12">
    <div class="container mx-auto px-4 py-6 text-center text-sm text-gray-500">
      &copy; 2025 BidZone.lk - All rights reserved.
    </div>
  </footer>
  


</body>
</html>

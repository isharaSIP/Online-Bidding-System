<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Seller Registration - BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

 <!-- Navbar -->
	<header class="bg-white shadow">
	  <div class="container mx-auto px-4 py-4 flex flex-wrap justify-between items-center">
	
	    <!-- Left: Logo -->
	    <div class="w-full md:w-1/3 flex justify-center md:justify-start">
	      <h1 class="text-xl md:text-2xl font-bold text-red-600">BidZone.lk</h1>
	    </div>
	
	    <!-- Center: Nav Items -->
	    <nav class="w-full md:w-1/3 flex justify-center space-x-4 text-sm md:text-base mt-2 md:mt-0">
	
	      <a href="index.jsp" class="hover:text-blue-500">Home</a>
	      <a href="about.jsp" class="hover:text-blue-500">About Us</a>
	
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
	          <a href="register_buyer.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Register as Bidder</a>
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
	          <a href="login_buyer.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Login as Bidder</a>
	          <a href="sellerlogin.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Login as Seller</a>
	          <a href="adminLogin.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Login as Admin</a>
	        </div>
	      </div>
	
	    </nav>
	  </div>
	</header>

  <!-- Registration Section with Image and Form -->
  <div class="max-w-6xl mx-auto mt-10 bg-white rounded shadow grid grid-cols-1 md:grid-cols-2 overflow-hidden">
    
    <!-- Left Side: Image with Animation -->
    <div class="hidden md:block transform transition-all duration-1000 hover:scale-105">
      <img src="images/sellerReg.jpg" alt="Seller Illustration" class="w-full h-full object-cover rounded-l opacity-90 hover:opacity-100"/>
    </div>

    <!-- Right Side: Form -->
    <div class="p-8">
      <h2 class="text-2xl font-bold mb-6 text-center text-red-600">Seller Registration</h2>

      <!-- Error Message -->
      <div id="error-msg" class="hidden mb-4 text-sm text-red-600 bg-red-100 px-4 py-2 rounded"></div>

      <form id="sellerForm" action="SellerInsertServlet" method="post" class="space-y-4" onsubmit="return validateForm()">
      <input type="hidden" name="source" value="public">

        <div>
          <label for="name" class="block text-sm font-medium">Name</label>
          <input type="text" id="name" name="name" required class="mt-1 w-full px-4 py-2 border rounded" />
        </div>

        <div>
          <label for="nic" class="block text-sm font-medium">NIC</label>
          <input type="text" id="nic" name="nic" required class="mt-1 w-full px-4 py-2 border rounded" />
        </div>
        
        <!-- Province -->
		<div>
		  <label for="province" class="block text-sm font-medium">Province</label>
		  <select id="province" name="province" required onchange="updateDistricts()" class="mt-1 w-full px-4 py-2 border rounded">
		    <option value="">Select Province</option>
		    <option value="Western">Western</option>
		    <option value="Central">Central</option>
		    <option value="Southern">Southern</option>
		    <option value="Northern">Northern</option>
		    <option value="Eastern">Eastern</option>
		    <option value="North Western">North Western</option>
		    <option value="North Central">North Central</option>
		    <option value="Uva">Uva</option>
		    <option value="Sabaragamuwa">Sabaragamuwa</option>
		  </select>
		</div>

		<!-- District -->
		<div>
		  <label for="district" class="block text-sm font-medium">District</label>
		  <select id="district" name="district" required class="mt-1 w-full px-4 py-2 border rounded">
		    <option value="">Select District</option>
		  </select>
		</div>

        <div>
          <label for="mobile" class="block text-sm font-medium">Mobile No</label>
          <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" required class="mt-1 w-full px-4 py-2 border rounded" />
        </div>

        <div>
          <label for="email" class="block text-sm font-medium">Email</label>
          <input type="email" id="email" name="email" required class="mt-1 w-full px-4 py-2 border rounded" />
        </div>

        <div>
          <label for="password" class="block text-sm font-medium">Password</label>
          <input type="password" id="password" name="password" required class="mt-1 w-full px-4 py-2 border rounded" />
        </div>

        <div>
          <label for="repassword" class="block text-sm font-medium">Re-Enter Password</label>
          <input type="password" id="repassword" name="repassword" required class="mt-1 w-full px-4 py-2 border rounded" />
        </div>

        <div class="flex justify-center space-x-4">
		  <!-- Back button -->
		  <a href="index.jsp" class="bg-gray-300 text-gray-800 px-6 py-2 rounded hover:bg-gray-400">Back</a>
		
		  <!-- Register button -->
		  <button type="submit" class="bg-red-600 text-white px-6 py-2 rounded hover:bg-red-700">Register</button>
		</div>
        
      </form>
    </div>
  </div>
  
    <!-- Footer -->
  <footer class="bg-white shadow mt-12">
    <div class="container mx-auto px-4 py-6 text-center text-sm text-gray-500">
      &copy; 2025 BidZone.lk - All rights reserved.
    </div>
  </footer>

  <script>
  	//JavaScript Validation
    function validateForm() {
      const password = document.getElementById("password").value;
      const repassword = document.getElementById("repassword").value;
      const errorMsg = document.getElementById("error-msg");

      if (password !== repassword) {
        errorMsg.textContent = "Passwords do not match!";
        errorMsg.classList.remove("hidden");
        return false; // Prevent form submission
      }

      // Hide error if validation passes
      errorMsg.classList.add("hidden");
      return true;
    }
  	
    const districtsByProvince = {
    	    "Western": ["Colombo", "Gampaha", "Kalutara"],
    	    "Central": ["Kandy", "Matale", "Nuwara Eliya"],
    	    "Southern": ["Galle", "Matara", "Hambantota"],
    	    "Northern": ["Jaffna", "Kilinochchi", "Mannar", "Vavuniya", "Mullaitivu"],
    	    "Eastern": ["Trincomalee", "Batticaloa", "Ampara"],
    	    "North Western": ["Kurunegala", "Puttalam"],
    	    "North Central": ["Anuradhapura", "Polonnaruwa"],
    	    "Uva": ["Badulla", "Moneragala"],
    	    "Sabaragamuwa": ["Ratnapura", "Kegalle"]
    	  };

    	  function updateDistricts() {
    	    const province = document.getElementById("province").value;
    	    const districtSelect = document.getElementById("district");

    	    // Clear current districts
    	    districtSelect.innerHTML = '<option value="">Select District</option>';

    	    if (province && districtsByProvince[province]) {
    	      districtsByProvince[province].forEach(district => {
    	        const option = document.createElement("option");
    	        option.value = district;
    	        option.textContent = district;
    	        districtSelect.appendChild(option);
    	      });
    	    }
    	  }
    	  
    	  function toggleDropdown() {
    		    const dropdown = document.getElementById('dropdownMenu');
    		    dropdown.classList.toggle('hidden');
    		  }

    		  // Optional: Close dropdown if clicked outside
    		  window.addEventListener('click', function(e) {
    		    const btn = document.querySelector('button[onclick="toggleDropdown()"]');
    		    const menu = document.getElementById('dropdownMenu');
    		    if (!btn.contains(e.target) && !menu.contains(e.target)) {
    		      menu.classList.add('hidden');
    		    }
    		  });
    		  
		function toggleLoginDropdown() {
			const dropdown = document.getElementById('loginDropdownMenu');
			dropdown.classList.toggle('hidden');
    	}

		window.addEventListener('click', function(e) {
			const loginBtn = document.querySelector('button[onclick="toggleLoginDropdown()"]');
			const loginMenu = document.getElementById('loginDropdownMenu');
			if (!loginBtn.contains(e.target) && !loginMenu.contains(e.target)) {
				loginMenu.classList.add('hidden');
    		}
    	});
  </script>
  
</body>
</html>

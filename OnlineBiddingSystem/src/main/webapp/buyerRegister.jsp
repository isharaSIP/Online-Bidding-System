<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Buyer Registration - BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

  <!-- Navbar (reused structure) -->
  <header class="bg-white shadow">
    <div class="container mx-auto px-4 py-4 flex flex-wrap justify-between items-center">
      <div class="w-full md:w-1/3 flex justify-center md:justify-start">
        <h1 class="text-xl md:text-2xl font-bold text-red-600">BidZone.lk</h1>
      </div>
      <nav class="w-full md:w-1/3 flex justify-center space-x-4 text-sm md:text-base mt-2 md:mt-0">
        <a href="index.jsp" class="hover:text-blue-500">Home</a>
        <a href="about.jsp" class="hover:text-blue-500">About Us</a>
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

  <!-- Registration Form Section -->
  <div class="max-w-xl mx-auto mt-10 bg-white rounded shadow p-8">
    <h2 class="text-2xl font-bold mb-6 text-center text-red-600">Buyer Registration</h2>

    <!-- Error Message -->
    <div id="error-msg" class="hidden mb-4 text-sm text-red-600 bg-red-100 px-4 py-2 rounded"></div>

    <form action="buyerRegisterServelt" method="post" class="space-y-4" onsubmit="return validateForm()">
      <div>
        <label for="name" class="block text-sm font-medium">Name</label>
        <input type="text" id="name" name="name" required class="mt-1 w-full px-4 py-2 border rounded" />
      </div>
      <div>
        <label for="nic" class="block text-sm font-medium">NIC</label>
        <input type="text" id="nic" name="nic" required class="mt-1 w-full px-4 py-2 border rounded" />
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
        <a href="index.jsp" class="bg-gray-300 text-gray-800 px-6 py-2 rounded hover:bg-gray-400">Back</a>
        <button type="submit" class="bg-red-600 text-white px-6 py-2 rounded hover:bg-red-700">Register</button>
      </div>
    </form>
  </div>

  <!-- Footer -->
  <footer class="bg-white shadow mt-12">
    <div class="container mx-auto px-4 py-6 text-center text-sm text-gray-500">
      &copy; 2025 BidZone.lk - All rights reserved.
    </div>
  </footer>

  <script>
    function validateForm() {
      const password = document.getElementById("password").value;
      const repassword = document.getElementById("repassword").value;
      const errorMsg = document.getElementById("error-msg");

      if (password !== repassword) {
        errorMsg.textContent = "Passwords do not match!";
        errorMsg.classList.remove("hidden");
        return false;
      }

      errorMsg.classList.add("hidden");
      return true;
    }

    function toggleDropdown() {
      const dropdown = document.getElementById('dropdownMenu');
      dropdown.classList.toggle('hidden');
    }

    function toggleLoginDropdown() {
      const dropdown = document.getElementById('loginDropdownMenu');
      dropdown.classList.toggle('hidden');
    }

    window.addEventListener('click', function (e) {
      const regBtn = document.querySelector('button[onclick="toggleDropdown()"]');
      const regMenu = document.getElementById('dropdownMenu');
      if (!regBtn.contains(e.target) && !regMenu.contains(e.target)) {
        regMenu.classList.add('hidden');
      }

      const loginBtn = document.querySelector('button[onclick="toggleLoginDropdown()"]');
      const loginMenu = document.getElementById('loginDropdownMenu');
      if (!loginBtn.contains(e.target) && !loginMenu.contains(e.target)) {
        loginMenu.classList.add('hidden');
      }
    });
  </script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String username = (String) session.getAttribute("username");
String pwd = (String) session.getAttribute("password");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Buyer Login - BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

  <!-- Header -->
  <header class="bg-[#d9d9d9] shadow-sm">
    <div class="container mx-auto px-4 py-4">
      <h1 class="text-2xl md:text-3xl font-bold text-blue-600 text-center">Welcome to BidZone.lk - Buyer Portal</h1>
    </div>
  </header>

  <!-- Main Content -->
  <main class="flex flex-1 items-center justify-center py-8 px-4">
    <div class="bg-white rounded-lg shadow-lg w-full max-w-4xl overflow-hidden grid grid-cols-1 md:grid-cols-2">

      <!-- Image Slideshow Section -->
      <div class="relative h-64 md:h-auto overflow-hidden">
        <img src="https://images.pexels.com/photos/2494608/pexels-photo-2494608.jpeg" class="absolute w-full h-full object-cover transition-opacity duration-1000 opacity-100" id="img1" />
        <img src="https://images.pexels.com/photos/28664171/pexels-photo-28664171.jpeg" class="absolute w-full h-full object-cover transition-opacity duration-1000 opacity-0" id="img2" />
        <img src="https://images.pexels.com/photos/2865977/pexels-photo-2865977.jpeg" class="absolute w-full h-full object-cover transition-opacity duration-1000 opacity-0" id="img3" />
      </div>

      <!-- Login Form Section -->
      <div class="p-8 flex flex-col justify-center">
        <div class="flex justify-center mb-4 animate-bounce">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12H3m0 0l4-4m-4 4l4 4m13-4a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        </div>
        <h2 class="text-2xl font-bold text-center text-gray-800 mb-6">Buyer Login</h2>
        <form action="buyerloginservelt" method="post" class="space-y-4">
          <div>
            <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
            <input type="text" id="username" name="name" value="<%= username != null ? username : "" %>" placeholder="Enter your username" required
              class="mt-1 w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400 transition" />
          </div>
          <div>
            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
            <div class="relative">
              <input type="password" id="password" name="pwd" value="<%= pwd != null ? pwd : "" %>" placeholder="Enter your password" required
                class="mt-1 w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400 transition" />
              <span class="absolute top-2 right-3 text-sm text-gray-600 cursor-pointer" id="passwordToggle">Show</span>
            </div>
          </div>
          <button type="submit"
            class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 transition-colors font-medium">
            Sign In
          </button>
        </form>

        <!-- Forgot Link -->
        <p class="text-sm text-center text-gray-500 mt-4">
          Don't have an account? 
          <a href="buyerCheckEmail.jsp" class="text-blue-600 hover:underline font-medium">Forgot Password</a>
        </p>

        <!-- Alert Section -->
        <div class="mt-4 text-center">
          <%
          String msg = request.getParameter("msg");
          if ("notexist".equals(msg)) {
          %>
          <p class="text-red-600 text-sm font-medium">Incorrect Username or Password</p>
          <% } else if ("invalid".equals(msg)) { %>
          <p class="text-red-600 text-sm font-medium">Something Went Wrong! Try Again!</p>
          <% } %>
        </div>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <footer class="bg-[#d9d9d9] shadow mt-12">
    <div class="container mx-auto px-4 py-6 text-center text-sm text-gray-500">
      &copy; 2025 BidZone.lk - All rights reserved.
    </div>
  </footer>

  <!-- Scripts -->
  <script>
    // Password toggle
    document.getElementById('passwordToggle').addEventListener('click', function () {
      const input = document.getElementById('password');
      const toggle = this;
      if (input.type === 'password') {
        input.type = 'text';
        toggle.textContent = 'Hide';
      } else {
        input.type = 'password';
        toggle.textContent = 'Show';
      }
    });

    // Image slideshow
    const images = [document.getElementById('img1'), document.getElementById('img2'), document.getElementById('img3')];
    let index = 0;
    setInterval(() => {
      images.forEach((img, i) => img.classList.toggle('opacity-100', i === index));
      images.forEach((img, i) => img.classList.toggle('opacity-0', i !== index));
      index = (index + 1) % images.length;
    }, 5000);
  </script>
</body>
</html>

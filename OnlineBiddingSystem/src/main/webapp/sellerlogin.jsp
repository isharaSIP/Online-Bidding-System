<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login - BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col"> <!-- Added flex and min-h-screen -->

  <!-- Header Section -->
  <header class="bg-[#d9d9d9] shadow-sm">
    <div class="container mx-auto px-4 py-4">
      <h1 class="text-2xl md:text-3xl font-bold text-red-600 text-center">Welcome to BidZone.lk</h1>
    </div>
  </header>

  <!-- Main Content -->
  <main class="flex flex-1 items-center justify-center py-8 px-4"> <!-- Flex to center content -->
    <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md border-t-4 border-red-600 transform hover:shadow-xl transition-all duration-300">
      
      <!-- Login Icon with Animation -->
      <div class="flex justify-center mb-4 animate-bounce">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-red-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12H3m0 0l4-4m-4 4l4 4m13-4a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
      </div>

      <h2 class="text-2xl font-bold mb-6 text-center text-gray-800">Seller Login</h2>

      <!-- Login Form -->
      <form action="LoginServlet" method="POST" class="space-y-4">
        
        <!-- Email -->
        <div>
          <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
          <input type="email" id="email" name="email" required
                 class="mt-1 w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-red-400 transition-all duration-200" />
        </div>

        <!-- Password -->
        <div>
          <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
          <input type="password" id="password" name="password" required
                 class="mt-1 w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-red-400 transition-all duration-200" />
        </div>

        <!-- Submit Button -->
        <div class="text-center pt-2">
          <input type="submit" value="Login"
                 class="bg-red-600 text-white px-6 py-2 rounded-md hover:bg-red-700 cursor-pointer transition-colors duration-300 w-full font-medium" />
        </div>
      </form>

      <!-- Register Link -->
      <p class="text-sm text-center text-gray-500 mt-4">
        Don't have an account? 
        <a href="registerSeller.jsp" class="text-blue-600 hover:underline font-medium">Register as Seller</a>
      </p>
    </div>
  </main>
  
  <!-- Footer -->
  <footer class="bg-[#d9d9d9] shadow mt-12">
    <div class="container mx-auto px-4 py-6 text-center text-sm text-gray-500">
      &copy; 2025 BidZone.lk - All rights reserved.
    </div>
  </footer>

</body>
</html>

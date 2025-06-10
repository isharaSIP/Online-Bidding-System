<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Register Admin - BidZone</title>
  <script src="https://cdn.tailwindcss.com "></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">

  <!-- Register Card -->
  <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md border-t-4 border-red-600 transition-all duration-300 transform hover:shadow-xl">
    
    <!-- Icon -->
    <div class="flex justify-center mb-6 animate-bounce">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-red-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5h14a2 2 0 012 2v7a2 2 0 01-2 2H4a2 2 0 01-2-2V8a2 2 0 012-2h14a2 2 0 012 2v3a2 2 0 01-2 2z" />
      </svg>
    </div>

    <h2 class="text-2xl font-bold mb-6 text-center text-gray-800">Admin Registration</h2>

    <!-- Register Form -->
    <form action="AdminInsertServlet" method="post" class="space-y-5">
      
      <!-- First Name -->
      <div>
        <label for="firstName" class="block text-sm font-medium text-gray-700">First Name</label>
        <input type="text" id="firstName" name="firstName" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500 transition duration-150 ease-in-out" />
      </div>

      <!-- Last Name -->
      <div>
        <label for="lastName" class="block text-sm font-medium text-gray-700">Last Name</label>
        <input type="text" id="lastName" name="lastName" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500 transition duration-150 ease-in-out" />
      </div>

      <!-- Username -->
      <div>
        <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
        <input type="text" id="username" name="username" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500 transition duration-150 ease-in-out" />
      </div>

      <!-- Password -->
      <div>
        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
        <input type="password" id="password" name="password" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500 transition duration-150 ease-in-out" />
      </div>

      <!-- Hometown -->
      <div>
        <label for="hometown" class="block text-sm font-medium text-gray-700">Home Town</label>
        <input type="text" id="hometown" name="hometown" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500 transition duration-150 ease-in-out" />
      </div>

      <!-- Submit Button -->
      <div class="pt-2">
        <button type="submit"
                class="w-full bg-red-600 hover:bg-red-700 text-white font-semibold py-2 px-4 rounded-md shadow-sm transition-colors duration-300 ease-in-out">
          Register
        </button>
      </div>
      <!-- Back to Admin Button -->
		<div class="mt-4 text-center">
		  <a href="AdminListServlet"
		     class="inline-block bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded-md transition-colors duration-300 ease-in-out">
		    ⬅ Back to Admin
		  </a>
		</div>
      
    </form>

  </div>
</body>
</html>
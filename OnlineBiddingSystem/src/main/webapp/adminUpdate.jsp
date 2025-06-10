<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Update Admin - BidZone</title>
  <script src="https://cdn.tailwindcss.com "></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">

  <!-- Update Card -->
  <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md border-t-4 border-red-600 transition-all duration-300 transform hover:shadow-xl">

    <!-- Icon -->
    <div class="flex justify-center mb-6 animate-bounce">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-red-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
      </svg>
    </div>

    <h2 class="text-2xl font-bold mb-6 text-center text-gray-800">Update Admin Profile</h2>

    <!-- Update Form -->
    <form action="UpdateAdminServlet" method="post" class="space-y-5">
      <input type="hidden" name="id" value="<%=request.getParameter("id")%>" />
      <input type="hidden" name="action" value="<%=request.getParameter("action")%>" />

      <div>
        <label for="firstName" class="block text-sm font-medium text-gray-700">First Name</label>
        <input type="text" id="firstName" name="firstName" value="<%=request.getParameter("firstName")%>" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500" />
      </div>

      <div>
        <label for="lastName" class="block text-sm font-medium text-gray-700">Last Name</label>
        <input type="text" id="lastName" name="lastName" value="<%=request.getParameter("lastName")%>" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500" />
      </div>

      <div>
        <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
        <input type="text" id="username" name="username" value="<%=request.getParameter("username")%>" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500" />
      </div>

      <div>
        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
        <input type="password" id="password" name="password" value="<%=request.getParameter("password")%>" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500" />
      </div>

      <div>
        <label for="hometown" class="block text-sm font-medium text-gray-700">Home Town</label>
        <input type="text" id="hometown" name="hometown" value="<%=request.getParameter("hometown")%>" required
               class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500" />
      </div>

      <div class="pt-2">
        <button type="submit"
                class="w-full bg-red-600 hover:bg-red-700 text-white font-semibold py-2 px-4 rounded-md shadow-sm transition-colors duration-300">
          Save Changes
        </button>
      </div>
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
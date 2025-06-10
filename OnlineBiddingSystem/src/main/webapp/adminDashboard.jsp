<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Dashboard - BidZone</title>
  <script src="https://cdn.tailwindcss.com "></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

  <!-- Header -->
  <header class="bg-white shadow px-6 py-4 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-red-600">BidZone Admin Panel</h1>
    <a href="LogoutServlet" onclick="return confirmLogout()" 
       class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700 transition duration-300">Logout</a>
  </header>

  <!-- Main Layout -->
  <div class="flex flex-grow overflow-hidden">
    
    <!-- Sidebar -->
    <aside class="w-64 bg-white shadow-md p-6 space-y-4 h-full mt-6">
      <h2 class="text-xl font-semibold mb-4">Navigation</h2>
      <nav class="flex flex-col space-y-2">
        <a href="AdminDashboardServlet" class="bg-red-100 font-semibold px-4 py-2 rounded transition">Dashboard</a>
        <a href="AdminListServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Admins</a>
        <a href="ViewSellersServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Sellers</a>
        <a href="buyerdisplay.jsp" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Buyers</a>
        <a href="ItemAllDisplayServlet?action=ondashA" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Auctions</a>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto p-6 space-y-10">

      <!-- Dashboard Overview -->
      <section id="dashboard">
        <h2 class="text-2xl font-bold mb-6 text-gray-800">Dashboard Overview</h2>

        <!-- Welcome Message -->
        <div class="bg-white p-6 rounded-lg shadow-md border-l-4 border-red-600">
          <h3 class="text-xl font-semibold text-gray-800">Welcome, ${admin.firstName}!</h3>
          <p class="text-gray-600 mt-2">You're logged in as an admin. Use the sidebar to navigate between sections.</p>
        </div>

        <!-- Admin Details Card -->
        <div class="bg-white p-6 rounded-lg shadow-md border-t-4 border-gray-300 mt-10">
          <h3 class="text-xl font-bold text-gray-800 mb-4">Admin Details</h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-sm text-gray-700">
            <div>
              <p class="font-semibold">Name</p>
              <p class="text-gray-600 mt-1">${admin.firstName} ${admin.lastName}</p>
            </div>
            <div>
              <p class="font-semibold">Username</p>
              <p class="text-gray-600 mt-1">${admin.username}</p>
            </div>
            <div>
              <p class="font-semibold">Hometown</p>
              <p class="text-gray-600 mt-1">${admin.hometown}</p>
            </div>
          </div>

          <!-- Action Buttons -->
          <div class="mt-6 flex space-x-4">
            <a href="adminUpdate.jsp?id=${admin.id}&firstName=${admin.firstName}&lastName=${admin.lastName}&username=${admin.username}&password=${admin.password}&hometown=${admin.hometown}&action=ondash"
              class="inline-block bg-blue-600 text-white px-5 py-2 rounded hover:bg-blue-700 transition">
              Edit Profile
            </a>
            <a href="DeleteAdminServlet?id=${admin.id}" 
              onclick="return confirm('Are you sure you want to delete this admin?');"
              class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded transition">
              Delete
            </a>
          </div>
        </div>

      </section>
    </main>
  </div>

  <!-- Footer -->
  <footer class="bg-white shadow mt-auto py-4 text-center text-sm text-gray-500">
    &copy; 2025 BidZone.lk - All rights reserved.
  </footer>

  <!-- Confirmation Script -->
  <script>
    function confirmLogout() {
      return confirm("Are you sure you want to log out?");
    }
  </script>
</body>

</html>
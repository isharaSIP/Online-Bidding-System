<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>All Sellers - Admin | BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

  <!-- Header -->
  <header class="bg-white shadow px-6 py-4 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-red-600">BidZone Admin Panel</h1>
    <a href="LogoutServlet" onclick="return confirmLogout()" 
       class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700 transition duration-300">Logout</a>
  </header>

  <!-- Main Layout -->
  <div class="flex flex-1 mt-4">

    <!-- Sidebar -->
    <aside class="w-64 bg-white shadow-md p-6 space-y-4 h-full">
      <h2 class="text-xl font-semibold mb-4">Navigation</h2>
      <nav class="flex flex-col space-y-2">
        <a href="AdminDashboardServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Dashboard</a>
        <a href="AdminListServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Admins</a>
        <a href="ViewSellersServlet" class="bg-red-100 font-semibold px-4 py-2 rounded transition">Manage Sellers</a>
        <a href="buyerdisplay.jsp" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Buyers</a>
        <a href="ItemAllDisplayServlet?action=ondashA" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Auctions</a>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-6 space-y-6">

      <!-- Page Title & Add Button -->
      <div class="flex justify-between items-center">
        <h2 class="text-2xl font-bold text-gray-800">All Sellers</h2>
        <a href="addNewSeller.jsp" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 text-sm">+ Add New Seller</a>
      </div>

      <!-- Sellers Table -->
      <div class="overflow-x-auto">
        <table class="min-w-full bg-white shadow-md rounded text-sm">
          <thead>
            <tr class="bg-gray-200 text-left">
              <th class="px-4 py-2">ID</th>
              <th class="px-4 py-2">Name</th>
              <th class="px-4 py-2">NIC</th>
              <th class="px-4 py-2">Province</th>
              <th class="px-4 py-2">District</th>
              <th class="px-4 py-2">Mobile</th>
              <th class="px-4 py-2">Email</th>
              <th class="px-4 py-2">Action</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="seller" items="${allSellers}">
              <tr class="border-b hover:bg-gray-50">
                <td class="px-4 py-2">${seller.id}</td>
                <td class="px-4 py-2">${seller.name}</td>
                <td class="px-4 py-2">${seller.nic}</td>
                <td class="px-4 py-2">${seller.province}</td>
                <td class="px-4 py-2">${seller.district}</td>
                <td class="px-4 py-2">${seller.mobile}</td>
                <td class="px-4 py-2">${seller.email}</td>
			    <td class="px-4 py-2">
				  <div class="flex space-x-2">
				    <!-- Edit Button -->
				    <a href="SellerUpdateAdmin.jsp?id=${seller.id}&name=${seller.name}&nic=${seller.nic}&province=${seller.province}&district=${seller.district}&mobile=${seller.mobile}&email=${seller.email}&password=${seller.password}"
	       				class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 text-xs">
	      				Edit 
	   				</a>
				
				    <!-- Delete Button -->
				    <form action="DeleteSellerServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this seller?');">
  						<input type="hidden" name="source" value="admin" />
				    	<input type="hidden" name="id" value="${seller.id}" />
				      	<button type="submit" class="bg-red-600 text-white px-3 py-1 rounded hover:bg-red-700 text-xs">
				        Delete
				      </button>
				    </form>
				  </div>
				</td>


              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

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

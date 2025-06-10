<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin - Auction Items</title>
  <script src="script/countdown.js"></script>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

  <!-- Header -->
  <header class="bg-white shadow px-6 py-4 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-red-600">BidZone Admin Panel</h1>
    <a href="LogoutServlet" onclick="return confirm('Are you sure you want to log out?')" 
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
        <a href="ViewSellersServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Sellers</a>
        <a href="buyerdisplay.jsp" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Buyers</a>
        <a href="ItemAllDisplayServlet?action=ondashA" class="bg-red-100 font-semibold px-4 py-2 rounded transition">Manage Auctions</a>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-6 space-y-6">
      <section class="bg-white p-6 rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-gray-700 mb-6">Auction Items</h2>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          	<c:forEach var="item" items="${item}">
			  <fmt:formatDate var="startDateFormatted" value="${item.start_Date}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
			  <fmt:formatDate var="endDateFormatted" value="${item.closing_Date}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
			
			  <div class="bg-white rounded-lg shadow-lg p-4 flex flex-col 
			              transition-transform transform hover:scale-105 
			              duration-300 ease-in-out">
			    <img src="${item.item_image_path}" alt="Item Image" class="w-full h-64 object-cover rounded mb-4">
			
			    <h3 class="text-lg font-semibold text-gray-800 mb-1">${item.item_name}</h3>
			    <p class="text-sm text-gray-600 mb-2">${item.description}</p>
			
			    <div class="text-sm mb-2">
			      <span class="text-green-600 font-semibold">Starting Bid:</span> ${item.starting_bid}<br>
			      <span class="text-blue-600 font-medium">Start:</span> ${item.start_Date}<br>
			      <span class="text-purple-600 font-medium">End:</span> ${item.closing_Date}<br>
			      <span class="text-gray-600 font-medium">Seller ID:</span> ${item.seller_id}
			    </div>
			
			    <div class="text-red-500 font-bold mb-2 countdown-timer"
			         data-start-date="${startDateFormatted}"
			         data-end-date="${endDateFormatted}">
			    </div>
			
			    <!-- Admin Actions (optional) -->
			    <div class="mt-auto flex justify-between gap-2">
			      <a href="ItemEditServlet?action=onadmin&id=${item.id}" 
			         class="flex-1 bg-yellow-500 hover:bg-yellow-600 text-white text-xs font-medium py-1 px-2 rounded text-center">
			        Edit
			      </a>
			      <a href="ItemDeleteServlet?action=delete&id=${item.id}&sid=${item.seller_id}" 
			         onclick="return confirm('Are you sure you want to delete this item?');"
			         class="flex-1 bg-red-600 hover:bg-red-700 text-white text-xs font-medium py-1 px-2 rounded text-center">
			        Delete
			      </a>
			    </div>
			  </div>
			</c:forEach>
          	
        </div>
      </section>
    </main>
  </div>

  <!-- Footer -->
  <footer class="bg-white shadow mt-auto py-4 text-center text-sm text-gray-500">
    &copy; 2025 BidZone.lk - All rights reserved.
  </footer>

</body>
</html>

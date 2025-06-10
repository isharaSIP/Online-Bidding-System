<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Your Listed Items - BidZone</title>
  
  <script src="script/countdown.js"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  
</head>
<body class="bg-gray-100 text-gray-800">

<!-- Navbar -->
<header class="bg-white shadow">
  <div class="container mx-auto px-4 py-4 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-red-600">BidZone.lk</h1>
    <nav class="space-x-4">
      <a href="index.jsp" class="hover:text-blue-500">Home</a>
      <a href="index.jsp" class="hover:text-red-600 font-semibold">Logout</a>
    </nav>
  </div>
</header>

<!-- Layout -->
<div class="flex flex-col md:flex-row max-w-7xl mx-auto mt-6">

  <!-- Sidebar -->
  <aside class="w-full md:w-64 bg-white shadow rounded p-4 mb-6 md:mb-0 md:mr-6">
    <h2 class="text-xl font-semibold mb-4">Seller Menu</h2>
    <nav class="flex flex-col space-y-2">
    <a href="SellerProfileServlet?action=ondash" class="px-4 py-2 rounded hover:bg-blue-100">Dashboard</a>
      <a href="your_items.jsp" class="px-4 py-2 rounded bg-blue-100">My Listings</a>
      <a href="ItemInsertServlet?action=newList" class="px-4 py-2 rounded hover:bg-blue-100">Create New Auction</a>
      <a href="#soldItems" class="px-4 py-2 rounded hover:bg-blue-100">Sold Items</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 space-y-6">
    
    <!-- Items Table Section -->
    <section class="bg-white p-6 rounded shadow">
  <h2 class="text-2xl font-bold text-gray-700 mb-6">Your Auction Items</h2>
  
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <c:forEach var="item" items="${items}">
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
          <span class="text-purple-600 font-medium">End:</span> ${item.closing_Date}
        </div>
        
        <div class="text-red-500 font-bold mb-2 countdown-timer"
             data-start-date="${startDateFormatted}"
             data-end-date="${endDateFormatted}">
        </div>
        
        <div class="mt-auto flex justify-between gap-2">
          <a href="ItemEditServlet?action=edit&id=${item.id}"
             class="flex-1 bg-yellow-400 hover:bg-yellow-500 text-white text-xs font-medium py-1 px-2 rounded text-center">
            Edit
          </a>
          <button onclick="confirmDelete('ItemDeleteServlet?action=delete&id=${item.id}&sid=${item.seller_id}')"
                  class="flex-1 bg-red-500 hover:bg-red-600 text-white text-xs font-medium py-1 px-2 rounded">
            Delete
          </button>
        </div>
      </div>
    </c:forEach>
  </div>
</section>

  </main>
</div>

<!-- Footer -->
<footer class="bg-white shadow mt-12">
  <div class="container mx-auto px-4 py-6 text-center text-sm text-gray-500">
    &copy; 2025 BidZone.lk - All rights reserved.
  </div>
</footer>

</body>
</html>

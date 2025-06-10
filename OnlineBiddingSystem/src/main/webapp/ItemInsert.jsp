<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Seller Dashboard - BidZone</title>
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
      <a href="ItemDisplayServlet?action=ondash&seller_id=${seller_.id}" class="px-4 py-2 rounded hover:bg-blue-100">My Listings</a>
      <a href="#createAuction" class="px-4 py-2 rounded hover:bg-blue-100">Create New Auction</a>
      <a href="#soldItems" class="px-4 py-2 rounded hover:bg-blue-100">Sold Items</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 space-y-6">
    
    <!-- Welcome Section -->
    <section class="bg-white p-6 rounded shadow">
      <h2 class="text-2xl font-bold text-gray-700">Welcome, <span class="text-red-600">${seller_.name}</span> 👋</h2>
      <p class="text-sm text-gray-500 mt-2">Manage your auctions, track sales, and update your profile.</p>
    </section>
    
   

    <!-- Create Auction Form Section -->
    <section id="createAuction" class="bg-white p-6 rounded shadow">
      <h3 class="text-xl font-semibold mb-4">Create New Auction</h3>
      <form action="ItemInsertServlet" method="post" enctype="multipart/form-data">
      
       	<input type="hidden" name="sid" value="${seller_.id}">

       	
        <label for="itemName" class="block text-sm font-medium text-gray-700">Item Name:</label>
        <input type="text" id="itemName" name="itemName" class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>
        
        <label for="description" class="block text-sm font-medium text-gray-700">Description:</label>
        <textarea id="description" name="description" class="mt-1 block w-full px-4 py-2 border rounded-md" required></textarea>
        <br>
        
        <label for="startingBid" class="block text-sm font-medium text-gray-700">Starting Bid:</label>
        <input type="number" id="startingBid" name="startingBid" class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>
		
		<label for="closingTime" class="block text-sm font-medium text-gray-700">Start Date:</label>
        <input type="date" id="closingDate" name="startDate" class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>
        
        <label for="closingTime" class="block text-sm font-medium text-gray-700">Closing Date:</label>
        <input type="date" id="closingDate" name="closingDate" class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>

        <label for="itemImage" class="block text-sm font-medium text-gray-700">Item Image:</label>
        <input type="file" id="itemImage" name="itemImage" class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>

        <input type="submit" value="Add Auction Item" class="mt-4 bg-blue-600 text-white px-6 py-3 rounded hover:bg-blue-700">
      </form>
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

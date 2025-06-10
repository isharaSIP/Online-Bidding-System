<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Edit Auction - BidZone</title>
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
      <a href="ItemDisplayServlet?action=route" class="px-4 py-2 rounded hover:bg-blue-100">My Listings</a>
      <a href="#" class="px-4 py-2 rounded hover:bg-blue-100">Edit Auction</a>
      <a href="#soldItems" class="px-4 py-2 rounded hover:bg-blue-100">Sold Items</a>
      <a href="#profile" class="px-4 py-2 rounded hover:bg-blue-100">My Profile</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 space-y-6">
    
    <!-- Welcome Section -->
    <section class="bg-white p-6 rounded shadow">
      <h2 class="text-2xl font-bold text-gray-700">Edit Auction - <span class="text-red-600">${item.item_name}</span></h2>
      <p class="text-sm text-gray-500 mt-2">Update your listing details below.</p>
    </section>
    
    <!-- Edit Auction Form Section -->
    <section class="bg-white p-6 rounded shadow">
      <h3 class="text-xl font-semibold mb-4">Edit Auction Details</h3>
      <form action="ItemEditServlet" method="post" enctype="multipart/form-data">

        <!-- Hidden Fields -->
        <input type="text" name="id" value="${item.id}">
        <input type="hidden"  name="sellerId" value="${item.seller_id}">
		<input type="hidden"  name="action" value="onseller">
		
        <label for="itemName" class="block text-sm font-medium text-gray-700">Item Name:</label>
        <input type="text" id="itemName" name="itemName" value="${item.item_name}" class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>

        <label for="description" class="block text-sm font-medium text-gray-700">Description:</label>
        <textarea id="description" name="description" class="mt-1 block w-full px-4 py-2 border rounded-md" required>${item.description}</textarea>
        <br>

        <label for="startingBid" class="block text-sm font-medium text-gray-700">Starting Bid:</label>
        <input type="number" id="startingBid" name="startingBid" value="${item.starting_bid}" class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>

        <label for="startDate" class="block text-sm font-medium text-gray-700">Start Date:</label>
        <input type="date" id="startDate" name="startDate" value="${item.start_Date}" class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>

        <label for="closingDate" class="block text-sm font-medium text-gray-700">Closing Date:</label>
        <input type="date" id="closingDate" name="closingDate" value="${item.closing_Date}" class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>

        <label for="itemImage" class="block text-sm font-medium text-gray-700">Item Image (optional):</label>
        <input type="file" id="itemImage" name="itemImage" value="${item.item_image_path}"class="mt-1 block w-full px-4 py-2 border rounded-md" required>
        <br>
        <p class="text-xs text-gray-500">Current Image: <a href="${item.item_image_path}" target="_blank" class="text-blue-600 underline">${item.item_image_path}</a></p>

        <!-- Submit and Cancel Buttons -->
		<div class="mt-4 flex space-x-4">
		  <input type="submit" value="Update Item" class="bg-green-600 text-white px-6 py-3 rounded hover:bg-green-700">
		  
		  <a href="ItemDisplayServlet?action=route" class="bg-gray-400 text-white px-6 py-3 rounded hover:bg-gray-500 text-center">
		    Cancel
		  </a>
		</div>
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

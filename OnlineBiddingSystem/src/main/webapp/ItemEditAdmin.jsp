<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Auction - BidZone</title>
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
      <a href="AdminDashboardServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Dashboard</a>
      <a href="AdminListServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Admins</a>
      <a href="ViewSellersServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Sellers</a>
      <a href="buyerdisplay.jsp" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Buyers</a>
      <a href="ItemAllDisplayServlet?action=ondashA" class="bg-red-100 font-semibold px-4 py-2 rounded transition">Manage Auctions</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 overflow-y-auto p-6 space-y-10">

    <!-- Edit Auction Section -->
    <section class="bg-white p-6 rounded-lg shadow-md border-l-4 border-red-600">
      <h2 class="text-2xl font-bold mb-6 text-gray-800">Edit Auction - <span class="text-red-600">${item.item_name}</span></h2>

      <form action="ItemEditServlet" method="post" enctype="multipart/form-data" class="space-y-6 max-w-3xl mx-auto">

        <input type="hidden" name="id" value="${item.id}" />
        <input type="hidden" name="action" value="onadmin" />

        <!-- Item Name -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Item Name</label>
          <input type="text" name="itemName" value="${item.item_name}" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-400" />
        </div>

        <!-- Description -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Description</label>
          <textarea name="description" rows="4" required
                    class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-400">${item.description}</textarea>
        </div>

        <!-- Starting Bid -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Starting Bid</label>
          <input type="number" step="0.01" name="startingBid" value="${item.starting_bid}" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-400" />
        </div>

        <!-- Start Date -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Start Date</label>
          <input type="date" name="startDate" value="${item.start_Date}" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-400" />
        </div>

        <!-- Closing Date -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Closing Date</label>
          <input type="date" name="closingDate" value="${item.closing_Date}" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-400" />
        </div>

        <!-- Item Image Upload -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Item Image (Optional)</label>
          <input type="file" name="itemImage"
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-400" />
          <p class="mt-2 text-xs text-gray-500">
            Current Image: <a href="${item.item_image_path}" target="_blank" class="text-blue-600 underline">View Image</a>
          </p>
        </div>

        <!-- Action Buttons -->
        <div class="flex justify-end space-x-4 mt-6">
          <button type="submit"
                  class="bg-red-600 text-white px-5 py-2 rounded hover:bg-red-700 transition">
            Update Auction
          </button>
          <a href="ItemAllDisplayServlet?action=ondashA"
             class="bg-gray-300 text-gray-800 px-5 py-2 rounded hover:bg-gray-400 transition">
             Cancel
          </a>
        </div>
      </form>
    </section>

  </main>
</div>

<!-- Footer -->
<footer class="bg-white shadow mt-auto py-4 text-center text-sm text-gray-500">
  &copy; 2025 BidZone.lk - All rights reserved.
</footer>

<script>
  function confirmLogout() {
    return confirm("Are you sure you want to log out?");
  }
</script>

</body>
</html>
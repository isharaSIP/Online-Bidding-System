<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Seller Dashboard - BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="script/countdown.js"></script>
</head>
<body class="bg-blue-50 text-gray-800">

<!-- Navbar -->
<header class="bg-white shadow">
  <div class="container mx-auto px-4 py-4 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-blue-600">BidZone.lk</h1>
    <nav class="space-x-4">
      <a href="index.jsp" onclick="return confirmLogout()" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 font-semibold">Logout</a>
    </nav>
  </div>
</header>

<!-- Layout -->
<div class="flex flex-col md:flex-row max-w-7xl mx-auto mt-6">

  <!-- Sidebar -->
  <aside class="w-full md:w-64 bg-white shadow rounded p-4 mb-6 md:mb-0 md:mr-6">
    <h2 class="text-xl font-semibold text-blue-600 mb-4">Seller Menu</h2>
    <nav class="flex flex-col space-y-2">
      <a href="buyerloginservelt?action=ondash" class="px-4 py-2 rounded hover:bg-blue-100">Dashboard</a>
      <a href="javascript:void(0);" onclick="openProfileModal()" class="px-4 py-2 rounded hover:bg-blue-100">Place Bid</a>
      <a href="Bidhistroy.jsp?buyerid=${buyer.id}" class="px-4 py-2 rounded hover:bg-blue-100">Bid History</a>
    </nav>
  </aside>
  

  

  <!-- Main Content -->
  <main class="flex-1 space-y-6">
    <!-- Items Table Section -->
    <section class="bg-white p-6 rounded-lg shadow-lg">
      <h2 class="text-2xl font-bold text-gray-700 mb-6">Auction Items</h2>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <c:forEach var="item" items="${item}">
          <fmt:formatDate var="startDateFormatted" value="${item.start_Date}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
          <fmt:formatDate var="endDateFormatted" value="${item.closing_Date}" pattern="yyyy-MM-dd'T'HH:mm:ss" />

          <div class="bg-white rounded-2xl shadow-lg p-6 flex flex-col transition-transform transform hover:scale-105 hover:shadow-xl duration-300 ease-in-out hover:translate-y-4">
            <img src="${item.item_image_path}" alt="Item Image" class="w-full h-56 object-contain border border-gray-300 rounded-2xl mb-3 bg-white" />
            <h3 class="text-lg font-semibold text-gray-900 mb-2">${item.item_name}</h3>

            <div class="text-sm text-gray-700 mb-3">
              <span class="font-semibold text-green-600">Starting Bid:</span> Rs. ${item.starting_bid}<br>
            </div>

            <div class="text-red-600 font-bold text-sm mb-4 countdown-timer"
                 data-start-date="${startDateFormatted}"
                 data-end-date="${endDateFormatted}">
              <!-- JS will update this -->
            </div>

            <a href="Bidinsert.jsp?iId=${item.id}&iName=${item.item_name}&bId=${buyer.id}&bName=${buyer.name}&iStart=${item.starting_bid}"
               class="mt-auto bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold py-2 px-4 rounded-lg text-center transition-all duration-200 ease-in-out transform hover:scale-105">
              Place Bid
            </a>
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

<script>
  function openProfileModal() {
    document.getElementById("profileModal").classList.remove("hidden");
  }

  function closeProfileModal() {
    document.getElementById("profileModal").classList.add("hidden");
  }

  function confirmLogout() {
    return confirm("Are you sure you want to log out?");
  }
</script>

</body>
</html>

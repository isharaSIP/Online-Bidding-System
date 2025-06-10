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
      <a href="#" class="px-4 py-2 rounded hover:bg-blue-100">Dashboard</a>
      <a href="ItemAllDisplayServlet?action=ondashB&buyerid=${buyer.id}" class="px-4 py-2 rounded hover:bg-blue-100">Place Bid</a>
      <a href="Bidhistroy.jsp?buyerid=${buyer.id}" class="px-4 py-2 rounded hover:bg-blue-100">Bid History</a>
      <a href="javascript:void(0);" onclick="openProfileModal()" class="px-4 py-2 rounded hover:bg-blue-100">My Profile</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 space-y-6">

    <!-- Welcome -->
    <section class="bg-white p-6 rounded shadow">
      <h2 class="text-2xl font-bold text-gray-700">Welcome, <span class="text-blue-600">${buyer.name}</span> 👋</h2>
      <p class="text-sm text-gray-500 mt-2">Manage your auctions, track sales, and update your profile.</p>
    </section>

    <!-- Profile Section -->
    <section id="profile" class="bg-white p-8 rounded shadow-lg max-w-7xl mx-auto">
      <div class="flex items-center space-x-4 mb-6 border-b pb-4">
        <div class="p-1 rounded-full">
          <img src="images/profile.png" alt="Profile Image" class="h-10 w-10 object-cover rounded-full">
        </div>
        <h3 class="text-2xl font-bold text-blue-600">My Profile</h3>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-sm text-gray-700">
        <div>
          <p class="font-semibold">Name</p>
          <p class="text-gray-600 mt-1">${buyer.name}</p>
        </div>
        <div>
          <p class="font-semibold">Email</p>
          <p class="text-gray-600 mt-1">${buyer.email}</p>
        </div>
        <div>
          <p class="font-semibold">Mobile Number</p>
          <p class="text-gray-600 mt-1">${buyer.phoneNumber}</p>
        </div>
      </div>

      <!-- Action Buttons -->
      <div class="flex justify-end space-x-3 mt-8">
        <a href="buyerprofileupdate.jsp?id=${buyer.id}&name=${buyer.name}&mobile=${buyer.phoneNumber}&email=${buyer.email}&password=${buyer.pwd}"
           class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 text-sm">
          Edit Profile
        </a>
        <form action="deleteBuyerServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your profile?');">
          <input type="hidden" name="id" value="${buyer.id}" />
          <button type="submit" class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700 text-sm">
            Delete Profile
          </button>
        </form>
      </div>
    </section>

    <!-- Profile Modal -->
    <div id="profileModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
      <div class="bg-white p-6 rounded-lg w-full max-w-xl shadow-lg relative">
        <button onclick="closeProfileModal()" class="absolute top-2 right-2 text-gray-500 hover:text-blue-600 text-xl">&times;</button>

        <div class="flex items-center space-x-4 mb-4 border-b pb-4">
          <div class="p-1 rounded-full">
            <img src="images/profile.png" alt="Profile Image" class="h-10 w-10 object-cover rounded-full">
          </div>
          <h3 class="text-2xl font-bold text-blue-600">My Profile</h3>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-gray-700">
          <div>
            <p class="font-semibold">Name</p>
            <p class="text-gray-600 mt-1">${buyer.name}</p>
          </div>
          <div>
            <p class="font-semibold">Email</p>
            <p class="text-gray-600 mt-1">${buyer.email}</p>
          </div>
          <div>
            <p class="font-semibold">Mobile No</p>
            <p class="text-gray-600 mt-1">${buyer.phoneNumber}</p>
          </div>
        </div>
      </div>
    </div>

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

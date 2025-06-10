<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.net.URLEncoder" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String pwd = request.getParameter("password");
    String phoneNumber = request.getParameter("mobile");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Edit Buyer Profile - BidZone</title>
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
      <a href="buyerloginservelt?action=ondash" class="px-4 py-2 rounded hover:bg-blue-100">Dashboard</a>
      <a href="ItemAllDisplayServlet?action=ondashB&buyerid=${buyer.id}" class="px-4 py-2 rounded hover:bg-blue-100">Place Bid</a>
      <a href="Bidhistroy.jsp?buyerid=${buyer.id}" class="px-4 py-2 rounded hover:bg-blue-100">Bid History</a>
      <a href="javascript:void(0);" onclick="openProfileModal()" class="px-4 py-2 rounded hover:bg-blue-100">My Profile</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 space-y-6">

    <!-- Page Title -->
    <section class="bg-white p-6 rounded shadow">
      <h2 class="text-2xl font-bold text-gray-700">Update Profile - <span class="text-blue-600"><%= name %></span></h2>
      <p class="text-sm text-gray-500 mt-2">Update your personal details below.</p>
    </section>

    <!-- Form Section -->
    <section class="bg-white p-8 rounded shadow-lg max-w-3xl mx-auto">
      <form action="updateBuyerProfileServelt" method="post" class="space-y-6">
        <input type="hidden" name="id" value="<%= id %>" />
        <input type="hidden" name="action" value="onbuyer" />

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
          <input type="text" name="name" value="<%= name %>" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
          <input type="text" name="email" value="<%= email %>" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Mobile Number</label>
          <input type="text" name="mobile" value="<%= phoneNumber %>" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
          <input type="text" name="password" value="<%= pwd %>" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>

        <div class="flex justify-end">
          <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition text-sm">
            Update Profile
          </button>
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

<script>
  function confirmLogout() {
    return confirm("Are you sure you want to log out?");
  }

  function openProfileModal() {
    alert("Profile modal is only available on the dashboard.");
  }
</script>

</body>
</html>

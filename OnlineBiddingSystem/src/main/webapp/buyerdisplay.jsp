<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<%@ page import="buyerpackage.buyercontrol" %>
<%@ page import="buyerpackage.buyermodel" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>All Buyers - Admin | BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

  <!-- Header -->
  <header class="bg-white shadow px-6 py-4 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-red-600">BidZone Admin Panel</h1>
    <a href="index.jsp" onclick="return confirm('Are you sure you want to log out?')" 
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
        <a href="buyerdisplay.jsp" class="bg-red-100 font-semibold px-4 py-2 rounded transition">Manage Buyers</a>
        <a href="ItemAllDisplayServlet?action=ondashA" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Auctions</a>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-6 space-y-6">

      <!-- Page Title -->
      <div class="flex justify-between items-center">
        <h2 class="text-2xl font-bold text-gray-800">All Buyers</h2>
      </div>

      <!-- Buyer Table -->
      <div class="overflow-x-auto">
        <table class="min-w-full bg-white shadow-md rounded text-sm">
          <thead>
            <tr class="bg-gray-200 text-left">
              <th class="px-4 py-2">ID</th>
              <th class="px-4 py-2">Name</th>
              <th class="px-4 py-2">Password</th>
              <th class="px-4 py-2">Phone</th>
              <th class="px-4 py-2">Email</th>
              <th class="px-4 py-2">Actions</th>
            </tr>
          </thead>
          <tbody>
            <%
              List<buyermodel> buyers = buyercontrol.getAllBid();
              if (buyers != null && !buyers.isEmpty()) {
                for (buyermodel buyer : buyers) {
            %>
            <tr class="border-b hover:bg-gray-50">
              <td class="px-4 py-2"><%= buyer.getId() %></td>
              <td class="px-4 py-2"><%= buyer.getName() %></td>
              <td class="px-4 py-2"><%= buyer.getPwd() %></td>
              <td class="px-4 py-2"><%= buyer.getPhoneNumber() %></td>
              <td class="px-4 py-2"><%= buyer.getEmail() %></td>
              <td class="px-4 py-2">
                <div class="flex space-x-2">
                  <a href="adminBuyerUpdate.jsp?id=<%= buyer.getId() %>&name=<%= buyer.getName() %>&email=<%= buyer.getEmail() %>&password=<%= buyer.getPwd() %>&phonenumber=<%= buyer.getPhoneNumber() %>" 
                     class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600 text-xs">
                    Update
                  </a>
                  <a href="deleteBuyerProfile?id=<%= buyer.getId() %>" 
                     onclick="return confirm('Are you sure you want to delete this record?');" 
                     class="bg-red-600 text-white px-3 py-1 rounded hover:bg-red-700 text-xs">
                    Delete
                  </a>
                </div>
              </td>
            </tr>
            <%
                }
              } else {
            %>
            <tr>
              <td colspan="6" class="text-center text-gray-500 py-4">No buyers found.</td>
            </tr>
            <%
              }
            %>
          </tbody>
        </table>
      </div>

      <!-- Back Button -->
      <div>
        <a href="AdminDashboardServlet" class="bg-gray-400 text-white px-4 py-2 rounded hover:bg-gray-500 text-sm">
          ← Back to Admin Panel
        </a>
      </div>

    </main>
  </div>

  <!-- Footer -->
  <footer class="bg-white shadow mt-auto py-4 text-center text-sm text-gray-500">
    &copy; 2025 BidZone.lk - All rights reserved.
  </footer>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin List - BidZone</title>
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
        <a href="AdminListServlet" class="bg-red-100 font-semibold px-4 py-2 rounded transition">Manage Admins</a>
        <a href="ViewSellersServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Sellers</a>
        <a href="ProfileServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Buyers</a>
        <a href="ItemAllDisplayServlet?action=ondashA" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Auctions</a>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-6 space-y-10">

      <section>
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-2xl font-bold text-gray-800">Admin List</h2>
          <a href="adminRegister.jsp" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition">Register New Admin</a>
        </div>

        <c:if test="${not empty admins}">
          <div class="overflow-x-auto bg-white rounded-lg shadow-md">
            <table class="min-w-full table-auto">
              <thead class="bg-gray-200 text-gray-700">
                <tr>
                  <th class="px-6 py-3 text-left font-medium">ID</th>
                  <th class="px-6 py-3 text-left font-medium">First Name</th>
                  <th class="px-6 py-3 text-left font-medium">Last Name</th>
                  <th class="px-6 py-3 text-left font-medium">Username</th>
                  <th class="px-6 py-3 text-left font-medium">Hometown</th>
                  <th class="px-6 py-3 text-left font-medium">Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="admin" items="${admins}">
                  <tr class="border-b hover:bg-gray-100">
                    <td class="px-6 py-4">${admin.id}</td>
                    <td class="px-6 py-4">${admin.firstName}</td>
                    <td class="px-6 py-4">${admin.lastName}</td>
                    <td class="px-6 py-4">${admin.username}</td>
                    <td class="px-6 py-4">${admin.hometown}</td>
                    <td class="px-6 py-4 space-x-2">
					  <a href="adminUpdate.jsp?id=${admin.id}&firstName=${admin.firstName}&lastName=${admin.lastName}&username=${admin.username}&password=${admin.password}&hometown=${admin.hometown}&action=onmanage" 
					     class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 transition text-sm">Edit</a>
					  <a href="#" onclick="confirmDelete(${admin.id})" 
					     class="bg-red-600 text-white px-3 py-1 rounded hover:bg-red-700 transition text-sm">Delete</a>
					</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:if>

        <c:if test="${empty admins}">
          <p class="text-gray-500">No admins found.</p>
        </c:if>

      </section>

    </main>
  </div>

  <!-- Footer -->
  <footer class="bg-white shadow mt-auto py-4 text-center text-sm text-gray-500">
    &copy; 2025 BidZone.lk - All rights reserved.
  </footer>

  <script>
    function confirmDelete(id) {
      if (confirm("Are you sure you want to delete this admin?")) {
        window.location.href = "DeleteAdminServlet?id=" + id;
      }
    }
  </script>
</body>
</html>

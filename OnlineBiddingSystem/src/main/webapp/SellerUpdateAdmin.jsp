<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Update Seller - BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

<!-- Navbar -->
<header class="bg-white shadow">
  <div class="container mx-auto px-4 py-4 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-red-600">BidZone.lk</h1>
  </div>
</header>

<%
  String id = request.getParameter("id");
  String name = request.getParameter("name");
  String nic = request.getParameter("nic");
  String province = request.getParameter("province");
  String district = request.getParameter("district");
  String mobile = request.getParameter("mobile");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
%>

<!-- Main Content Layout -->
<div class="flex max-w-7xl mx-auto mt-10">

  <!-- Sidebar -->
  <aside class="w-64 bg-white shadow-md p-6 space-y-4">
    <h2 class="text-xl font-semibold mb-4">Navigation</h2>
    <nav class="flex flex-col space-y-2">
      <a href="AdminDashboardServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Dashboard</a>
      <a href="AdminListServlet" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Admins</a>
      <a href="ViewSellersServlet" class="bg-red-100 font-semibold px-4 py-2 rounded transition">Manage Sellers</a>
      <a href="buyerdisplay.jsp" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Buyers</a>
      <a href="ItemAllDisplayServlet?action=ondashA" class="hover:bg-red-100 px-4 py-2 rounded transition">Manage Auctions</a>
    </nav>
  </aside>

  <!-- Form Section -->
  <div class="flex-1 ml-10 bg-white p-8 rounded shadow">
    <h2 class="text-2xl font-bold mb-6 text-center text-red-600">Update Seller Profile</h2>

    <!-- Error Message -->
    <div id="error-msg" class="hidden mb-4 text-sm text-red-600 bg-red-100 px-4 py-2 rounded"></div>

    <form id="sellerForm" action="UpdateSellerServlet" method="post" class="space-y-4" onsubmit="return validateForm()">
      <input type="hidden" name="id" value="<%=id%>"/>

      <div>
        <label class="block text-sm font-medium">Name</label>
        <input type="text" name="name" value="<%=name%>" required class="w-full px-4 py-2 border rounded"/>
      </div>

      <div>
        <label class="block text-sm font-medium">NIC</label>
        <input type="text" name="nic" value="<%=nic%>" required class="w-full px-4 py-2 border rounded"/>
      </div>

      <div>
        <label class="block text-sm font-medium">Province</label>
        <select name="province" id="province" onchange="updateDistricts()" required class="w-full px-4 py-2 border rounded">
          <option value="">Select Province</option>
          <%
            String[] provinces = { "Western", "Central", "Southern", "Northern", "Eastern", "North Western", "North Central", "Uva", "Sabaragamuwa" };
            for(String p : provinces) {
              String selected = p.equals(province) ? "selected" : "";
          %>
            <option value="<%=p%>" <%=selected%>><%=p%></option>
          <% } %>
        </select>
      </div>

      <div>
        <label class="block text-sm font-medium">District</label>
        <select name="district" id="district" required class="w-full px-4 py-2 border rounded">
          <option value="<%=district%>" selected><%=district%></option>
        </select>
      </div>

      <div>
        <label class="block text-sm font-medium">Mobile No</label>
        <input type="tel" name="mobile" pattern="[0-9]{10}" value="<%=mobile%>" required class="w-full px-4 py-2 border rounded"/>
      </div>

      <div>
        <label class="block text-sm font-medium">Email</label>
        <input type="email" name="email" value="<%=email%>" required class="w-full px-4 py-2 border rounded"/>
      </div>

      <div>
        <label class="block text-sm font-medium">Password</label>
        <div class="relative">
          <input type="password" name="password" id="password" value="<%=password%>" required class="w-full px-4 py-2 border rounded pr-10"/>
        </div>
      </div>

      <div>
        <label class="block text-sm font-medium">Re-enter Password</label>
        <div class="relative">
          <input type="password" id="repassword" name="repassword" value="<%=password%>" required class="w-full px-4 py-2 border rounded pr-10"/>
        </div>
      </div>

      <div class="flex justify-center space-x-4">
        <a href="ViewSellersServlet" class="bg-gray-300 px-6 py-2 rounded hover:bg-gray-400">Back</a>
        <button type="submit" class="bg-red-600 text-white px-6 py-2 rounded hover:bg-red-700">Update</button>
        <input type="hidden" name="source" value="admin"/>
      </div>
    </form>
  </div>
</div>

<!-- JavaScript -->
<script>
  function validateForm() {
    const pw = document.getElementById("password").value;
    const rpw = document.getElementById("repassword").value;
    const error = document.getElementById("error-msg");

    if (pw !== rpw) {
      error.textContent = "Passwords do not match!";
      error.classList.remove("hidden");
      return false;
    }
    error.classList.add("hidden");
    return true

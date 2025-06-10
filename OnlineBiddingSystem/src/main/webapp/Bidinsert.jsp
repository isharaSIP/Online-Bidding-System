<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String item = request.getParameter("iName");
    BigDecimal currentMax = BigDecimal.ZERO;

    final String DB_URL = "jdbc:mysql://localhost:3306/bidding_system_db";
    final String DB_USER = "root";
    final String DB_PASSWORD = "8219";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement("SELECT MAX(price) AS max_price FROM bidauction WHERE item=?")) {
            ps.setString(1, item);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                currentMax = rs.getBigDecimal("max_price");
                if (currentMax == null) currentMax = BigDecimal.ZERO;
            }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }

    Date currentDate = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
    String formattedDate = formatter.format(currentDate);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Place Your Bid - BidZone</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex h-screen bg-blue-50 text-gray-800">

  <!-- Sidebar -->
  <aside class="w-64 bg-white shadow-md h-full hidden md:block">
    <div class="p-6">
      <h2 class="text-2xl font-bold text-blue-600">BidZone.lk</h2>
    </div>
    <nav class="mt-6">
      <a href="buyer-dashboard.jsp?buyerid=<%= request.getParameter("bId") %>" class="block px-6 py-2 text-gray-700 hover:bg-blue-100">Dashboard</a>
      <a href="ItemAllDisplayServlet?action=ondashB&buyerid=<%= request.getParameter("bId") %>" class="block px-6 py-2 text-gray-700 hover:bg-blue-100">Browse Items</a>
      <a href="BuyerProfileServlet?action=view&buyerid=<%= request.getParameter("bId") %>" class="block px-6 py-2 text-gray-700 hover:bg-blue-100">Profile</a>
      <a href="index.jsp" onclick="return confirm('Are you sure you want to logout?')" class="block px-6 py-2 text-red-600 hover:bg-red-100">Logout</a>
    </nav>
  </aside>

  <!-- Main Content -->
  <div class="flex-1 overflow-y-auto p-8">
    <div class="max-w-3xl mx-auto bg-white p-8 rounded-lg shadow-md">
      <h2 class="text-2xl font-bold text-center text-blue-700 mb-6">Submit Your Bid</h2>

      <!-- Item Details -->
      <div class="bg-blue-50 border-l-4 border-blue-600 p-4 rounded mb-6">
        <h3 class="font-semibold text-lg">Item: <%= request.getParameter("iName") %></h3>
        <p class="text-gray-700 mt-1">Starting Price: <strong>Rs. <%= request.getParameter("iStart") %></strong></p>
        <p class="text-gray-700">Current Highest Bid: <strong>Rs. <%= currentMax %></strong></p>
      </div>

      <!-- Bid Form -->
      <form method="post" action="BidInsertServelt" class="space-y-6">
        <input type="hidden" name="buyerid" value="<%= request.getParameter("bId") %>">
        
        <div>
          <label class="block font-medium text-gray-700">Item Name:</label>
          <input type="text" name="item" value="<%= request.getParameter("iName") %>" readonly
                 class="mt-1 w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-md">
        </div>
        
        <div>
          <label class="block font-medium text-gray-700">Bidder Name:</label>
          <input type="text" name="name" value="<%= request.getParameter("bName") %>" required
                 class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring focus:ring-blue-200">
        </div>

        <div>
          <label class="block font-medium text-gray-700">Current Date & Time:</label>
          <p class="mt-1 text-sm text-gray-600"><%= formattedDate %></p>
        </div>

        <div>
          <label class="block font-medium text-gray-700">Bid Amount (Rs):</label>
          <input type="number" name="price" step="0.01" min="0.01" required
                 class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring focus:ring-blue-200">
        </div>

        <button type="submit"
                class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-md transition duration-200">
          Submit Bid
        </button>
      </form>

      <div class="text-center mt-6">
        <a href="ItemAllDisplayServlet?action=ondashB&buyerid=<%= request.getParameter("bId") %>" class="text-blue-600 hover:underline">← Back to Auction Listings</a>
      </div>
    </div>

    <!-- Footer -->
    <footer class="text-center text-sm text-gray-500 py-6 mt-12">
      &copy; 2025 BidZone.lk - All rights reserved.
    </footer>
  </div>

</body>

</html>

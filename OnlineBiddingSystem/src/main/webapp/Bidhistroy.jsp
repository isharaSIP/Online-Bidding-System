<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="online_bid.BidControl" %>
<%@ page import="online_bid.bidmodel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bid History - BidZone</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-blue-50 text-gray-800">

<!-- Top Navbar -->
<header class="bg-white shadow">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center">
        <h1 class="text-2xl font-bold text-blue-600">BidZone.lk</h1>
        <nav class="space-x-4">
            <a href="index.jsp" onclick="return confirmLogout()" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 font-semibold">Logout</a>
        </nav>
    </div>
</header>

<!-- Page Layout -->
<div class="flex flex-col md:flex-row max-w-7xl mx-auto mt-8 px-4 gap-6">

    <!-- Sidebar -->
    <aside class="w-full md:w-64 bg-white shadow rounded p-4">
        <h2 class="text-xl font-semibold text-blue-600 mb-4">Buyer Menu</h2>
        <nav class="flex flex-col space-y-2">
            <a href="buyerloginservelt?action=ondash" class="px-4 py-2 rounded hover:bg-blue-100">Dashboard</a>
            <a href="ItemAllDisplayServlet?action=ondashB&buyerid=${buyer.id}" class="px-4 py-2 rounded hover:bg-blue-100">Place Bid</a>
            <a href="Bidhistroy.jsp?buyerid=${buyer.id}" class="px-4 py-2 rounded bg-blue-100 font-semibold text-blue-700">Bid History</a>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1">
        <h2 class="text-3xl font-bold text-blue-600 mb-6 text-center">Your Bid History</h2>

        <div class="grid gap-6">
            <%
                int buyerid = Integer.parseInt(request.getParameter("buyerid"));
                List<bidmodel> bids = BidControl.getAllBid(buyerid);
                if (bids != null && !bids.isEmpty()) {
                    for (bidmodel bid : bids) {
            %>
            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-800 mb-2"><%= bid.getItem() %></h3>
                <p class="text-gray-600"><strong>Bidder Name:</strong> <%= bid.getName() %></p>
                <p class="text-gray-600"><strong>Price:</strong> $<%= bid.getPrice() %></p>
                <div class="mt-4">
                    <a href="BidDeleteServelt?id=<%= bid.getId() %>" class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700 text-sm">Delete</a>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <p class="text-center text-gray-500">No bids found.</p>
            <%
                }
            %>
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
    function confirmLogout() {
        return confirm("Are you sure you want to log out?");
    }
</script>

</body>
</html>

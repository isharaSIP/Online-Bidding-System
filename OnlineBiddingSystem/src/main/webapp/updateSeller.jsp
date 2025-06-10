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

<!-- Compact Form Container -->
<div class="max-w-xl mx-auto mt-10 bg-white p-8 rounded shadow">
  <h2 class="text-2xl font-bold mb-6 text-center text-red-600">Update Seller Profile</h2>

  <!-- Error Message -->
  <div id="error-msg" class="hidden mb-4 text-sm text-red-600 bg-red-100 px-4 py-2 rounded"></div>

  <form id="sellerForm" action="UpdateSellerServlet" method="post" class="space-y-4" onsubmit="return validateForm()">

    <input type="hidden" id="id" name="id" value="<%=id%>" />

    <div>
      <label for="name" class="block text-sm font-medium">Name</label>
      <input type="text" id="name" name="name" value="<%=name%>" required class="w-full px-4 py-2 border rounded" />
    </div>

    <div>
      <label for="nic" class="block text-sm font-medium">NIC</label>
      <input type="text" id="nic" name="nic" value="<%=nic%>" required class="w-full px-4 py-2 border rounded" />
    </div>

    <div>
      <label for="province" class="block text-sm font-medium">Province</label>
      <select id="province" name="province" onchange="updateDistricts()" class="w-full px-4 py-2 border rounded" required>
        <option value="">Select Province</option>
        <option <%= "Western".equals(province) ? "selected" : "" %>>Western</option>
        <option <%= "Central".equals(province) ? "selected" : "" %>>Central</option>
        <option <%= "Southern".equals(province) ? "selected" : "" %>>Southern</option>
        <option <%= "Northern".equals(province) ? "selected" : "" %>>Northern</option>
        <option <%= "Eastern".equals(province) ? "selected" : "" %>>Eastern</option>
        <option <%= "North Western".equals(province) ? "selected" : "" %>>North Western</option>
        <option <%= "North Central".equals(province) ? "selected" : "" %>>North Central</option>
        <option <%= "Uva".equals(province) ? "selected" : "" %>>Uva</option>
        <option <%= "Sabaragamuwa".equals(province) ? "selected" : "" %>>Sabaragamuwa</option>
      </select>
    </div>

    <div>
      <label for="district" class="block text-sm font-medium">District</label>
      <select id="district" name="district" class="w-full px-4 py-2 border rounded" required>
        <option value="<%=district%>" selected><%=district%></option>
      </select>
    </div>

    <div>
      <label for="mobile" class="block text-sm font-medium">Mobile No</label>
      <input type="tel" id="mobile" name="mobile" value="<%=mobile%>" pattern="[0-9]{10}" required class="w-full px-4 py-2 border rounded" />
    </div>

    <div>
      <label for="email" class="block text-sm font-medium">Email</label>
      <input type="email" id="email" name="email" value="<%=email%>" required class="w-full px-4 py-2 border rounded" />
    </div>

    <div>
      <label for="password" class="block text-sm font-medium">Password</label>
      <div class="relative">
		  <input type="password" id="password" name="password" value="<%=password%>" required class="w-full px-4 py-2 border rounded pr-10" />
		</div>
    </div>

    <div>
      <label for="repassword" class="block text-sm font-medium">Re-Enter Password</label>
      <div class="relative">
		  <input type="password" id="repassword" name="repassword" value="<%=password%>" required class="w-full px-4 py-2 border rounded pr-10" />

		</div>
      
    </div>

    <div class="flex justify-center space-x-4">
      <a href="sellerDashboard.jsp" class="bg-gray-300 text-gray-800 px-6 py-2 rounded hover:bg-gray-400">Back</a>
      <button type="submit" class="bg-red-600 text-white px-6 py-2 rounded hover:bg-red-700">Update</button>
    </div>
  </form>
</div>

<!-- Scripts -->
<script>
  function validateForm() {
    const password = document.getElementById("password").value;
    const repassword = document.getElementById("repassword").value;
    const errorMsg = document.getElementById("error-msg");
    if (password !== repassword) {
      errorMsg.textContent = "Passwords do not match!";
      errorMsg.classList.remove("hidden");
      return false;
    }
    errorMsg.classList.add("hidden");
    return true;
  }

  const districtsByProvince = {
    "Western": ["Colombo", "Gampaha", "Kalutara"],
    "Central": ["Kandy", "Matale", "Nuwara Eliya"],
    "Southern": ["Galle", "Matara", "Hambantota"],
    "Northern": ["Jaffna", "Kilinochchi", "Mannar", "Vavuniya", "Mullaitivu"],
    "Eastern": ["Trincomalee", "Batticaloa", "Ampara"],
    "North Western": ["Kurunegala", "Puttalam"],
    "North Central": ["Anuradhapura", "Polonnaruwa"],
    "Uva": ["Badulla", "Moneragala"],
    "Sabaragamuwa": ["Ratnapura", "Kegalle"]
  };

  function updateDistricts() {
    const province = document.getElementById("province").value;
    const districtSelect = document.getElementById("district");
    districtSelect.innerHTML = '<option value="">Select District</option>';
    if (province && districtsByProvince[province]) {
      districtsByProvince[province].forEach(d => {
        const option = document.createElement("option");
        option.value = d;
        option.textContent = d;
        districtSelect.appendChild(option);
      });
    }
  }
  
</script>																			

</body>
</html>

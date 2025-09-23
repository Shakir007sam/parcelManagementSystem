<%@page errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Officer Home - Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
if (session == null || session.getAttribute("username") == null)
	response.sendRedirect("welcomePage.jsp");
%>

<body class="min-h-screen bg-gradient-to-br from-yellow-200 via-orange-300 to-red-300">

  <!-- Top Navigation Bar -->
  <nav class="bg-white/90 backdrop-blur-sm shadow-md px-6 py-4 flex justify-between items-center">
    <ul class="flex space-x-6 text-orange-700 font-semibold">
      <li><a href="officerHomepage.jsp" class="hover:text-orange-900">Home</a></li>
      <li><a href="officerTrackingStatus.jsp" class="hover:text-orange-900">Tracking</a></li>
      <li><a href="officerDeliveryUpdate.jsp" class="hover:text-orange-900">Delivery Status</a></li>
      <li><a href="officerPickupScheduling.jsp" class="hover:text-orange-900">Pickup Scheduling</a></li>
      <li><a href="officerBookingHistory.jsp" class="hover:text-orange-900">Previous Booking</a></li>
    </ul>
    
    <div class="flex items-center space-x-4">
    <%
			String s= session.getAttribute("username").toString();
	%>
      <span class="text-orange-800 font-semibold">Welcome, <span><%=s%></span></span>
      
      <a href="OfficerLogoutServlet" class="text-white bg-orange-600 hover:bg-orange-700 px-4 py-2 rounded-lg font-semibold transition">Logout</a>
    </div>
  </nav>
  
  <!-- Popup Message Registration Successful -->
	<%
	if (session.getAttribute("loggedin") != null) {
		session.removeAttribute("loggedin");
	%>
	<div id="popup"
		class="fixed top-11 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-green-500 text-white px-6 py-3 rounded-xl shadow-lg hidden ">
		Login Successful!</div>
	<%
	}
	%>
	
	
<!-- Popup Message Functionality -->
	<script>
	  const popup = document.getElementById("popup");
	  popup.classList.remove("hidden");
	  setTimeout(() => popup.classList.add("hidden"), 3000);
	</script>
  

  <!-- Main Content Area -->
  <main class="max-w-6xl mx-auto p-10">
    <h1 class="text-4xl font-extrabold text-orange-900 mb-6">Officer Dashboard</h1>

  <!-- Action Cards -->
  
    <section class="grid grid-cols-1 md:grid-cols-3 gap-8">
    
    <!-- Tracking -->
     <a href="officerTrackingStatus.jsp"
      class="bg-white/90 rounded-xl p-6 shadow-lg hover:shadow-xl transition">
        <h2 class="text-xl font-semibold text-orange-700 mb-2">Tracking</h2>
        <p class="text-gray-700">Monitor and update parcel tracking statuses.</p>
      </a>
      
     <!-- Delivery Status -->
     <a href="officerDeliveryUpdate.jsp"
      class="bg-white/90 rounded-xl p-6 shadow-lg hover:shadow-xl transition">
        <h2 class="text-xl font-semibold text-orange-700 mb-2">Delivery Status</h2>
        <p class="text-gray-700">View detailed delivery progress and reports.</p>
      </a>
      
      <!--  Pickup Scheduling -->
      <a href="officerPickupScheduling.jsp"
       class="bg-white/90 rounded-xl p-6 shadow-lg hover:shadow-xl transition">
        <h2 class="text-xl font-semibold text-orange-700 mb-2">Pickup Scheduling</h2>
        <p class="text-gray-700">Schedule parcel pickups efficiently.</p>
      </a>
      
      <!-- Previous Booking -->
      <a href="officerBookingHistory.jsp"
      class="bg-white/90 rounded-xl p-6 shadow-lg hover:shadow-xl transition">
        <h2 class="text-xl font-semibold text-orange-700 mb-2">Previous Booking</h2>
        <p class="text-gray-700">Review past booking details and statuses.</p>
      </a>
    </section>
  </main>

</body>
</html>

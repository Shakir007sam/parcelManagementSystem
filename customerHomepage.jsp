<%@page import="model.User" errorPage="customerErrorPage.jsp"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Customer Homepage</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
if (session == null || session.getAttribute("user") == null)
	response.sendRedirect("welcomePage.jsp");
%> 

<body
	class="min-h-screen bg-gradient-to-br from-blue-100 via-cyan-100 to-teal-100">
	<!-- Popup Message Login Successful -->
	<%
	if (session.getAttribute("loggedin") != null) {
		session.removeAttribute("loggedin");
	%>
	<div id="popup"
		class="fixed top-12 left-1/2 transform -translate-x-1/2 bg-green-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		Login Successful!</div>
	<%
	}
	%>

	<!-- Popup Message Booking Successful -->
	<%
	if (session.getAttribute("newBooking") != null) {
		session.removeAttribute("newBooking");
	%>
	<div id="popup"
		class="fixed top-12 left-1/2 transform -translate-x-1/2 bg-green-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		Booking Successful!</div>
	<%
	}
	%>

	<!-- Popup Message Functionality -->
	<script>
	  const popup = document.getElementById("popup");
	  popup.classList.remove("hidden");
	  setTimeout(() => popup.classList.add("hidden"), 3000);
	</script>


	<!-- Top Navigation Bar -->
	<header class="bg-white shadow-md">
		<div
			class="max-w-7xl mx-auto px-4 py-4 flex items-center justify-between">
			<!-- Logo / App Name -->
			<div class="text-2xl font-bold text-teal-700">Parcel Management
			</div>

			<!-- Navigation Menu -->
			<nav class="space-x-6 text-gray-700 text-sm md:text-base">
				<a href="customerHomepage.jsp"
					class="hover:text-teal-600 font-medium">Home</a> <a
					href="CustomerBookingServiceServlet"
					class="hover:text-teal-600 font-medium">Booking Service</a> <a
					href="CustomerTrackingStatusServlet"
					class="hover:text-teal-600 font-medium">Tracking</a> <a
					href="CustomerBookingHistoryServlet"
					class="hover:text-teal-600 font-medium">Previous Booking</a> <a
					href="CustomerSupportPageServlet"
					class="hover:text-teal-600 font-medium">Contact Support</a> <a
					href="CustomerLogoutServlet" class="hover:text-red-600 font-medium">Logout</a>
			</nav>

			<!-- Welcome Message -->
			<%
			User u = (User) session.getAttribute("user");
			%>
			<div class="text-sm text-gray-600 hidden md:block">
				Welcome, <span class="font-semibold text-teal-700"><%= u.getName()%> (CUSTID<%= u.getUserid() %>)</span>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<main class="max-w-6xl mx-auto px-4 py-10">
		<div class="text-center mb-10">
			<h1 class="text-3xl font-bold text-teal-700">Welcome to Your
				Dashboard</h1>
			<p class="text-gray-600 mt-2">Access your parcel services and
				manage bookings below.</p>
		</div>

		<!-- Action Cards -->
		<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">

			<!-- Booking Service -->
			<a href="CustomerBookingServiceServlet"
				class="block bg-white rounded-xl shadow hover:shadow-md transition p-6 text-center">
				<h2 class="text-xl font-semibold text-teal-700 mb-2">Booking
					Service</h2>
				<p class="text-gray-600">Book a new parcel pickup or delivery
					service.</p>
			</a>

			<!-- Tracking -->
			<a href="CustomerTrackingStatusServlet"
				class="block bg-white rounded-xl shadow hover:shadow-md transition p-6 text-center">
				<h2 class="text-xl font-semibold text-teal-700 mb-2">Track
					Parcel</h2>
				<p class="text-gray-600">Track the status of your shipped
					parcels.</p>
			</a>

			<!-- Previous Bookings -->
			<a href="CustomerBookingHistoryServlet"
				class="block bg-white rounded-xl shadow hover:shadow-md transition p-6 text-center">
				<h2 class="text-xl font-semibold text-teal-700 mb-2">Previous
					Bookings</h2>
				<p class="text-gray-600">Review your past bookings and details.</p>
			</a>

			<!-- Support -->
			<a href="CustomerSupportPageServlet"
				class="block bg-white rounded-xl shadow hover:shadow-md transition p-6 text-center">
				<h2 class="text-xl font-semibold text-teal-700 mb-2">Contact
					Support</h2>
				<p class="text-gray-600">Need help? Reach out to customer
					support.</p>
			</a>

			<!-- Logout -->
			<a href="CustomerLogoutServlet"
				class="block bg-red-100 rounded-xl shadow hover:shadow-md transition p-6 text-center">
				<h2 class="text-xl font-semibold text-red-600 mb-2">Logout</h2>
				<p class="text-gray-600">Securely logout from your account.</p>
			</a>

		</div>
	</main>
</body>
</html>

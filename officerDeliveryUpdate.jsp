<%@page errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Officer - Delivery Update</title>
<script src="https://cdn.tailwindcss.com"></script>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
if (session == null || session.getAttribute("username") == null)
	response.sendRedirect("welcomePage.jsp");
%>
</head>
<body
	class="min-h-screen bg-gradient-to-br from-yellow-200 via-orange-300 to-red-400 flex flex-col items-center py-10">
	<!-- Header -->
	<header
		class="w-full max-w-2xl bg-white rounded-xl shadow-xl p-6 mb-8 flex justify-between items-center">
		<h1 class="text-3xl font-bold text-red-700">Delivery Status
			Update</h1>
		<%
		String s = session.getAttribute("username").toString();
		%>
		<div class="text-red-700 font-semibold">
			Welcome,
			<%=s%></div>
	</header>

	<!-- Popup Message successful-->
	<%
	if (session.getAttribute("booking") != null) {
		session.removeAttribute("booking");
	%>
	<div id="popup"
		class="fixed top-11 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-green-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		Status updated successfully.</div>
	<%
	}
	%>

	<!-- Popup Message Invalid BookingID -->
	<%
	if (session.getAttribute("invalid") != null) {
		session.removeAttribute("invalid");
	%>
	<div id="popup"
		class="fixed top-11 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-red-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		Error: Invalid Booking ID</div>
	<%
	}
	%>


	<!-- Popup Message Functionality -->
	<script>
	  const popup = document.getElementById("popup");
	  popup.classList.remove("hidden");
	  setTimeout(() => popup.classList.add("hidden"), 3000);
	</script>

	<!-- Delivery Update Form -->
	<form action="OfficerDeliveryStatusServlet" method="post"
		class="w-full max-w-2xl bg-white shadow-xl rounded-xl p-8 space-y-6"
		novalidate>

		<!-- Booking ID -->
		<div>
			<label for="bookingId" class="block mb-1 font-semibold text-red-700">Booking
				ID</label> <input type="text" id="bookingId" name="bookingId" minlength="10"
				maxlength="12" placeholder="Enter 12-digit Booking ID" required
				class="w-full px-4 py-2 border border-red-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400" />

		</div>

		<!-- Delivery Status -->
		<div>
			<label for="deliveryStatus"
				class="block mb-1 font-semibold text-red-700">Delivery
				Status</label> <select id="deliveryStatus" name="deliveryStatus" required
				class="w-full px-4 py-2 border border-red-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400">
				<option value="" disabled selected>Select status</option>
				<option value="Picked up">Picked Up</option>
				<option value="In Transit">In Transit</option>
				<option value="Delivered">Delivered</option>
				<option value="Returned">Returned</option>
			</select>
		</div>

		<!-- Update Button -->
		<div>
			<button type="submit"
				class="w-full bg-red-600 text-white py-2 rounded-lg hover:bg-red-700 transition duration-200">
				Update Status</button>

		</div>
		<div class="flex justify-center mt-6 space-x-4">
			<a href="officerHomepage.jsp"
				class="w-full flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-orange-400 rounded-md shadow-sm hover:bg-orange-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500">
				&larr; Back </a>
		</div>


	</form>

</body>
</html>

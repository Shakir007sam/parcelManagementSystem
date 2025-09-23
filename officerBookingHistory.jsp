<%@page import="model.Booking"%>
<%@page import="java.util.*" errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Officer - Booking History</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body
	class="min-h-screen bg-gradient-to-br from-yellow-200 via-orange-300 to-red-400 flex flex-col items-center py-10">
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0); // Proxies.
	if (session == null || session.getAttribute("username") == null)
		response.sendRedirect("welcomePage.jsp");
	%>


	<!-- Popup Message Invalid BookingID -->
	<%
	if (session.getAttribute("invalid") != null) {
		session.removeAttribute("invalid");
	%>
	<div id="popup"
		class="fixed top-11 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-red-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		Error: Invalid Customer ID.</div>
	<%
	}
	%>


	<!-- Popup Message Functionality -->
	<script>
	  const popup = document.getElementById("popup");
	  popup.classList.remove("hidden");
	  setTimeout(() => popup.classList.add("hidden"), 3000);
	</script>


	<!-- Header -->
	<header
		class="w-full max-w-6xl bg-white rounded-xl shadow-xl p-6 mb-6 flex justify-between items-center">
		<h1 class="text-3xl font-bold text-red-700">Booking History</h1>
		<div class="flex items-center space-x-4">
			<%
			String s = session.getAttribute("username").toString();
			%>
			<span class="text-red-700 font-semibold">Welcome, <%=s%></span>

		</div>
	</header>

	<!-- Search Filters -->
	<section
		class="w-full max-w-6xl bg-white rounded-xl shadow-xl p-6 mb-6">
		<form action="OfficerPreviousBookingServlet" method="post"
			class="flex flex-wrap gap-6 items-end" novalidate>
			<div class="flex flex-col w-64">
				<label for="customerId" class="mb-1 font-semibold text-red-700">Customer
					ID</label> <input type="text" id="customerId" name="customerId"
					placeholder="Enter Customer ID"
					class="px-4 py-2 border border-red-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400" />
			</div>

			<div>
				<button type="submit"
					class="bg-red-600 text-white px-6 py-2 rounded-lg hover:bg-red-700 transition duration-200">
					Search</button>
			</div>
		</form>
	</section>

	<!-- Booking History Table -->
	<section
		class="w-full max-w-6xl bg-white rounded-xl shadow-xl p-6 overflow-x-auto">
		<table
			class="min-w-full border-collapse border border-red-300 text-left">
			<thead class="bg-red-100">
				<tr>
					<th class="border border-red-300 px-4 py-2">Customer ID</th>
					<th class="border border-red-300 px-4 py-2">Booking ID</th>
					<th class="border border-red-300 px-4 py-2">Booking Date</th>
					<th class="border border-red-300 px-4 py-2">Receiver Name</th>
					<th class="border border-red-300 px-4 py-2">Delivered Address</th>
					<th class="border border-red-300 px-4 py-2">Amount</th>
					<th class="border border-red-300 px-4 py-2">Status</th>
				</tr>
			</thead>

			<%
			ArrayList<Booking> b = (ArrayList<Booking>) session.getAttribute("bookings");
			if (b != null) {
				for (Booking x : b) {
			%>

			<tbody>
				<!-- Sample row -->
				<tr class="hover:bg-red-50">
					<td class="border border-red-300 px-4 py-2"><%=x.getUserId()%></td>
					<td class="border border-red-300 px-4 py-2"><%=x.getBookingId()%></td>
					<td class="border border-red-300 px-4 py-2"><%=x.getParcelPaymentTime()%></td>
					<td class="border border-red-300 px-4 py-2"><%=x.getReceiverName()%></td>
					<td class="border border-red-300 px-4 py-2"><%=x.getReceiverAddress()%></td>
					<td class="border border-red-300 px-4 py-2"><%=x.getParcelServiceCost()%></td>
					<td class="border border-red-300 px-4 py-2"><%=x.getParcelStatus()%></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr class="hover:bg-red-50">
					<td class="border border-red-300 px-4 py-2"></td>
					<td class="border border-red-300 px-4 py-2"></td>
					<td class="border border-red-300 px-4 py-2"></td>
					<td class="border border-red-300 px-4 py-2"></td>
					<td class="border border-red-300 px-4 py-2"></td>
					<td class="border border-red-300 px-4 py-2"></td>
					<td class="border border-red-300 px-4 py-2"></td>
				</tr>
				<%
				}
				%>
				<!-- More rows as needed -->
			</tbody>


		</table>

		<div class="flex justify-center mt-6 space-x-4">
			<a href="officerHomepage.jsp"
				class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-orange-400 rounded-md shadow-sm hover:bg-orange-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500">
				&larr; Back </a>
			<%
			session.removeAttribute("bookings");
			%>
		</div>
	</section>



</body>
</html>

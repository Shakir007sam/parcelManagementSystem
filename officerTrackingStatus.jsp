<%@page import="model.Booking"%>
<%@page errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Officer - Tracking Status</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body
	class="min-h-screen bg-gradient-to-br from-yellow-200 via-orange-300 to-red-400 flex flex-col items-center py-10">


	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // this works in HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setHeader("Expires", "0"); // Proxies
	if (session == null || session.getAttribute("username") == null)
		response.sendRedirect("welcomePage.jsp");
	%>

	<!-- Header -->
	<header
		class="w-full max-w-4xl bg-white rounded-xl shadow-xl p-6 mb-8 flex justify-between items-center">
		<h1 class="text-3xl font-bold text-red-700">Tracking Status</h1>
		<%
		String s = session.getAttribute("username").toString();
		%>
		<div class="text-red-700 font-semibold">
			Welcome,
			<%=s%></div>
	</header>

	<!-- Popup Message Invalid Username or Password -->
	<%
	if (session.getAttribute("invalid") != null) {
		session.removeAttribute("invalid");
	%>
	<div id="popup"
		class="fixed top-11 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-red-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		Invalid Credentials!</div>
	<%
	}
	%>

	<!-- Popup Message Functionality -->
	<script>
	  const popup = document.getElementById("popup");
	  popup.classList.remove("hidden");
	  setTimeout(() => popup.classList.add("hidden"), 3000);
	</script>


	<!-- Search Form -->
	<form action="OfficerTrackingStatusServlet" method="post"
		class="w-full max-w-4xl bg-white shadow-xl rounded-xl p-8 mb-8">

		<div class="grid grid-cols-1 md:grid-cols-3 gap-6 items-end">

			<div>
				<label for="customerId"
					class="block mb-1 font-semibold text-red-700">Customer ID
					(CUSTID)</label> <input type="text" id="customerId" name="customerId"
					minlength="5" maxlength="20"
					placeholder="Enter last 5 Digit of Customer ID" required
					class="w-full px-4 py-2 border border-red-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400" />
			</div>

			<div>
				<label for="bookingId" class="block mb-1 font-semibold text-red-700">Booking
					ID (BK)</label> <input type="text" id="bookingId" name="bookingId"
					minlength="10" maxlength="12"
					placeholder="Enter last 10-digit of Booking ID" required
					class="w-full px-4 py-2 border border-red-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400" />
			</div>

			<div>
				<button type="submit"
					class="w-full bg-red-600 text-white py-2 rounded-lg hover:bg-red-700 transition duration-200">
					Search</button>
			</div>
		</div>
	</form>

	<!-- Package List -->
	<section class="w-full max-w-4xl bg-white rounded-xl shadow-xl p-8">
		<h2 class="text-xl font-bold text-red-700 mb-6">Shipped Packages
			(Latest on Top)</h2>

		<div class="overflow-x-auto">
			<table class="min-w-full border border-red-300 rounded-lg">
				<thead class="bg-red-100 text-red-700 font-semibold">
					<tr>
						<th class="py-3 px-4 border-b border-red-300 text-left">Booking
							ID</th>
						<th class="py-3 px-4 border-b border-red-300 text-left">Customer
							ID</th>
						<th class="py-3 px-4 border-b border-red-300 text-left">Receiver
							Name</th>
						<th class="py-3 px-4 border-b border-red-300 text-left">Status</th>
						<th class="py-3 px-4 border-b border-red-300 text-left">Last
							Updated</th>
					</tr>
				</thead>
				<%
				Booking b = (Booking) session.getAttribute("booking");
				if (b != null) {
				%>
				<tbody class="text-red-800">
					<tr class="border-b border-red-200 hover:bg-red-50">
						<td class="py-2 px-4">BK<%=b.getBookingId()%></td>
						<td class="py-2 px-4">CUSTID<%=b.getUserId()%></td>
						<td class="py-2 px-4"><%=b.getReceiverName()%></td>
						<td class="py-2 px-4"><%=b.getParcelStatus()%></td>
						<td class="py-2 px-4"><%=b.getParcelLastUpdateTime()%></td>
					</tr>
				</tbody>
				<%
				} else {
				%>
				<tbody class="text-red-800">
					<tr class="border-b border-red-200 hover:bg-red-50">
						<td class="py-2 px-4"></td>
						<td class="py-2 px-4"></td>
						<td class="py-2 px-4"></td>
						<td class="py-2 px-4"></td>
						<td class="py-2 px-4"></td>
					</tr>
				</tbody>
				<%
				}
				%>
				<!-- More rows as needed -->
			</table>
			<div class="flex justify-center mt-6 space-x-4">
				<a href="officerHomepage.jsp"
					class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-orange-400 rounded-md shadow-sm hover:bg-orange-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500">
					&larr; Back </a>
				<%
				session.removeAttribute("booking");
				%>
			</div>
		</div>
	</section>
</body>
</html>

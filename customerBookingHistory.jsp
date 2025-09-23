<%@page import="model.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User" errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Booking History - Parcel Management</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
if (session == null || session.getAttribute("user") == null) {
	response.sendRedirect("welcomePage.jsp");
}
%>
<body class="bg-gray-50 min-h-screen flex flex-col">

	<!-- Top Bar -->
	<header
		class="bg-teal-600 text-white flex justify-between items-center px-6 py-4 shadow-md">
		<h1 class="text-2xl font-semibold">Booking History</h1>
		<div class="flex items-center space-x-4">
			<%
			User u = (User) session.getAttribute("user");
			%>
			<span>Welcome, <strong><%=u.getName()%></strong> (CUSTID<%= u.getUserid() %>)</span>
			<form action="CustomerLogoutServlet">
				<button type="submit"
					class="bg-teal-800 hover:bg-teal-700 px-3 py-1 rounded-md font-semibold transition">
					Logout</button>
			</form>
		</div>
	</header>

	<!-- Main Content -->
	<main class="flex-grow p-8 max-w-7xl mx-auto">
		<div class="bg-white rounded-lg shadow-lg p-6">
			<h2 class="text-xl font-bold text-teal-700 mb-6 text-center">Previous
				Bookings</h2>

			<div class="overflow-x-auto">
				<table class="min-w-full divide-y divide-gray-200 text-gray-700">
					<thead class="bg-teal-100 text-teal-800">
						<tr>
							<th class="px-4 py-3 text-left text-sm font-semibold">Customer
								ID</th>
							<th class="px-4 py-3 text-left text-sm font-semibold">Booking
								ID</th>
							<th class="px-4 py-3 text-left text-sm font-semibold">Booking
								Date</th>
							<th class="px-4 py-3 text-left text-sm font-semibold">Receiver
								Name</th>
							<th class="px-4 py-3 text-left text-sm font-semibold">Delivered
								Address</th>
							<th class="px-4 py-3 text-left text-sm font-semibold">Amount</th>
							<th class="px-4 py-3 text-left text-sm font-semibold">Status</th>
						</tr>
					</thead>
					<%
					ArrayList<Booking> pb = (ArrayList<Booking>) session.getAttribute("bookings");
					for (Booking b : pb) {
					%>
					<tbody class="divide-y divide-gray-200">
						<tr class="hover:bg-teal-50">
							<td class="px-4 py-2 whitespace-nowrap">CUSTID<%=b.getUserId()%></td>
							<td class="px-4 py-2 whitespace-nowrap">BK<%=b.getBookingId()%></td>
							<td class="px-4 py-2 whitespace-nowrap"><%=b.getParcelPaymentTime()%></td>
							<td class="px-4 py-2 whitespace-nowrap"><%=b.getReceiverName()%></td>
							<td class="px-4 py-2 whitespace-nowrap"><%=b.getReceiverAddress()%></td>
							<td class="px-4 py-2 whitespace-nowrap">&#8377; <%=b.getParcelServiceCost()%></td>
							<td
								class="px-4 py-2 whitespace-nowrap text-green-600 font-semibold"><%=b.getParcelStatus()%></td>
						</tr>
					</tbody>
					<%
					}
					%>
				</table>
			</div>

			<!-- Pagination Buttons -->
			<div class="flex justify-center mt-6 space-x-4">
				<a href="customerHomepage.jsp"
					class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-teal-500 rounded-md shadow-sm hover:bg-teal-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500">
					&larr; Back </a>
			</div>
		</div>
	</main>

</body>
</html>

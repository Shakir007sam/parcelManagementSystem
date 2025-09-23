<%@page import="model.User" errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Customer Support - Parcel Management</title>
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
		<h1 class="text-2xl font-semibold">Customer Support</h1>
		<div class="flex items-center space-x-4">
			<%
			User u = (User) session.getAttribute("user");
			%>
			<span>Welcome, <strong><%= u.getName()%> </strong> (CUSTID<%= u.getUserid() %>)</span>
			<form action="CustomerLogoutServlet">
				<button type="submit"
					class="bg-teal-800 hover:bg-teal-700 px-3 py-1 rounded-md font-semibold transition">
					Logout</button>
			</form>
		</div>
	</header>

	<!-- Main Content -->
	<main class="flex-grow flex items-center justify-center p-8">
		<div class="bg-white rounded-lg shadow-lg max-w-lg w-full p-8">
			<h2 class="text-xl font-bold text-teal-700 mb-6 text-center">Get
				in Touch with Customer Support</h2>

			<div class="space-y-6 text-gray-700">
				<div>
					<h3 class="font-semibold text-lg mb-1">Contact Number</h3>
					<p>+1-800-123-4567</p>
				</div>

				<div>
					<h3 class="font-semibold text-lg mb-1">Email</h3>
					<p>support@parcelmanagement.com</p>
				</div>

				<div>
					<h3 class="font-semibold text-lg mb-1">Address</h3>
					<p>1234 Parcel St., Delivery City, Country 56789</p>
				</div>
				<div class="flex justify-center mt-6 space-x-4">
					<a href="customerHomepage.jsp"
						class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-teal-500 rounded-md shadow-sm hover:bg-teal-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500">
						&larr; Back </a>
				</div>
			</div>
		</div>
	</main>

</body>
</html>

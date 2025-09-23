
<%@page import="model.Booking"%>
<%@page import="model.User" errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Invoice - Parcel Management System</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
@media print {
	body * {
		visibility: hidden;
	}
	#invoice, #invoice * {
		visibility: visible;
	}
	#invoice {
		position: absolute;
		left: 0;
		top: 0;
		width: 100%;
	}
	#printButton {
		display: none;
	}
}
</style>
</head>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
if (session == null || session.getAttribute("user") == null) {
	response.sendRedirect("welcomePage.jsp");
}
%>

<body
	class="bg-gray-50 min-h-screen flex flex-col items-center py-10 px-4">

	<main id="invoice"
		class="bg-white shadow-lg rounded-lg max-w-3xl w-full p-8">

		<header class="mb-8 text-center">
			<h1 class="text-4xl font-bold text-teal-700">Payment Invoice</h1>
			<p class="text-gray-600 mt-2">Thank you for your payment!</p>
		</header>
		<%
		User u = (User) session.getAttribute("user");
		Booking b = (Booking) session.getAttribute("newBooking");
		if (b != null && u != null) {
		%>
		<section class="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-700">

			<div>
				<h2 class="font-semibold text-lg border-b border-teal-400 pb-1 mb-4">Receiver
					Information</h2>
				<p>
					<strong>Name:</strong> <span><%=b.getReceiverName()%></span>
				</p>
				<p>
					<strong>Address:</strong> <span><%=b.getReceiverAddress()%></span>
				</p>
				<p>
					<strong>Pin:</strong> <span><%=b.getReceiverPin()%></span>
				</p>
				<p>
					<strong>Mobile:</strong> <span><%=b.getReceiverMobile()%></span>
				</p>
			</div>

			<div>
				<h2 class="font-semibold text-lg border-b border-teal-400 pb-1 mb-4">Parcel
					Details</h2>
				<p>
					<strong>Weight:</strong> <span><%=b.getParcelWeight()%> g</span>
				</p>
				<p>
					<strong>Contents Description:</strong> <span><%=b.getParcelContent()%></span>
				</p>
				<p>
					<strong>Delivery Type:</strong> <span><%=b.getParcelDelivery()%></span>
				</p>
				<p>
					<strong>Packing Preference:</strong> <span><%=b.getParcelPacking()%></span>
				</p>
			</div>

			<div>
				<h2 class="font-semibold text-lg border-b border-teal-400 pb-1 mb-4">Schedule</h2>
				<p>
					<strong>Pickup Time:</strong> <span><%=b.getParcelPick()%></span>
				</p>
				<p>
					<strong>Dropoff Time:</strong> <span><%=b.getParcelDrop()%></span>
				</p>
			</div>

			<div>
				<h2 class="font-semibold text-lg border-b border-teal-400 pb-1 mb-4">Payment
					Info</h2>
				<p>
					<strong>Service Cost:</strong> <span>&#8377; <%=b.getParcelServiceCost()%></span>
				</p>
				<p>
					<strong>Payment Time:</strong> <span><%=b.getParcelPaymentTime()%></span>
				</p>
			</div>

		</section>

		<%
		}
		%>

		<div class="mt-10 text-center">
			<button id="backButton"
				onclick="window.location.href='customerHomepage.jsp';"
				class="bg-teal-500 hover:bg-teal-700 text-white font-semibold px-8 py-3 rounded shadow-md transition">
				&larr; Back</button>
			<button id="printButton" onclick="window.print()"
				class="bg-teal-600 hover:bg-teal-700 text-white font-semibold px-8 py-3 rounded shadow-md transition">
				Print Invoice</button>

		</div>
	</main>
</body>

</html>

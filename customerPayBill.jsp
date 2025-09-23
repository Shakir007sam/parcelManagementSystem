<%@page import="model.Booking"%>
<%@page import="model.User" errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Pay Bill - Parcel Management System</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
if (session == null || session.getAttribute("user") == null) {
	response.sendRedirect("welcomePage.jsp");
}

User u = (User) session.getAttribute("user");
Booking b = (Booking) session.getAttribute("debitCardPayment");
%>
<body
	class="bg-gradient-to-br from-blue-100 via-cyan-100 to-teal-100 min-h-screen flex flex-col">

	<!-- Header with Welcome and Logout -->
	<header
		class="flex justify-between items-center bg-white shadow-md px-8 py-4">
		<div class="text-teal-700 font-semibold text-lg">
			Welcome, <span id="username"><%=u.getName()%> (CUSTID<%=u.getUserid()%>)</span>
		</div>
		<button disabled
			class="bg-red-500 text-white px-4 py-2 rounded cursor-not-allowed opacity-50"
			title="Logout disabled for demo">Logout</button>
	</header>

	<main
		class="flex-grow max-w-3xl mx-auto bg-white rounded-xl shadow-lg p-8 mt-10">

		<!-- Payment Details Section -->
		<section id="payment-main">
			<h1 class="text-3xl font-bold text-teal-700 mb-6">Pay Your Bill</h1>

				<div>
					<label class="block font-medium text-gray-700 mb-1"
						for="billAmount">Bill Amount (&#8377;)</label> <div
						class="w-full border rounded px-4 py-2 bg-gray-100 text-gray-600" ><%= b.getParcelServiceCost() %></div>
						
				</div>
		</section>

		<!-- Credit Card Payment Section (for visual, not functional) -->
		<section id="cardPayment"
			class="mt-10 bg-gray-50 p-6 rounded-lg shadow-inner">

			<h2 class="text-2xl font-semibold text-teal-700 mb-4">Debit Card
				Payment</h2>
			<form action="CustomerPaymentServlet" method="post" class="space-y-5" novalidate>

				<div>
					<label for="cardNumber"
						class="block font-medium text-gray-700 mb-1">Card Number</label> <input
						type="text" id="cardNumber" name="cardNumber" maxlength="16"
						placeholder="16-digit card number" pattern="\d{16}" required
						class="w-full border rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-teal-400" />
					<p class="text-red-600 text-sm mt-1 hidden">Please enter a
						valid 16-digit card number.</p>
				</div>

				<div>
					<label for="cardHolder"
						class="block font-medium text-gray-700 mb-1">Card Holder
						Name</label> <input type="text" id="cardHolder" name="cardHolder"
						maxlength="50" placeholder="Name on card" required
						class="w-full border rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-teal-400" />
					<p class="text-red-600 text-sm mt-1 hidden">Please enter the
						card holder's name.</p>
				</div>

				<div class="grid grid-cols-2 gap-6">
					<div>
						<label for="expiryDate"
							class="block font-medium text-gray-700 mb-1">Expiry Date
							(MM/YY)</label> <input type="text" id="expiryDate" name="expiryDate"
							maxlength="5" placeholder="MM/YY"
							pattern="^(0[1-9]|1[0-2])\/\d{2}$" required
							class="w-full border rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-teal-400" />
						<p class="text-red-600 text-sm mt-1 hidden">Enter expiry in
							MM/YY format.</p>
					</div>
					<div>
						<label for="cvv" class="block font-medium text-gray-700 mb-1">CVV</label>
						<input type="password" id="cvv" name="cvv" maxlength="3"
							placeholder="3-digit CVV" pattern="\d{3}" required
							class="w-full border rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-teal-400" />
						<p class="text-red-600 text-sm mt-1 hidden">Enter a valid
							3-digit CVV.</p>
					</div>
				</div>

				<div class="flex justify-between mt-8">
					<button type="button" id="backButton"
						onclick="window.location.href='customerBookingService.jsp';"
						class="bg-teal-500 hover:bg-teal-700 text-white font-semibold px-8 py-3 rounded shadow-md transition">
						&larr; Back</button>
					<button type="reset"
						class="bg-gray-300 text-gray-700 px-6 py-2 rounded hover:bg-gray-400 transition">Reset</button>
					<button type="submit"
						class="bg-teal-600 text-white px-6 py-2 rounded hover:bg-teal-700 transition">Make
						Payment</button>
				</div>

			</form>

		</section>

	</main>
</body>
</html>

<%@page import="model.User" errorPage="customerErrorPage.jsp"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Customer Booking Service</title>
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
 

<body
	class="bg-gradient-to-br from-blue-100 via-cyan-100 to-teal-100 py-10 px-4">
	<!-- Popup Message Booking Unsuccessful -->
	<%
	if (session.getAttribute("booking failed") != null) {
		session.removeAttribute("booking failed");
	%>
	<div id="popup"
		class="fixed top-12 left-1/2 transform -translate-x-1/2 bg-red-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		Booking Unsuccessful!</div>
	<%
	}
	%>

	<!-- Popup Message Functionality -->
	<script>
	  const popup = document.getElementById("popup");
	  popup.classList.remove("hidden");
	  setTimeout(() => popup.classList.add("hidden"), 3000);
	</script>

	<div
		class="max-w-5xl mx-auto bg-white rounded-xl shadow-lg p-8 space-y-8">
		<a href="customerHomepage.jsp"
			class="inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-teal-500 rounded-md shadow-sm hover:bg-teal-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500">
			&larr; Back </a>
		<div class="text-center">
			<h1 class="text-3xl font-bold text-teal-700">Book Parcel Service</h1>
			<p class="text-gray-600 mt-1">Fill in the required details to
				proceed</p>
		</div>

		<form action="CustomerBookingServiceServlet" method="post"
			class="space-y-8" novalidate>

			<!-- 1. Sender Information -->
			<%
			User u = (User) session.getAttribute("user");
			%>
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">1. Sender
					Information</h2>
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<div>
						<label class="block mb-1 font-medium text-gray-700">Name</label> <input
							type="text" readonly value="<%=u.getName()%>"
							class="w-full bg-gray-100 px-4 py-2 border rounded-lg text-gray-600" />
					</div>
					<div>
						<label class="block mb-1 font-medium text-gray-700">Contact</label>
						<input type="text" readonly value="<%=u.getMobile()%>"
							class="w-full bg-gray-100 px-4 py-2 border rounded-lg text-gray-600" />
					</div>
					<div class="md:col-span-2">
						<label class="block mb-1 font-medium text-gray-700">Address</label>
						<textarea readonly
							class="w-full bg-gray-100 px-4 py-2 border rounded-lg text-gray-600"
							rows="2"><%=u.getAddress()%></textarea>
					</div>
				</div>
			</div>

			<!-- 2. Receiver Information -->
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">2.
					Receiver Information</h2>
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<div>
						<label class="block mb-1 font-medium text-gray-700">Name<span
							style="color: red;" class="red required-asterisk"> *</span></label> <input
							type="text" name="receiverName"
							class="required-asterisk w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-teal-400" />
					</div>
					<div>
						<label class="block mb-1 font-medium text-gray-700">Contact<span
							style="color: red;" class="red required-asterisk"> *</span></label> <input
							type="text" name="receiverContact" pattern="[0-9]{10}"
							maxlength="10"
							class="required-asterisk w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-teal-400"
							oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 10)" />
					</div>
					<div class="md:col-span-2">
						<label class="block mb-1 font-medium text-gray-700">Address<span
							style="color: red;" class="red required-asterisk"> *</span></label>
						<textarea name="receiverAddress"
							class="required-asterisk w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-teal-400"
							rows="2"></textarea>
					</div>
					<div>
						<label class="block mb-1 font-medium text-gray-700">Pin
							Code<span style="color: red;" class="red required-asterisk">
								*</span>
						</label> <input type="text" name="receiverPincode" pattern="[0-9]{6}"
							maxlength="6"
							class="required-asterisk w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-teal-400"
							oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 6)" />

					</div>
				</div>
			</div>

			<!-- 3. Parcel Details -->
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">3. Parcel
					Details</h2>
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<div>
						<label
							class="required-asterisk block mb-1 font-medium text-gray-700">Weight
							(in grams)<span style="color: red;" class="red required-asterisk">
								*</span>
						</label> <input type="number" name="weight" id="weight" step="0.01"
							min="0" placeholder="e.g., 500.25"
							class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-teal-400"
							oninput="calculateCost()" />
					</div>
					<div>
						<label
							class="required-asterisk block mb-1 font-medium text-gray-700">Contents
							Description<span style="color: red;"
							class="red required-asterisk"> *</span>
						</label> <input type="text" name="contents"
							class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-teal-400" />
					</div>
				</div>
			</div>

			<!-- 4. Shipping Options -->
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">4.
					Shipping Options</h2>
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<div>
						<label
							class="required-asterisk block mb-1 font-medium text-gray-700">Delivery
							Speed<span style="color: red;" class="red required-asterisk">
								*</span>
						</label> <select name="deliverySpeed" id="deliverySpeed"
							onchange="calculateCost()">
							<option value="">Select option</option>
							<option value="Standard">Standard</option>
							<option value="Express">Express</option>
						</select>
					</div>
					<div>
						<label
							class="required-asterisk block mb-1 font-medium text-gray-700">Packaging
							Preference<span style="color: red;" class="red required-asterisk">
								*</span>
						</label> <select name="packaging" id="packaging"
							onchange="calculateCost()">
							<option value="">Select option</option>
							<option value="Standard Packaging">Standard Packaging</option>
							<option value="Custom Packaging">Custom Packaging</option>
							<option value="Eco-friendly Packaging">Eco-friendly
								Packaging</option>
							<option value="Fragile Item Handling">Fragile Item
								Handling</option>
						</select>
					</div>
				</div>
			</div>

			<!-- 5. Date and Time Selection -->
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">5. Date &
					Time Selection</h2>
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<div>
						<label class="block mb-1 font-medium text-gray-700">Pickup
							Date & Time<span style="color: red;"
							class="red required-asterisk"> *</span>
						</label> <input type="datetime-local" name="pickupTime"
							class="required-asterisk w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-teal-400" />
					</div>
					<div>
						<label class="block mb-1 font-medium text-gray-700">Drop-off
							Date & Time<span style="color: red;"
							class="red required-asterisk"> *</span>
						</label> <input type="datetime-local" name="dropoffTime"
							class="required-asterisk w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-teal-400" />
					</div>
				</div>
			</div>

			<!-- 6. Service Cost & Payment -->
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">6. Service
					Cost & Payment</h2>
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<div>
						<label class="block mb-1 font-medium text-gray-700">Estimated
							Cost (&#8377;)</label> <input type="text" id="estimatedCost"
							name="estimatedCost"
							class="w-full bg-gray-100 px-4 py-2 border rounded-lg text-gray-600" />
					</div>
					<div>
						<label class="block mb-1 font-medium text-gray-700">Payment
							Method<span style="color: red;" class="red required-asterisk">
								*</span>
						</label> <select name="paymentMethod" id="paymentMethod"
							onchange="calculateCost()" required-asterisk>
							<option value="">Select</option>
							<option>Debit Card</option>
							<option>Cash on Pickup</option>
						</select>
					</div>
				</div>
			</div>

			<!-- 7. Additional Services -->
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">7.
					Additional Services</h2>
				<div class="space-y-2">
					<div class="flex items-center">
						<input type="checkbox" id="insurance" name="insurance"
							class="mr-2" /> <label for="insurance" class="text-gray-700">Add
							Insurance</label>
					</div>
					<div class="flex items-center">
						<input type="checkbox" id="tracking" name="tracking" class="mr-2" />
						<label for="tracking" class="text-gray-700">Enable
							Tracking Services</label>
					</div>
				</div>
			</div>

			<!-- Submit Button -->
			<div class="flex justify-end space-x-4 pt-6">
				<button type="reset"
					class="px-6 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400">Reset</button>
				<button type="submit"
					class="px-6 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700">Submit
					Booking</button>
			</div>

		</form>
	</div>
	<script>
  function calculateCost() {
    const weight = parseFloat(document.getElementById("weight").value) || 0;
    const delivery = document.getElementById("deliverySpeed").value;
    const packaging = document.getElementById("packaging").value;
    const payment = document.getElementById("paymentMethod").value;

    let baseCost = Math.max(50, weight * 0.5); // ₹0.5/gm, min ₹50

    // Delivery speed cost
    if (delivery === "express") {
      baseCost += 100;
    }

    // Packaging cost
    switch (packaging) {
      case "Fragile Item Handling":
        baseCost += 50;
        break;
      case "Eco-friendly Packaging":
        baseCost += 30;
        break;
      case "Custom Packaging":
        baseCost += 40;
        break;
      default: // Standard Packaging
        baseCost += 0;
    }

    // Payment method surcharge
    if (payment === "Cash on Pickup") {
      baseCost += 10;
    }

    document.getElementById("estimatedCost").value = Math.round(baseCost);
  }

  // Optional: Call once on load if values are pre-filled
  document.addEventListener("DOMContentLoaded", calculateCost);
</script>

</body>
</html>

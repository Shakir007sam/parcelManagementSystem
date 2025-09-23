<%@page errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Officer Booking Service</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0); // Proxies.
	if (session == null || session.getAttribute("username") == null)
		response.sendRedirect("welcomePage.jsp");
	%>
</head>
<body class="min-h-screen bg-gradient-to-br from-yellow-200 via-orange-300 to-red-300">

  <!-- Navigation Bar -->
  <nav class="bg-white/90 backdrop-blur-sm shadow-md px-6 py-4 flex justify-between items-center">
    <ul class="flex space-x-6 text-orange-700 font-semibold">
      <li><a href="#" class="hover:text-orange-900">Home</a></li>
      <li><a href="#" class="hover:text-orange-900">Tracking</a></li>
      <li><a href="#" class="hover:text-orange-900">Delivery Status</a></li>
      <li><a href="#" class="hover:text-orange-900">Pickup Scheduling</a></li>
      <li><a href="#" class="hover:text-orange-900">Previous Booking</a></li>
    </ul>
    <div class="flex items-center space-x-4">
      <span class="text-orange-800 font-semibold">Welcome, <span class="underline">OfficerName</span></span>
      <a href="#" class="text-white bg-orange-600 hover:bg-orange-700 px-4 py-2 rounded-lg font-semibold transition">Logout</a>
    </div>
  </nav>

  <!-- Booking Service Form -->
  <main class="max-w-4xl mx-auto p-8 bg-white/90 rounded-xl shadow-lg mt-10">

    <h1 class="text-3xl font-extrabold text-orange-800 mb-8">Parcel Booking Service</h1>

    <form>
      <!-- 1. Sender Information -->
      <fieldset class="mb-8 border border-orange-300 rounded-lg p-6">
        <legend class="text-xl font-semibold text-orange-700 mb-4">Sender Information</legend>
        <div class="space-y-4">
          <div>
            <label for="senderName" class="block font-semibold text-orange-900 mb-1">Name</label>
            <input type="text" id="senderName" name="senderName" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" maxlength="50" required />
          </div>
          <div>
            <label for="senderAddress" class="block font-semibold text-orange-900 mb-1">Address</label>
            <textarea id="senderAddress" name="senderAddress" rows="3" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" required></textarea>
          </div>
          <div>
            <label for="senderContact" class="block font-semibold text-orange-900 mb-1">Contact Details</label>
            <input type="tel" id="senderContact" name="senderContact" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" minlength="10" maxlength="15" required />
          </div>
        </div>
      </fieldset>

      <!-- 2. Receiver Information -->
      <fieldset class="mb-8 border border-orange-300 rounded-lg p-6">
        <legend class="text-xl font-semibold text-orange-700 mb-4">Receiver Information</legend>
        <div class="space-y-4">
          <div>
            <label for="receiverName" class="block font-semibold text-orange-900 mb-1">Name</label>
            <input type="text" id="receiverName" name="receiverName" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" maxlength="50" required />
          </div>
          <div>
            <label for="receiverAddress" class="block font-semibold text-orange-900 mb-1">Address</label>
            <textarea id="receiverAddress" name="receiverAddress" rows="3" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" required></textarea>
          </div>
          <div>
            <label for="receiverPin" class="block font-semibold text-orange-900 mb-1">Pin Code</label>
            <input type="text" id="receiverPin" name="receiverPin" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" pattern="\d{5,10}" maxlength="10" required />
          </div>
          <div>
            <label for="receiverContact" class="block font-semibold text-orange-900 mb-1">Contact Details</label>
            <input type="tel" id="receiverContact" name="receiverContact" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" minlength="10" maxlength="15" required />
          </div>
        </div>
      </fieldset>

      <!-- 3. Parcel Details -->
      <fieldset class="mb-8 border border-orange-300 rounded-lg p-6">
        <legend class="text-xl font-semibold text-orange-700 mb-4">Parcel Details</legend>
        <div class="space-y-4">
          <div>
            <label for="parcelSizeWeight" class="block font-semibold text-orange-900 mb-1">Size and Weight</label>
            <input type="text" id="parcelSizeWeight" name="parcelSizeWeight" placeholder="E.g., 30x20x15 cm, 2 kg" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" required />
          </div>
          <div>
            <label for="parcelContents" class="block font-semibold text-orange-900 mb-1">Contents Description</label>
            <textarea id="parcelContents" name="parcelContents" rows="3" placeholder="For tracking and safety" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" required></textarea>
          </div>
        </div>
      </fieldset>

      <!-- 4. Shipping Options -->
      <fieldset class="mb-8 border border-orange-300 rounded-lg p-6">
        <legend class="text-xl font-semibold text-orange-700 mb-4">Shipping Options</legend>
        <div class="space-y-4">
          <div>
            <label for="deliverySpeed" class="block font-semibold text-orange-900 mb-1">Choose Delivery Speed</label>
            <select id="deliverySpeed" name="deliverySpeed" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" required>
              <option value="" disabled selected>Select speed</option>
              <option value="standard">Standard</option>
              <option value="express">Express</option>
              <option value="overnight">Overnight</option>
            </select>
          </div>
          <div>
            <label class="block font-semibold text-orange-900 mb-2">Packaging Preferences</label>
            <div class="space-y-2">
              <label class="inline-flex items-center">
                <input type="radio" name="packaging" value="standard" class="form-radio text-orange-600" required />
                <span class="ml-2">Standard Packaging</span>
              </label>
              <label class="inline-flex items-center">
                <input type="radio" name="packaging" value="custom" class="form-radio text-orange-600" />
                <span class="ml-2">Custom Packaging</span>
              </label>
              <label class="inline-flex items-center">
                <input type="radio" name="packaging" value="eco" class="form-radio text-orange-600" />
                <span class="ml-2">Eco-friendly Packaging</span>
              </label>
              <label class="inline-flex items-center">
                <input type="radio" name="packaging" value="fragile" class="form-radio text-orange-600" />
                <span class="ml-2">Fragile Item Handling</span>
              </label>
            </div>
          </div>
        </div>
      </fieldset>

      <!-- 5. Date and Time Selection -->
      <fieldset class="mb-8 border border-orange-300 rounded-lg p-6">
        <legend class="text-xl font-semibold text-orange-700 mb-4">Date and Time Selection</legend>
        <div class="space-y-4">
          <div>
            <label for="pickupDateTime" class="block font-semibold text-orange-900 mb-1">Preferred Pickup Time</label>
            <input type="datetime-local" id="pickupDateTime" name="pickupDateTime" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" required />
          </div>
          <div>
            <label for="dropoffDateTime" class="block font-semibold text-orange-900 mb-1">Preferred Drop-off Time</label>
            <input type="datetime-local" id="dropoffDateTime" name="dropoffDateTime" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" required />
          </div>
        </div>
      </fieldset>

      <!-- 6. Service Cost and Payment -->
      <fieldset class="mb-8 border border-orange-300 rounded-lg p-6">
        <legend class="text-xl font-semibold text-orange-700 mb-4">Service Cost and Payment</legend>
        <div class="space-y-4">
          <div>
            <label for="serviceCost" class="block font-semibold text-orange-900 mb-1">Service Cost (calculated)</label>
            <input type="text" id="serviceCost" name="serviceCost" readonly value="$0.00" class="w-full bg-orange-50 border border-orange-400 rounded-md px-3 py-2" />
          </div>
          <div>
            <label for="paymentMethod" class="block font-semibold text-orange-900 mb-1">Payment Method</label>
            <select id="paymentMethod" name="paymentMethod" class="w-full border border-orange-400 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" required>
              <option value="" disabled selected>Select payment method</option>
              <option value="debit">Debit Card</option>
              <option value="credit">Credit Card</option>
              <option value="netbanking">Net Banking</option>
              <option value="cash">Cash on Delivery</option>
            </select>
          </div>
        </div>
      </fieldset>

      <!-- 7. Additional Services -->
      <fieldset class="mb-8 border border-orange-300 rounded-lg p-6">
        <legend class="text-xl font-semibold text-orange-700 mb-4">Additional Services</legend>
        <div class="space-y-2">
          <label class="inline-flex items-center">
            <input type="checkbox" name="insurance" value="yes" class="form-checkbox text-orange-600" />
            <span class="ml-2 font-semibold text-orange-900">Insurance Options</span>
          </label>
          <label class="inline-flex items-center">
            <input type="checkbox" name="tracking" value="yes" class="form-checkbox text-orange-600" />
            <span class="ml-2 font-semibold text-orange-900">Tracking Services</span>
          </label>
        </div>
      </fieldset>

      <!-- Submit Buttons -->
      <div class="flex justify-end space-x-4">
        <button type="reset" class="px-6 py-2 rounded-lg bg-orange-200 hover:bg-orange-300 font-semibold text-orange-900 transition">Reset</button>
        <button type="submit" class="px-6 py-2 rounded-lg bg-orange-600 hover:bg-orange-700 font-semibold text-white transition">Book Service</button>
      </div>

    </form>
  </main>

</body>
</html>

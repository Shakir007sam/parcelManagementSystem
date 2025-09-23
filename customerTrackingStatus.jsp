<%@page import="model.User, model.Booking"
	errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Parcel Tracking - Customer</title>
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
	class="bg-gray-50 min-h-screen flex items-center justify-center p-6">

	<!-- Popup Message Booking Successful -->
	<%
	if (session.getAttribute("invalid") != null) {
		session.removeAttribute("invalid");
	%>
	<div id="popup"
		class="fixed top-12 left-1/2 transform -translate-x-1/2 bg-red-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		Invalid Booking ID</div>
	<%
	}
	%>

	<!-- Popup Message Functionality -->
	<script>
	  const popup = document.getElementById("popup");
	  popup.classList.remove("hidden");
	  setTimeout(() => popup.classList.add("hidden"), 3000);
	</script>





	<div class="bg-white rounded-lg shadow-lg w-full max-w-md p-8">
		<h1 class="text-3xl font-bold text-teal-700 mb-6 text-center">Track
			Your Parcel</h1>



		<form action="CustomerTrackingStatusServlet" method="post"
			class="space-y-5" novalidate>
			<div>
				<label for="bookingId"
					class="block text-sm font-semibold text-gray-700 mb-2">
					Enter last 10-digits of Booking ID  (BK)</label> <input type="text" id="bookingId" name="bookingId"
					placeholder="ex: 0123456789" maxlength="10"
					pattern="\d{10}" required
					class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" />
				<!-- Instruction/error message -->
				<p class="text-red-600 text-sm mt-1 hidden" id="errorMsg">
					Booking ID must be exactly 10 digits.</p>
			</div>

			<button type="submit" id="searchBtn"
				class="w-full bg-teal-600 text-white font-semibold py-2 rounded-lg transition opacity-50 cursor-not-allowed"
				disabled>Search</button>
			<div class="p-0">
				<a href="customerHomepage.jsp"
					class="w-full inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-teal-500 rounded-md shadow-sm hover:bg-teal-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500">
					&larr; Back </a>
			</div>
		</form>

		<!-- Example status box (dynamic via JSP backend) -->
		<%
		Booking b = (Booking) session.getAttribute("booking");
		if (b != null) {
		%>
		<div id="statusBox"
			class="mt-8 p-4 bg-green-100 border border-green-400 rounded">
			<h2 class="text-xl font-semibold text-green-700 mb-2">Tracking
				Status</h2>
			<p>
				Your parcel is currently: <span class="font-semibold"><%=b.getParcelStatus()%></span>
			</p>
			<p>
				Estimated Delivery Date: <span class="font-semibold"><%=b.getParcelDrop().substring(0, 11)%></span>
			</p>
		</div>
		<%
		session.removeAttribute("booking");
		}
		%>
	</div>

	<script>
    const bookingInput = document.getElementById("bookingId");
    const errorMsg = document.getElementById("errorMsg");
    const searchBtn = document.getElementById("searchBtn");

    bookingInput.addEventListener("input", function () {
      const value = bookingInput.value.trim();
      if (value.length > 0 && !/^\d{10}$/.test(value)) {
        errorMsg.classList.remove("hidden");
        searchBtn.disabled = true;
        searchBtn.classList.add("opacity-50", "cursor-not-allowed");
      } else if (/^\d{10}$/.test(value)) {
        errorMsg.classList.add("hidden");
        searchBtn.disabled = false;
        searchBtn.classList.remove("opacity-50", "cursor-not-allowed");
      } else {
        errorMsg.classList.add("hidden");
        searchBtn.disabled = true;
        searchBtn.classList.add("opacity-50", "cursor-not-allowed");
      }
    });
  </script>

</body>
</html>
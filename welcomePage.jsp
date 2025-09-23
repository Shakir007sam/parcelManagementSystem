<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Parcel Management System - Welcome</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<!-- 
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
session.setAttribute("visitor", session);
%>
-->

<body
	class="min-h-screen bg-gradient-to-br from-cyan-200 via-teal-200 to-orange-300 flex flex-col items-center justify-center px-6">
	<!-- Container -->
	<div
		class="w-full max-w-4xl bg-white rounded-3xl shadow-2xl p-10 flex flex-col md:flex-row items-center gap-10">

		<!-- Left Side: Welcome Text -->
		<div class="flex-1 text-center md:text-left">
			<h1 class="text-5xl font-extrabold text-teal-700 mb-4">
				Welcome to <span class="text-red-600">Parcel Management
					System</span>
			</h1>
			<p class="text-gray-700 text-lg mb-6">Manage your parcel
				shipments with ease whether you a€™re a customer booking a
				service or an officer managing deliveries.</p>

			<div class="flex justify-center md:justify-start gap-6">
				<a href="customerLogin.jsp"
					class="px-8 py-3 bg-teal-600 text-white rounded-lg shadow hover:bg-teal-700 transition duration-200 font-semibold">
					Customer Login </a> <a href="officerLogin.jsp"
					class="px-8 py-3 bg-red-600 text-white rounded-lg shadow hover:bg-red-700 transition duration-200 font-semibold">
					Officer Login </a>
			</div>
		</div>

		<!-- Right Side: Illustration or Video -->
		<div class="md:flex-1 flex justify-center">
			<video autoplay loop muted playsinline
				class="w-96 h-auto rounded-none shadow-none">
				<source src="delivery-truck.mp4" type="video/mp4" />
				Your browser does not support the video tag.
			</video>
		</div>

	</div>

	<!-- Footer -->
	<footer class="mt-12 text-center text-gray-600 text-sm">
		&copy; 2025 Parcel Management System. All rights reserved. </footer>

</body>
</html>

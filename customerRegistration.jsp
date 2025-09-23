<%@page import="model.User" errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Customer Registration</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<!--
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
if (session == null||session.getAttribute("visitor")==null) {
	response.sendRedirect("welcomePage.jsp");
}
%>
-->

<body
	class="min-h-screen bg-gradient-to-br from-blue-100 via-cyan-200 to-teal-100 flex items-center justify-center py-10 px-4">
 
	<!-- Popup Message Existing Email/User -->
	<%
	if (session.getAttribute("old user") != null) {
	%>
	<div id="popup"
		class="fixed top-11 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-red-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		You already have an account!</div>
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
		class="w-full max-w-4xl bg-white shadow-xl rounded-xl p-10 space-y-6">
		<div class="text-center">

			<h1 class="text-3xl font-bold text-teal-700">Customer
				Registration</h1>
			<p class="text-gray-600">Fill in your details to register</p>
		</div>

		<form id="registrationForm" action="CustomerRegistrationServlet"
			method="post" class="space-y-6" novalidate>
			<!-- Section 1: Personal Information -->
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">1.
					Personal Information</h2>

				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<!-- Name -->
					<div>
						<label for="name"
							class="block text-sm font-medium text-gray-700 mb-1">Customer
							Name</label> <input type="text" id="name" name="name" maxlength="50"
							required placeholder="Full name"
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-400" />
					</div>

					<div>
						<label for="email"
							class="block text-sm font-medium text-gray-700 mb-1">Email</label>
						<input type="email" id="email" name="email" required
							placeholder="example@email.com"
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-400" />
						<p id="emailError" class="text-red-500 text-xs mt-1 hidden">Enter
							a valid email address.</p>
					</div>

					<!-- Mobile -->
					<div class="md:col-span-2 flex gap-4">
						<div class="w-1/3">
							<label for="countryCode"
								class="block text-sm font-medium text-gray-700 mb-1">Country
								Code</label> <select id="countryCode" name="countryCode"
								class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-400"
								required>
								<option value="">Select</option>
								<option value="+1">+1 (USA)</option>
								<option value="+91">+91 (India)</option>
								<option value="+44">+44 (UK)</option>
							</select>
						</div>
						<div class="flex-1">
							<label for="mobile"
								class="block text-sm font-medium text-gray-700 mb-1">Mobile
								Number</label> <input type="tel" id="mobile" name="mobile"
								maxlength="10" required placeholder="10-digit number"
								class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-400" />
							<p id="mobileError" class="text-red-500 text-xs mt-1 hidden">Mobile
								number must be exactly 10 digits.</p>
						</div>
					</div>

					<!-- Address -->
					<div class="md:col-span-2">
						<label for="address"
							class="block text-sm font-medium text-gray-700 mb-1">Full
							Address</label>
						<textarea id="address" name="address" rows="3" required
							placeholder="Complete mailing address including ZIP and parcel code"
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-400"></textarea>
					</div>
				</div>
			</div>

			<!-- Section 2: Username and Password -->
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">2.
					Username and Password</h2>

				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<!-- User ID -->
					<div>
						<label for="username"
							class="block text-sm font-medium text-gray-700 mb-1">Username</label>
						<input type="text" id="username" name="username" minlength="5"
							maxlength="20" required placeholder="Choose a Username"
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-400" />
						<p id="usernameError" class="text-red-500 text-xs mt-1 hidden">Username
							must be 5 to 20 characters.</p>
					</div>

					<!-- Password -->
					<div>
						<label for="password"
							class="block text-sm font-medium text-gray-700 mb-1">Password</label>
						<input type="password" id="password" name="password"
							maxlength="30" required placeholder="Create a strong password"
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-400" />
						<p id="passwordError" class="text-red-500 text-xs mt-1 hidden">
							Password must include uppercase, lowercase, special character and
							be at least 6 characters.</p>
					</div>

					<!-- Confirm Password -->
					<div class="md:col-span-2">
						<label for="confirmPassword"
							class="block text-sm font-medium text-gray-700 mb-1">Confirm
							Password</label> <input type="password" id="confirmPassword"
							name="confirmPassword" maxlength="30" required
							placeholder="Re-enter your password"
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-400" />
						<p id="confirmPasswordError"
							class="text-red-500 text-xs mt-1 hidden">Passwords do not
							match.</p>
					</div>
				</div>
			</div>

			<!-- Section 3: Preferences -->
			<div>
				<h2 class="text-xl font-semibold text-teal-600 mb-4">3.
					Preferences</h2>
				<textarea id="preferences" name="preferences" rows="3"
					placeholder="Mail delivery, notifications, etc."
					class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-400"></textarea>
			</div>

			<!-- Buttons -->
			<div class="flex justify-between pt-4">
				<button type="reset"
					class="bg-gray-300 text-gray-800 px-6 py-2 rounded-lg hover:bg-gray-400">
					Reset</button>
				<button type="submit"
					class="bg-teal-600 text-white px-6 py-2 rounded-lg hover:bg-teal-700">
					Register</button>
			</div>

		</form>
	</div>

	<script>
    const form = document.getElementById("registrationForm");

    const email = document.getElementById("email");
    const mobile = document.getElementById("mobile");
    const username = document.getElementById("username");
    const password = document.getElementById("password");
    const confirmPassword = document.getElementById("confirmPassword");

    const emailError = document.getElementById("emailError");
    const mobileError = document.getElementById("mobileError");
    const usernameError = document.getElementById("usernameError");
    const passwordError = document.getElementById("passwordError");
    const confirmPasswordError = document.getElementById("confirmPasswordError");

    function validateEmail() {
      const regex = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;
      const valid = regex.test(email.value);
      emailError.classList.toggle("hidden", valid);
      return valid;
    }

    function validateMobile() {
      const valid = /^[0-9]{10}$/.test(mobile.value);
      mobileError.classList.toggle("hidden", valid);
      return valid;
    }

    function validateUsername() {
      const valid = username.value.length >= 5 && username.value.length <= 20;
      usernameError.classList.toggle("hidden", valid);
      return valid;
    }

    function validatePassword() {
      const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{6,30}$/;
      const valid = regex.test(password.value);
      passwordError.classList.toggle("hidden", valid);
      return valid;
    }

    function validateConfirmPassword() {
      const valid = password.value === confirmPassword.value;
      confirmPasswordError.classList.toggle("hidden", valid);
      return valid;
    }

    email.addEventListener("input", validateEmail);
    mobile.addEventListener("input", validateMobile);
    username.addEventListener("input", validateUsername);
    password.addEventListener("input", validatePassword);
    confirmPassword.addEventListener("input", validateConfirmPassword);

    form.addEventListener("submit", (e) => {
      const isValid =
        validateEmail() &&
        validateMobile() &&
        validateUsername() &&
        validatePassword() &&
        validateConfirmPassword();

      if (!isValid) {
        e.preventDefault();
      }
    });
  </script>

</body>
</html>

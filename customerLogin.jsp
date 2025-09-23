<%@page import="model.User" errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Customer Login</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
if (session.getAttribute("visitor") == null)
	response.sendRedirect("welcomePage.jsp");
%>
<body
	class="min-h-screen bg-gradient-to-br from-blue-100 via-cyan-200 to-teal-100 flex items-center justify-center">

	<!-- Popup Message Registration Successful -->
	<%
	if (session.getAttribute("new user") != null) {
		session.removeAttribute("new user");
	%>
	<div id="popup"
		class="fixed top-11 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-green-500 text-white px-6 py-3 rounded-xl shadow-lg hidden ">
		Registration Successful!</div>
	<%
	}
	%>

	<!-- Popup Message Invalid Username or Password -->
	<%
	if (session.getAttribute("invalidCredentials") != null) {
		session.removeAttribute("invalidCredentials");
	%>
	<div id="popup"
		class="fixed top-11 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-red-500 text-white px-6 py-3 rounded-xl shadow-lg hidden">
		Invalid Username or Password!</div>
	<%
	}
	%>

	<!-- Popup Message Functionality -->
	<script>
      const popup = document.getElementById("popup");
      popup.classList.remove("hidden");
      setTimeout(() => popup.classList.add("hidden"), 3000);
    </script>


	<!-- Login Card -->
	<div class="w-full max-w-md bg-white shadow-xl rounded-xl p-8">
		<div class="mb-6 text-center">

			<h1 class="text-3xl font-bold text-teal-700">Customer Login</h1>
			<p class="text-gray-600 mt-1">Access your dashboard securely</p>
		</div>

		<form class="space-y-5" action="CustomerLoginServlet" method="post"
			novalidate>

			<!-- Username -->
			<div>
				<label for="username"
					class="block text-sm font-medium text-gray-700 mb-1">Username</label>
				<input type="text" id="username" name="username" minlength="5"
					maxlength="20" placeholder="Enter your username" required
					class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-400" />
				<p class="text-red-600 text-sm mt-1 hidden" id="usernameError">Username
					must be between 5 and 20 characters.</p>
			</div>


			<!-- Password -->
			<div>
				<label for="password"
					class="block text-sm font-medium text-gray-700 mb-1">Password</label>
				<input type="password" id="password" name="password" maxlength="30"
					required placeholder="Enter your password"
					class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-400" />
				<p class="text-red-600 text-sm mt-1 hidden" id="passwordError">
					Password must contain at least one uppercase letter, one lowercase
					letter, and one special character.</p>
			</div>


			<!-- Login Button -->
			<div>
				<button type="submit"
					class="w-full bg-teal-600 text-white py-2 rounded-lg hover:bg-teal-700 transition duration-200">
					Log In</button>
			</div>

		</form>
		<br>
		<!-- Register Button -->
		<form class="space-y-5" action="CustomerRegistrationServlet"
			novalidate>
			<div>
				<button type="submit"
					class="w-full bg-red-600 text-white py-2 rounded-lg hover:bg-red-700 transition duration-200">
					New User? Register here!</button>
			</div>
		</form>
	</div>
	<script>
  const usernameInput = document.getElementById("username");
  const passwordInput = document.getElementById("password");

  const usernameError = document.getElementById("usernameError");
  const passwordError = document.getElementById("passwordError");

 
  usernameInput.addEventListener("input", () => {
    const username = usernameInput.value.trim();
    if (username.length < 5 || username.length > 20) {
      usernameError.classList.remove("hidden");
      usernameInput.classList.add("border-red-500", "ring-red-500", "ring-2");
    } else {
      usernameError.classList.add("hidden");
      usernameInput.classList.remove("border-red-500", "ring-red-500", "ring-2");
    }
  });

  
  passwordInput.addEventListener("input", () => {
    const password = passwordInput.value;
    const hasLowercase = /[a-z]/.test(password);
    const hasUppercase = /[A-Z]/.test(password);
    const hasSpecialChar = /[^a-zA-Z0-9]/.test(password);

    let errorMessages = [];

    if (!hasLowercase) errorMessages.push("lowercase letter");
    if (!hasUppercase) errorMessages.push("uppercase letter");
    if (!hasSpecialChar) errorMessages.push("special character");

    if (errorMessages.length > 0) {
      passwordError.textContent = "Password must contain at least one " + errorMessages.join(", ") + ".";
      passwordError.classList.remove("hidden");
      passwordInput.classList.add("border-red-500", "ring-red-500", "ring-2");
    } else {
      passwordError.classList.add("hidden");
      passwordInput.classList.remove("border-red-500", "ring-red-500", "ring-2");
    }
  });

  document.querySelector("form[action='CustomerLoginServlet']").addEventListener("submit", function (e) {
    const username = usernameInput.value.trim();
    const password = passwordInput.value;

    let hasError = false;

    if (username.length < 5 || username.length > 20) {
      usernameError.classList.remove("hidden");
      usernameInput.classList.add("border-red-500", "ring-red-500", "ring-2");
      hasError = true;
    }

    const hasLowercase = /[a-z]/.test(password);
    const hasUppercase = /[A-Z]/.test(password);
    const hasSpecialChar = /[^a-zA-Z0-9]/.test(password);

    let passwordErrors = [];

    if (!hasLowercase) passwordErrors.push("lowercase letter");
    if (!hasUppercase) passwordErrors.push("uppercase letter");
    if (!hasSpecialChar) passwordErrors.push("special character");

    if (passwordErrors.length > 0) {
      passwordError.textContent = "Password must contain at least one " + passwordErrors.join(", ") + ".";
      passwordError.classList.remove("hidden");
      passwordInput.classList.add("border-red-500", "ring-red-500", "ring-2");
      hasError = true;
    }

    if (hasError) {
      e.preventDefault(); // Stop form submission
    }
  });
   </script>

</body>
</html>
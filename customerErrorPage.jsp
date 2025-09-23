<%@ page isErrorPage="true" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>404 Error Page</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
  <div class="text-center">
    <h1 class="text-9xl font-extrabold text-gray-800">404</h1>
    <p class="text-2xl font-semibold text-gray-600 mt-4">Oops! Page not found</p>
    <p class="text-gray-500 mt-2">The page you're looking for doesn't exist or you have logged out.</p>
    <a href="welcomePage.jsp" class="mt-6 inline-block px-6 py-3 bg-blue-600 text-white font-medium rounded-lg shadow hover:bg-blue-700">
      Go Back to Welcome Page
    </a>
  </div>
</body>
</html>

<%@page errorPage="customerErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Officer Invoice</title>
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
      .no-print {
        display: none !important;
      }
    }
  </style>
</head>
<body class="bg-gradient-to-br from-yellow-200 via-orange-300 to-red-300 min-h-screen font-sans">

  <div class="max-w-4xl mx-auto bg-white/95 rounded-xl shadow-lg p-8 mt-12" id="invoice">
    <h1 class="text-3xl font-extrabold text-orange-800 mb-8">Invoice</h1>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-x-12 gap-y-6 text-orange-900 text-lg">
      <!-- Left Column -->
      <div class="space-y-4">
        <div>
          <strong>Receiver Name:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">John Doe</p>
        </div>

        <div>
          <strong>Receiver Address:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">123 Main St, Springfield</p>
        </div>

        <div>
          <strong>Receiver Pin:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">123456</p>
        </div>

        <div>
          <strong>Receiver Mobile:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">+1-234-567-8900</p>
        </div>

        <div>
          <strong>Parcel Weight (g):</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">2500 g</p>
        </div>
      </div>

      <!-- Right Column -->
      <div class="space-y-4">
        <div>
          <strong>Parcel Contents Description:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">Books and documents</p>
        </div>

        <div>
          <strong>Parcel Delivery Type:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">Express</p>
        </div>

        <div>
          <strong>Parcel Packing Preference:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">Eco-friendly Packaging</p>
        </div>

        <div>
          <strong>Parcel Pickup Time:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">2025-09-07 10:00 AM</p>
        </div>

        <div>
          <strong>Parcel Dropoff Time:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">2025-09-08 04:00 PM</p>
        </div>

        <div>
          <strong>Parcel Service Cost:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">$45.00</p>
        </div>

        <div>
          <strong>Parcel Payment Time:</strong>
          <p class="mt-1 border border-orange-300 rounded-md bg-orange-50 px-4 py-2">2025-09-07 09:30 AM</p>
        </div>
      </div>
    </div>

    <div class="mt-8 flex justify-end no-print">
      <button onclick="window.print()" class="px-6 py-2 rounded-lg bg-orange-600 hover:bg-orange-700 text-white font-semibold transition">
        Print Invoice
      </button>
    </div>
  </div>

</body>
</html>

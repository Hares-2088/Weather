# 🌦️ Weather App

Welcome to the **Weather App**, a modern iOS application built with **Swift** and **SwiftUI** to provide real-time weather updates, a 7-day forecast, and an interactive map! 🗺️

## 🚀 Features
- 🌍 **Search for Cities**: Enter any city and get its current weather.
- 📅 **7-Day Forecast**: View the upcoming week’s weather with detailed conditions.
- 🗺️ **Interactive Map**: Displays the searched city’s location with a dynamic pin.
- 🎨 **Beautiful UI**: Gradient backgrounds, SF Symbols, and smooth animations enhance the user experience.
- 🛠️ **Dynamic Icons**: Weather conditions are represented with relevant SF Symbols.

---

## 🖼️ Screenshots
<img width="361" alt="Screenshot 2024-12-04 at 3 14 31 PM" src="https://github.com/user-attachments/assets/ed90e87e-ad37-41b3-9582-6c5c19265800">

---
## 📹 Video Demo

[Watch the Demo](https://youtube.com/shorts/4G6h1SGh9jE?feature=share)

---

## 🛠️ Technologies Used
- **Swift**
- **SwiftUI**
- **MapKit**
- **Combine**
- **OpenWeather API**

---

## 📝 Prerequisites
Before running the app, ensure you have the following:
- **Xcode 14+**
- An **OpenWeather API Key**
  - Sign up for free at [OpenWeather](https://openweathermap.org/api).

---

## ⚙️ Setup Instructions

Follow these steps to set up and run the project:

### 1️⃣ Clone the Repository
  
    git clone https://github.com/YourUsername/WeatherApp.git
    cd WeatherApp

### 2️⃣ Open the Project
1. Open the `WeatherApp.xcodeproj` file in **Xcode**.
2. Ensure you have the latest version of **Xcode** (14+ recommended).

---

### 3️⃣ Add Your API Key
1. Open the `WeatherService.swift` file.
2. Locate the line where the `apiKey` is defined:
    ```bash
    let apiKey = "YOUR_API_KEY"
3. Replace "YOUR_API_KEY" with your personal OpenWeather API key.
If you don’t have one, register for free at OpenWeather to get an API key.

---

### 4️⃣ Run the Project
1. In Xcode, select your target device or simulator from the top toolbar.
2. Press `Cmd + R` to build and run the app.
3. Once the app launches:
   - Enter a city name (e.g., "Montreal") in the search bar.
   - Press the 🔍 button to view the weather data and map.

---

### 5️⃣ Explore the App
1. **Search for Weather**:
   - Use the search bar to enter any city name.
   - Tap the 🔍 button to fetch and display weather details for the selected city.
2. **7-Day Weather Forecast**:
   - Scroll through the forecast cards to see the temperature, conditions, and more for the next 7 days.
3. **Interactive Map**:
   - View the city’s location on a map with a dynamic pin.
   - Pan and zoom to explore surrounding areas.

---

### 🎯 Tips for Testing
- **Simulating Locations**:
   1. In the iOS simulator, navigate to `Debug > Location > Custom Location`.
   2. Enter latitude and longitude to test map behavior and weather updates for different cities.
- **Live Data Issues**:
   - Ensure your device or simulator has an active internet connection.
   - Confirm your OpenWeather API key is valid and entered correctly in `WeatherService.swift`.



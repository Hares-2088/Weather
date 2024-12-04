import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city: String = "Montreal"
    @State private var showForecasts = false

    var body: some View {
        VStack {
            // Search Bar
            HStack {
                TextField("Enter City", text: $city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    withAnimation {
                        viewModel.fetchForecast(for: city)
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Circle().fill(Color.blue))
                }
                .padding()
                .scaleEffect(showForecasts ? 1.0 : 1.1)
                .animation(.easeInOut(duration: 0.2), value: showForecasts)
            }

            // Error Message
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            // Weather Information
            if !viewModel.forecasts.isEmpty {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(viewModel.forecasts) { forecast in
                            HStack {
                                // Weather Icon
                                Image(systemName: forecast.icon)
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)

                                VStack(alignment: .leading) {
                                    Text(forecast.date)
                                        .font(.headline)
                                    Text(forecast.condition.capitalized)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                // Temperature
                                HStack {
                                    Image(systemName: "thermometer.sun")
                                        .foregroundColor(.orange)
                                    Text("\(forecast.temperature, specifier: "%.1f")°C")
                                        .font(.title2)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue.opacity(0.1))
                            )
                            .padding(.horizontal)
                            .animation(.easeInOut(duration: 0.3), value: forecast.id) // Animation for appearance
                        }
                    }
                }
                .padding(.top)
                .transition(.opacity)
            }

            // Map View
            WeatherMapView(coordinates: $viewModel.cityCoordinates)
                .padding(.top)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
        .onAppear {
            withAnimation {
                viewModel.fetchForecast(for: city)
                showForecasts = true
            }
        }
    }
}

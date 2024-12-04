import Foundation
import CoreLocation
import Combine


class WeatherViewModel: ObservableObject {
    @Published var forecasts: [Forecast] = []
    @Published var errorMessage: String?
    @Published var cityCoordinates: EquatableCoordinates? // Ensure Optional

    private let weatherService = WeatherService()
    private let locationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()

    func fetchForecast(for city: String) {
        // Fetch coordinates
        locationManager.fetchCoordinates(for: city)
        locationManager.$coordinates
            .receive(on: DispatchQueue.main)
            .sink { [weak self] coordinates in
                self?.cityCoordinates = coordinates
            }
            .store(in: &cancellables)

        // Fetch weather data
        weatherService.fetchForecast(city: city) { [weak self] forecasts in
            guard let self = self else { return }
            if let forecasts = forecasts {
                self.forecasts = forecasts
            } else {
                self.errorMessage = "Failed to fetch forecast data."
            }
        }
    }
}




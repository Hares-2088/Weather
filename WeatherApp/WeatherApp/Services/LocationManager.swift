import CoreLocation

class LocationManager: NSObject, ObservableObject {
    @Published var coordinates: EquatableCoordinates? // Ensure Optional
    @Published var errorMessage: String?

    private let geocoder = CLGeocoder()

    func fetchCoordinates(for city: String) {
        geocoder.geocodeAddressString(city) { [weak self] placemarks, error in
            guard let self = self else { return }

            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to find location: \(error.localizedDescription)"
                }
                return
            }

            if let location = placemarks?.first?.location {
                DispatchQueue.main.async {
                    self.coordinates = EquatableCoordinates(coordinate: location.coordinate)
                }
            } else {
                DispatchQueue.main.async {
                    self.errorMessage = "No location found for \(city)"
                }
            }
        }
    }
}


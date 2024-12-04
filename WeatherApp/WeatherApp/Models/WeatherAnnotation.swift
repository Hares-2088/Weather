import Foundation
import CoreLocation

struct WeatherAnnotation: Identifiable {
    let id = UUID() // Conform to Identifiable
    let coordinate: CLLocationCoordinate2D
    let title: String
    let subtitle: String
}

import SwiftUI
import MapKit

struct WeatherMapView: View {
    @Binding var coordinates: EquatableCoordinates? // Accept optional coordinates

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 45.5088, longitude: -73.5878), // Default to Montreal
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotationItems) { annotation in
            MapAnnotation(coordinate: annotation.coordinate) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.red)
                    .font(.title)
            }
        }
        .onAppear {
            updateRegion()
        }
        .onChange(of: coordinates) { _ in
            updateRegion()
        }
        .frame(height: 300)
        .cornerRadius(10)
        .padding()
    }

    private var annotationItems: [MapAnnotationItem] {
        if let coordinates = coordinates {
            return [MapAnnotationItem(coordinate: coordinates.coordinate)]
        }
        return []
    }

    private func updateRegion() {
        if let coordinates = coordinates {
            region.center = coordinates.coordinate
        }
    }
}

struct MapAnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}



struct EquatableCoordinates: Equatable {
    let coordinate: CLLocationCoordinate2D

    static func == (lhs: EquatableCoordinates, rhs: EquatableCoordinates) -> Bool {
        lhs.coordinate.latitude == rhs.coordinate.latitude &&
        lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}


import Foundation

struct Forecast: Decodable, Identifiable {
    let id = UUID() // Unique identifier
    let date: String
    let temperature: Double
    let condition: String

    // SF Symbol based on weather condition
    var icon: String {
        switch condition.lowercased() {
        case "clear sky":
            return "sun.max.fill"
        case "few clouds":
            return "cloud.sun.fill"
        case "scattered clouds", "broken clouds", "clouds":
            return "cloud.fill"
        case "shower rain", "rain":
            return "cloud.rain.fill"
        case "thunderstorm":
            return "cloud.bolt.rain.fill"
        case "snow":
            return "cloud.snow.fill"
        case "mist":
            return "cloud.fog.fill"
        default:
            return "questionmark.circle.fill" // Default for unknown conditions
        }
    }

    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
    }

    enum MainKeys: String, CodingKey {
        case temp
    }

    enum WeatherKeys: String, CodingKey {
        case description
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Decode the timestamp and convert it to a readable date
        let timestamp = try container.decode(TimeInterval.self, forKey: .dt)
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, hh a" // Example: Monday, 10 AM
        self.date = dateFormatter.string(from: date)

        // Decode the temperature
        let mainContainer = try container.nestedContainer(keyedBy: MainKeys.self, forKey: .main)
        self.temperature = try mainContainer.decode(Double.self, forKey: .temp)

        // Decode the weather condition
        var weatherArray = try container.nestedUnkeyedContainer(forKey: .weather)
        let weatherContainer = try weatherArray.nestedContainer(keyedBy: WeatherKeys.self)
        self.condition = try weatherContainer.decode(String.self, forKey: .description)
    }
}

struct ForecastResponse: Decodable {
    let list: [Forecast]
}

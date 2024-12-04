import Foundation

class WeatherService {
    func fetchForecast(city: String, completion: @escaping ([Forecast]?) -> Void) {
        let apiKey = "641cbc4be6b1880970ab759884d23f2b"
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            guard let data = data else {
                print("No data received.")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(forecastResponse.list)
                }
            } catch {
                print("Error decoding forecast data: \(error)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }

}

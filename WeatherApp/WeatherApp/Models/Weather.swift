struct Weather: Decodable {
    let temperature: Double
    let condition: String

    enum CodingKeys: String, CodingKey {
        case main
        case weather
    }

    enum MainKeys: String, CodingKey {
        case temperature = "temp"
    }

    enum WeatherKeys: String, CodingKey {
        case condition = "description"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let mainContainer = try container.nestedContainer(keyedBy: MainKeys.self, forKey: .main)
        temperature = try mainContainer.decode(Double.self, forKey: .temperature)

        var weatherArray = try container.nestedUnkeyedContainer(forKey: .weather)
        let weatherContainer = try weatherArray.nestedContainer(keyedBy: WeatherKeys.self)
        condition = try weatherContainer.decode(String.self, forKey: .condition)
    }
}

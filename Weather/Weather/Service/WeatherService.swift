//
//  WeatherService.swift
//  Weather
//
//  Created by ILKER on 13.06.2023.
//

import Foundation

enum ServiceError: Error {
case serverError
case decodingError
}

struct WeatherService {
    let url = "https://api.openweathermap.org/data/2.5/weather?&appid=b76bcaba7a3be2b8494b366c98efadc4&units=metric"
    
    func fetchWeather(forCityName cityName: String, completion: @escaping(Result<WeatherModel,ServiceError>) -> Void) {
        let url = URL(string: "\(url)&q=\(cityName)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.serverError))
                return
            }
            guard let data = data else { return }
            guard let result = parseJSON(data: data) else {
                completion(.failure(.decodingError))
                return
            }
            completion(.success(result))
        }.resume()
    }
    private func parseJSON(data: Data) -> WeatherModel? {
        do {
            let result = try JSONDecoder().decode(WeatherModel.self, from: data)
            return result
        } catch {
            return nil
        }
    }
}


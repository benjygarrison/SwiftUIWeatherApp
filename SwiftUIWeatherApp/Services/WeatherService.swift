//
//  WeatherService.swift
//  SwiftUIWeatherApp
//
//  Created by Ben Garrison on 7/3/22.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&id=524901&appid=4fc6ae14ac0ddf19237804b89c600ac6&units=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherReponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}

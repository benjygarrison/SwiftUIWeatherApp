//
//  Weather.swift
//  SwiftUIWeatherApp
//
//  Created by Ben Garrison on 7/3/22.
//

import Foundation

struct WeatherReponse: Decodable {
    
    let main: Weather
    
}


struct Weather: Decodable {
    
    var temp: Double?
    var humidity: Double?
    
}

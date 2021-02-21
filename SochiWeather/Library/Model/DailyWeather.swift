//
//  DailyWeather.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import Foundation

struct DailyWeather: Codable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Temperature
    var feelsLike: FeelsLike
    var pressure: Int
    var humidity: Int
    var uvi: Double
    var clouds: Int
    var windSpeed: Double
    var windDeg: Int
    var weather: [Weather]
    var pop: Double?
    var snow: Double?
    var rain: Double?
}

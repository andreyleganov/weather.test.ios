//
//  HourlyWeather.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import Foundation

struct HourlyWeather: Codable {
    var dt: Int
    var temp: Double
    var feelsLike: Double
    var pressure: Int
    var humidity: Int
    var uvi: Double
    var clouds: Int
    var windSpeed: Double
    var windDeg: Int
    var weather: [Weather]
    var pop: Double?
    var snow: Snow?
    var rain: Rain?
}

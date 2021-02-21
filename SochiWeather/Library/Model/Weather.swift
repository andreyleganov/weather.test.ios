//
//  Weather.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/18/21.
//

import Foundation
import IGListKit

struct GeneralResponse: Codable {
    var lat: Double
    var lon: Double
    var timezone: String
    var timezoneOffset: Int
    var current: CurrentWeather
    var hourly: [HourlyWeather]
    var daily: [DailyWeather]
}

struct CurrentWeather: Codable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
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

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Snow: Codable {
    var lastHour: Double
    
    enum CodingKeys: String, CodingKey {
        case lastHour = "1h"
    }
}

struct Rain: Codable {
    var lastHour: Double
    
    enum CodingKeys: String, CodingKey {
        case lastHour = "1h"
    }
}

struct Temperature: Codable {
    var morn: Double
    var day: Double
    var eve: Double
    var night: Double
    var min: Double
    var max: Double
}

struct FeelsLike: Codable {
    var morn: Double
    var day: Double
    var eve: Double
    var night: Double
}





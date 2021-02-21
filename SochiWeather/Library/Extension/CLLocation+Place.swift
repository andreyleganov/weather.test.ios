//
//  CLLocation+Place.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/21/21.
//

import CoreLocation

extension CLLocation {
    func fetchPlace(completion: @escaping (_ place: String?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.subLocality, $1)}
    }
}

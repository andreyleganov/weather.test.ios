//
//  DateSectionModel.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import IGListKit

class DateSectionModel {
    var weather: GeneralResponse
    
    init(weather: GeneralResponse) {
        self.weather = weather
    }
}

// MARK: - ListDiffable
extension DateSectionModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return String(describing: self) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? DateSectionModel else {
            return false
        }
        return object.weather.current.dt == weather.current.dt
    }
}

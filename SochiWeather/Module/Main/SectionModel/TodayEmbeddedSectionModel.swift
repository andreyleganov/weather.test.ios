//
//  TodayEmbeddedSectionModel.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/12/21.
//

import IGListKit

class TodayEmbeddedSectionModel {
    
    let items: [HourlyWeather]
    
    init(items: [HourlyWeather]) {
        self.items = items
    }
    
}

// MARK: - ListDiffable
extension TodayEmbeddedSectionModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return String(describing: self) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? TodayEmbeddedSectionModel else {
            return false
        }
        return object.items.count == items.count
    }
}

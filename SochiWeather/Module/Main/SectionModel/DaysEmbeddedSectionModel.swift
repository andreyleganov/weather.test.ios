//
//  DaysEmbeddedSectionModel.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/12/21.
//

import IGListKit

class DaysEmbeddedSectionModel {
    var items: [DailyWeather]
    
    init(items: [DailyWeather]) {
        self.items = items
    }
}

// MARK: - ListDiffable
extension DaysEmbeddedSectionModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return String(describing: self) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? DaysEmbeddedSectionModel else {
            return false
        }
        return object.items.count == items.count
    }
}

//
//  DaysSectionModel.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import IGListKit

class DaysSectionModel {
    
    var items: [DailyWeather]
    
    init(items: [DailyWeather]) {
        self.items = items
    }
}

// MARK: - ListDiffable
extension DaysSectionModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return String(describing: self) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}

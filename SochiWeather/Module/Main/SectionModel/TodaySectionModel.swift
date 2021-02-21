//
//  TodaySectionModel.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import IGListKit

class TodaySectionModel {
    
    let items: [HourlyWeather]
    
    init(items: [HourlyWeather]) {
        self.items = items
    }
    
}

// MARK: - ListDiffable
extension TodaySectionModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return String(describing: self) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}

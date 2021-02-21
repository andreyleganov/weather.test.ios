//
//  TempSectionModel.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import IGListKit

class TempSectionModel {
    var current: CurrentWeather
    
    init(current: CurrentWeather) {
        self.current = current
    }
}

// MARK: - ListDiffable
extension TempSectionModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return String(describing: self) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? TempSectionModel else {
            return false
        }
        return object.current.temp == current.temp
    }
}

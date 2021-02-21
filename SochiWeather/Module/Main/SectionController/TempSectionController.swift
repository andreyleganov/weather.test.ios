//
//  TempSectionController.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import IGListKit

class TempSectionController: ListSectionController {
    
    var model: TempSectionModel!
    
    // MARK: - Lifecycle
    
    override init() {
        super.init()
        
        inset = UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0)
    }
    
    override func didUpdate(to object: Any) {
        model = object as? TempSectionModel
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.insetContainerSize.width else {
            return .zero
        }
        return CGSize(width: width, height: 76)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: TempCell.self, for: self, at: index) as! TempCell
        cell.tempLabel.text = "\(Int(model.current.temp))º"
        
        return cell
    }
}

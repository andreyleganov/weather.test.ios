//
//  TodayEmbeddedSectionController.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/19/21.
//

import IGListKit

class TodayEmbeddedSectionController: ListSectionController {
    
    var model: TodayEmbeddedSectionModel!
    
    // MARK: - Lifecycle
    
    override init() {
        super.init()
        
        minimumLineSpacing = 16
    }
    
    override func didUpdate(to object: Any) {
        model = object as? TodayEmbeddedSectionModel
    }
    
    override func numberOfItems() -> Int {
        return model.items.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 78, height: 124)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: TodayEmbeddedCell.self, for: self, at: index) as! TodayEmbeddedCell
        
        let date = Date(timeIntervalSince1970: Double(model.items[index].dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH mm"
        let currentTime = dateFormatter.string(from: date)
        cell.timeLabel.text = currentTime
        
        cell.tempLabel.text = "\(Int(model.items[index].temp))º"

        DispatchQueue.global().async {
            if let image = UIImage.getImage(from: URL(string: "http://openweathermap.org/img/wn/" + self.model.items[index].weather[0].icon + "@2x.png")) {
                DispatchQueue.main.async {
                    cell.imageView.image = image
                }
            }
        }
        
        let pop = model.items[index].pop
        if pop != 0 {
            let percent = pop * 100
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            let string = formatter.string(from: NSNumber(value: percent)) ?? ""
            cell.percentLabel.text = string + "%"
        } else {
            cell.percentLabel.text = "0%"
        }
        
        if let snow = model.items[index].snow?.lastHour {
            cell.mmLabel.text = "\(snow) мм"
        } else {
            cell.mmLabel.text = "0 мм"
        }
        
        return cell
    }
}

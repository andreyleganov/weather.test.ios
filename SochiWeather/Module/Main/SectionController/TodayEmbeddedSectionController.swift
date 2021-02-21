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
            if let image = self.getImage(from: self.model.items[index].weather[0].icon) {
                DispatchQueue.main.async {
                    cell.imageView.image = image
                }
            }
        }
        
        if let pop = model.items[index].pop, let snow = model.items[index].snow?.lastHour {
            cell.percentLabel.text = "\(Int(pop) * 100)%"
            cell.mmLabel.text = "\(snow) мм"
        } else {
            cell.percentLabel.text = "\(0)%"
            cell.mmLabel.text = "\(0) мм"
        }
        
        return cell
    }
    
    // MARK: - Private
    
    private func getImage(from string: String) -> UIImage? {
        guard let url = URL(string: "http://openweathermap.org/img/wn/" + string + "@2x.png") else {
            return nil
        }
        var image: UIImage? = nil
        do {
            let data = try Data(contentsOf: url)
            image = UIImage(data: data)
        } catch {
            print(error)
        }
        
        return image
    }
}

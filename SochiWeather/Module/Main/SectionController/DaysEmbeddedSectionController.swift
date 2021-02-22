//
//  DaysEmbeddedSectionController.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/12/21.
//

import IGListKit

class DaysEmbeddedSectionController: ListSectionController {
    
    var model: DaysEmbeddedSectionModel!
    
    // MARK: - Lifecycle
    
    override init() {
        super.init()
        
        minimumLineSpacing = 16
    }
    
    override func didUpdate(to object: Any) {
        model = object as? DaysEmbeddedSectionModel
    }
    
    override func numberOfItems() -> Int {
        return model.items.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 112, height: 128)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: DayEmbeddedCell.self, for: self, at: index) as! DayEmbeddedCell
        
        let timeInterval = Double(model.items[index].dt)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM"
        dateFormatter.timeZone = .current
        let dt = dateFormatter.string(from: date)
        
        cell.dateLabel.text = dt

        DispatchQueue.global().async {
            if let image = self.getImage(from: self.model.items[index].weather[0].icon) {
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
        
        if let snow = model.items[index].snow {
            cell.mmLabel.text = "\(snow) мм"
        } else {
            cell.mmLabel.text = "0 мм"
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

//
//  DateSectionController.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import IGListKit
import CoreLocation

class DateSectionController: ListSectionController {
    
    var model: DateSectionModel!
    
    // MARK: - Lifecycle
    
    override init() {
        super.init()
        
        inset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
    }
    
    override func didUpdate(to object: Any) {
        model = object as? DateSectionModel
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.insetContainerSize.width else {
            return .zero
        }
        
        return CGSize(width: width, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: DateCell.self, for: self, at: index) as! DateCell
        
        cell.subtitleLabel.text = model.weather.current.weather[0].description

        DispatchQueue.global().async {
            if let image = self.getImage(from: self.model.weather.current.weather[0].icon) {
                DispatchQueue.main.async {
                    cell.imageView.image = image
                }
            }
        }
        let lat = model.weather.lat
        let long = model.weather.lon
        let currentLocation = CLLocation(latitude: lat, longitude: long)
        
        currentLocation.fetchPlace { place, error in
            guard let place = place, error == nil else {
                return
            }
            cell.titleLabel.text = place
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

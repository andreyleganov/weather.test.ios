//
//  ImageProvider.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/22/21.
//

import UIKit

protocol ImageProviderProtocol: class {
    
    func getImage(from string: String) -> UIImage?
}

class ImageProvider: ImageProviderProtocol {
    
    static var shared: ImageProviderProtocol = ImageProvider()
    
    func getImage(from string: String) -> UIImage? {
        
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

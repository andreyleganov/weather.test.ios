//
//  UIImage+getImage.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/22/21.
//

import UIKit

extension UIImage {
    
    static func getImage(from url: URL?) -> UIImage? {
        guard let url = url else {
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

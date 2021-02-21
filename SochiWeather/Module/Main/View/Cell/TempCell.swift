//
//  TempCell.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import UIKit

class TempCell: UICollectionViewCell {
    
    // MARK: - View
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 64, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000)
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(tempLabel)
    
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        
        tempLabel.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
        
        super.updateConstraints()
    }
}

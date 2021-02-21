//
//  TodayEmbeddedCell.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/19/21.
//

import UIKit

class TodayEmbeddedCell: UICollectionViewCell {
    
    // MARK: - View
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000)
        label.textAlignment = .center
        
        return label
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(tempLabel)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        
        timeLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        imageView.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(timeLabel.snp.bottom).offset(8)
            make.trailing.equalToSuperview()
        }
        
        tempLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        super.updateConstraints()
    }
}

//
//  DateCell.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import UIKit

class DateCell: UICollectionViewCell {
    
    // MARK: - View
    
    private let weatherIconView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex6: 0xFFFFFF)
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor(hex6: 0x000000).cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 7
        view.layer.shadowOpacity = 0.05
        
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor(hex6: 0x000000)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .left
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(weatherIconView)
        weatherIconView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        
        weatherIconView.snp.remakeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.leading.equalToSuperview().offset(32)
            make.top.equalToSuperview()
        }
        
        imageView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.leading.equalTo(weatherIconView.snp.trailing).offset(16)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(32)
        }
        
        subtitleLabel.snp.remakeConstraints { make in
            make.leading.equalTo(weatherIconView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(32)
            make.bottom.equalToSuperview().inset(2)
        }
        
        super.updateConstraints()
    }
}

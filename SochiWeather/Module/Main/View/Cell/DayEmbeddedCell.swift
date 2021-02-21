//
//  DayEmbeddedCell.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/12/21.
//

import UIKit

class DayEmbeddedCell: UICollectionViewCell {
    
    // MARK: - View
    
    private let containerView: UIView = {
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
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let indicatorView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        layer.cornerRadius = 16
        
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(indicatorView)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        
        containerView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.remakeConstraints { make in
            make.size.equalTo(CGSize(width: 63, height: 45))
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(32)
        }
        
        dateLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
        
        indicatorView.snp.remakeConstraints { make in
            make.height.equalTo(6)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        super.updateConstraints()
    }
}

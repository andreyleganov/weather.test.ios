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
    
    private let popLabel: UILabel = {
        let label = UILabel()
        label.text = "Осадки"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .left
        
        return label
    }()
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .right
        
        return label
    }()
    
    private let snowLabel: UILabel = {
        let label = UILabel()
        label.text = "Снег"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .left
        
        return label
    }()
    
    let mmLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .right
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(popLabel)
        containerView.addSubview(percentLabel)
        containerView.addSubview(snowLabel)
        containerView.addSubview(mmLabel)
        
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
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(16)
        }
        
        popLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(imageView.snp.bottom).offset(13)
        }
        
        percentLabel.snp.remakeConstraints { make in
            make.leading.equalTo(popLabel.snp.trailing).offset(10)
            make.top.equalTo(popLabel)
            make.trailing.equalToSuperview().inset(16)
        }
        
        snowLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(10)
        }
        
        mmLabel.snp.remakeConstraints { make in
            make.leading.equalTo(snowLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(snowLabel)
        }
        
        super.updateConstraints()
    }
}

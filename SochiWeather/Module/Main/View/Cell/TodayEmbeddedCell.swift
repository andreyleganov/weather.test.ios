//
//  TodayEmbeddedCell.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/19/21.
//

import UIKit

class TodayEmbeddedCell: UICollectionViewCell {
    
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
    
    private let popLabel: UILabel = {
        let label = UILabel()
        label.text = "Осадки"
        label.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .left
        
        return label
    }()
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .right
        
        return label
    }()
    
    private let snowLabel: UILabel = {
        let label = UILabel()
        label.text = "Снег"
        label.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .left
        
        return label
    }()
    
    let mmLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        label.textColor = UIColor(hex6: 0x000000, alpha: 0.5)
        label.textAlignment = .right
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(timeLabel)
        containerView.addSubview(imageView)
        containerView.addSubview(tempLabel)
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
        
        timeLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(6)
            make.trailing.equalToSuperview()
        }
        
        imageView.snp.remakeConstraints { make in
            make.size.equalTo(CGSize(width: 36, height: 29))
            make.centerX.equalToSuperview()
            make.top.equalTo(timeLabel.snp.bottom).offset(8)
        }
        
        tempLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.trailing.equalToSuperview()
        }
        
        popLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(tempLabel.snp.bottom).offset(9)
        }
        
        percentLabel.snp.remakeConstraints { make in
            make.leading.equalTo(popLabel.snp.trailing)
            make.top.equalTo(popLabel)
            make.trailing.equalToSuperview().inset(10)
        }
        
        snowLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(6)
        }
        
        mmLabel.snp.remakeConstraints { make in
            make.leading.equalTo(snowLabel.snp.trailing).offset(6)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(snowLabel)
        }
        
        super.updateConstraints()
    }
}

//
//  HourlyCell.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import UIKit

class HourlyCell: UICollectionViewCell {
    
    // MARK: - View
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor(hex6: 0xFFFFFF)
        view.alwaysBounceHorizontal = true
        view.contentInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0)
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    // MARK: - Lifrcycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(collectionView)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        super.updateConstraints()
    }
}


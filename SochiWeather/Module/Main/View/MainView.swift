//
//  MainView.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/11/21.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    // MARK: - View
    
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = UIColor(hex6: 0xFFFFFF)
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    // MARK: - Lifrcycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
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

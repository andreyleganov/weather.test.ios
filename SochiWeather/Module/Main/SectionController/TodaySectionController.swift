//
//  TodaySectionController.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import IGListKit

class TodaySectionController: ListSectionController {
    
    var model: TodaySectionModel!
    
    private lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self.viewController)
        adapter.dataSource = self
        
        return adapter
    }()
    
    // MARK: - Lifecycle
    
    override init() {
        super.init()
        
        supplementaryViewSource = self
    }
    
    override func didUpdate(to object: Any) {
        model = object as? TodaySectionModel
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.insetContainerSize.width else {
            return .zero
        }
        return CGSize(width: width, height: 148)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: HourlyCell.self, for: self, at: index) as! HourlyCell
        adapter.collectionView = cell.collectionView
        
        return cell
    }
}

// MARK: - ListAdapterDataSource
extension TodaySectionController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = [ListDiffable]()
        objects.append(TodayEmbeddedSectionModel(items: model.items))
        
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return TodayEmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
}

// MARK: - ListSupplementaryViewSource
extension TodaySectionController: ListSupplementaryViewSource {
    
    func supportedElementKinds() -> [String] {
        return [UICollectionView.elementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let view = collectionContext?.dequeueReusableCell(of: HeaderView.self, for: self, at: index) as! HeaderView
        view.titleLabel.text = "Погода сегодня"
        
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        guard let width = collectionContext?.insetContainerSize.width else {
            return .zero
        }
        return CGSize(width: width, height: 19)
    }
    
    
}

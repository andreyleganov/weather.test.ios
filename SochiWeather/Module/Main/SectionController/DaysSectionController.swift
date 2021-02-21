//
//  DaysSectionController.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/20/21.
//

import IGListKit

class DaysSectionController: ListSectionController {
    
    var model: DaysSectionModel!
    
    private lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self.viewController)
        adapter.dataSource = self
        
        return adapter
    }()
    
    // MARK: - Lifecycle
    
    override init() {
        super.init()
        
        inset = UIEdgeInsets(top: 28, left: 0, bottom: 20, right: 0)
    }
    
    override func didUpdate(to object: Any) {
        model = object as? DaysSectionModel
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.insetContainerSize.width else {
            return .zero
        }
        return CGSize(width: width, height: 168)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: DaysCell.self, for: self, at: index) as! DaysCell
        adapter.collectionView = cell.collectionView
        
        return cell
    }
}

// MARK: - ListAdapterDataSource
extension DaysSectionController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = [ListDiffable]()
        objects.append(DaysEmbeddedSectionModel(items: model.items))

        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return DaysEmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
}

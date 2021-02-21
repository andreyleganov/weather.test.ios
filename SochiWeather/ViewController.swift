//
//  ViewController.swift
//  SochiWeather
//
//  Created by Andrey Leganov on 2/11/21.
//

import UIKit
import IGListKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var weather: GeneralResponse!
    
    private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    
    private var mainView: MainView! {
        return view as? MainView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.collectionView = mainView.collectionView
        adapter.dataSource = self
    }
}

// MARK: - ListAdapterDataSource
extension ViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = [ListDiffable]()
        objects.append(DateSectionModel(weather: weather))
        objects.append(TempSectionModel(current: weather.current))
        objects.append(DaysSectionModel(items: weather.daily))
        objects.append(TodaySectionModel(items: weather.hourly))
        
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is DateSectionModel:
            return DateSectionController()
        case is TempSectionModel:
            return TempSectionController()
        case is DaysSectionModel:
            return DaysSectionController()
        case is TodaySectionModel:
            return TodaySectionController()
        default:
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
}

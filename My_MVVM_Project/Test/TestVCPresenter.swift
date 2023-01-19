//
//  TestViewPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 07/01/23.
//

import UIKit
import FSPagerView
protocol TestViewPresenterLogic : PresentationProtocol {
    func handleRefresh()
}
class TestViewPresenter : NSObject, TestViewPresenterLogic {
   
    
    
    var view : TestViewControllerLogic
    var interactor : TestViewInteractorLogic
    var router : TestViewRouterLogic
    var controller : TestViewController?
    var timer : Timer!
    init(view: TestViewControllerLogic, interactor: TestViewInteractorLogic, router: TestViewRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
        
        view.collView.delegate = self
        view.collView.dataSource = self
        view.collView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        
        view.pagerView.delegate = self
        view.pagerView.dataSource = self
        view.pagerView.register(PagerViewCell.self, forCellWithReuseIdentifier: "PagerViewCell")
    }
    
    func handleRefresh() {
        print("Handle Refreshing ........")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }

    @objc func handleTimer(){
        view.refreshControl?.endRefreshing()
        timer.invalidate()
    }
    
}
extension TestViewPresenter : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
//        cell.backgroundColor = .red
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 100))
        imgView.image = UIImage(named: "halyk_push_homebank_inside_1125x2001")
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 8
        cell.contentView.addSubview(imgView)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 100)
    }
    
}

extension TestViewPresenter : FSPagerViewDelegate,FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        4
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "PagerViewCell", at: index) as! PagerViewCell
        cell.modeBlock?(index)
        
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let cell = PagerViewCell()
//        cell.modeBlock?(indexPath.item)
//    }
//

}
enum PagerMode {
    case first
    case other
    
    var getMode : Int {
        switch self {
        case .first:
            return 0
        case .other:
            return 1
        }
    }
}

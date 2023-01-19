//
//  Presenter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation
import UIKit

protocol MyViewPresenterLogic : PresentationProtocol {
    func pushVC()
}
class MyViewPresenter : NSObject, MyViewPresenterLogic {
    
    
    var view : SimpleDisplayLogic?
    var interactor : SimpleInteractorLogic
    var router : SimpleRouterLogic
    
    var controller : MyViewController!
    
    public init(view: SimpleDisplayLogic!, interactor: SimpleInteractorLogic!, router: SimpleRouterLogic!) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setupSubviews()
        view?.setupTargets()
        
        self.view?.imageStoryCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "\(UICollectionViewCell.self)")
        self.view?.imageStoryCollectionView.dataSource = self
        self.view?.imageStoryCollectionView.delegate = self
        
        self.view?.homeValCollView.register(HomeValyutaCollViewCell.self, forCellWithReuseIdentifier: HomeValyutaCollViewCell.identifier)
        self.view?.homeValCollView.delegate = self
        self.view?.homeValCollView.dataSource = self
        
        self.view?.homePlatejiView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onHomePlatejiTapped)))
//        self.controller?.navigationItem.titleView = HomeHeaderView()
    }
    
    func pushVC() {
        self.router.pushVC()
    }
    @objc func onHomePlatejiTapped(){
        self.router.navigationToSettingVC()
    }
}


extension MyViewPresenter : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count : Int!
        if collectionView == self.view?.imageStoryCollectionView {
            count = 5
        }
        else if collectionView == self.view?.homeValCollView {
            count = 3
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var celll : UICollectionViewCell!
        if collectionView == self.view?.imageStoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(UICollectionViewCell.self)", for: indexPath)
            var imageview:UIImageView=UIImageView(frame: CGRect(x: 0, y: 0, width: 170, height: 150))
            imageview.contentMode = .scaleAspectFill
            imageview.clipsToBounds = true
            imageview.layer.cornerRadius = 10
            var img : UIImage = UIImage(named:"halyk_transfer_homebank_inside_1125x2001") ?? UIImage()
            imageview.image = img
            cell.contentView.addSubview(imageview)
            cell.layer.cornerRadius = 12
            cell.backgroundColor = .blue
            celll = cell
        }else if collectionView == self.view?.homeValCollView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeValyutaCollViewCell.identifier)", for: indexPath) as! HomeValyutaCollViewCell
            
            celll = cell
        }
        return celll
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemSize : CGSize!
        if collectionView == self.view?.imageStoryCollectionView {
            itemSize = CGSize(width: 170, height: 150)
        }else if collectionView == self.view?.homeValCollView {
            itemSize = CGSize(width: 270, height: 90)
        }
        return itemSize
    }
    
    
}

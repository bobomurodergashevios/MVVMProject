//
//  HomeViewController.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import UIKit
import ExpandableCell
protocol HomeViewControllerLogic : HomeInstaller {
    func setupTargets()
}
class HomeViewController: UIViewController,HomeViewControllerLogic {
    
    var expTabLeView: ExpandableTableView!
    
    var mainView: UIView!{self.view}
    var presenter : HomePresenterLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        title = "Kapital Agent"
        
        self.navigationController?.navigationBar.backgroundColor = .white
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.setNeedsStatusBarAppearanceUpdate()
        if #available(iOS 13.0, *) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil)
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.standardAppearance = UINavigationBarAppearance()
            self.navigationController?.navigationBar.compactAppearance = UINavigationBarAppearance()
            self.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
//            }
        }
        
    }
    

    
    func setupTargets() {
        self.expTabLeView.expandableDelegate = self
        self.expTabLeView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.expTabLeView.backgroundColor = .yellow
    }
    

}

extension HomeViewController : ExpandableDelegate {
    func numberOfSections(in expandableTableView: ExpandableTableView) -> Int {
        2
    }
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        return [CGFloat(0)]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        return [UITableViewCell(),UITableViewCell(),UITableViewCell()]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expandableTableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.backgroundColor = .red
        cell.textLabel?.text = "OCAP"
        cell.textLabel?.font = .boldSystemFont(ofSize: 19)
        return cell
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("dsjhb")
        presenter?.navToVC()
    }

    
   
}

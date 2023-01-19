//
//  PresentationProtocol.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 15/12/22.
//

import Foundation

import UIKit

protocol PresentationProtocol: AnyObject {
    func viewDidLayoutSubviews()
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

extension PresentationProtocol {

    func viewDidLayoutSubviews() {
        //        fatalError("Implementation pending...")
    }

    func viewDidLoad() {
        //        fatalError("Implementation pending...")
    }

    func viewWillAppear(_ animated: Bool) {
        //        fatalError("Implementation pending...")
    }

    func viewWillDisappear(_ animated: Bool) {
        //        fatalError("Implementation pending...")
    }

    func viewDidAppear(_ animated: Bool) {
        //        fatalError("Implementation pending...")
    }

    func viewDidDisappear(_ animated: Bool) {
        //        fatalError("Implementation pending...")
    }
}

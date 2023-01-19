//
//  PageCellModel.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit


struct PageCellModel {
    
    let title : String?
    let status : String?
    
    init(title: String? = nil, status: String? = nil) {
        self.title = title
        self.status = status
    }
    
    
    
}


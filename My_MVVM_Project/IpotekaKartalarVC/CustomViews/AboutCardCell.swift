//
//  AboutCardCell.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit

class AboutCardCell: UITableViewCell {

    static let identifier = "AboutCardCell"
    var titleLbl : UILabel!
    var statusLbl : UILabel!
    
    var model : PageCellModel! {
        didSet {
            updateCell()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for sv in self.contentView.subviews {
            sv.removeFromSuperview()
        }
        
        titleLbl = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 20))
        titleLbl.textColor = .black
        titleLbl.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(titleLbl)
        
        statusLbl = UILabel(frame: CGRect(x: 10, y: titleLbl.frame.maxY+2, width: 200, height: 30))
        statusLbl.textColor = .black
        statusLbl.font = .boldSystemFont(ofSize: 17)
        self.contentView.addSubview(statusLbl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(){
        titleLbl.text = model.title
        statusLbl.text = model.status
    }
}

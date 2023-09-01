//
//  TableViewCell.swift
//  앱개발 숙련 개인과제
//
//  Created by t2023-m0078 on 2023/08/31.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var isDone: UISwitch!
    static let id = "cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
        
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    
    
}

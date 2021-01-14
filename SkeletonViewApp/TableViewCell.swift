//
//  TableViewCell.swift
//  SkeletonViewApp
//
//  Created by Yevhen Shevchenko on 14.01.2021.
//

import UIKit
import SkeletonView

class TableViewCell: UITableViewCell {
    
    @IBOutlet var customeImageView: UIImageView!
    @IBOutlet var customeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSkeletonable = true
        customeLabel.isSkeletonable = true
        customeLabel.linesCornerRadius = 5
        customeImageView.isSkeletonable = true
        
        customeImageView.layer.cornerRadius = customeImageView.frame.height / 2

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        contentView.frame = contentView.frame.inset(by: edgeInsets)
        contentView.layer.cornerCurve = .continuous
        contentView.layer.cornerRadius = contentView.frame.height / 2
        contentView.layer.borderWidth = 0.3
        contentView.layer.borderColor = UIColor.systemYellow.cgColor
        
    }
}
